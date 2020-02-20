class ApplicationCell < Cell::ViewModel

    include ActionView::Helpers::CaptureHelper
    include ActionView::Helpers::FormOptionsHelper # to avoid collection_select method not found
    include ActionView::Helpers::NumberHelper
    include ActionView::Helpers::TranslationHelper
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::DateHelper
    include ApplicationHelper
    include Cell::LocalErb
    include ERB::Util
    include IconsHelper
    include SimpleForm::ActionViewExtensions::FormHelper
    #include WidgetsHelper
  
    # Obtiene un hash de todas las vistas de cells, mas o menos como el hash de webpacker
    # asi podemos invalidar el cache oportunamente.
    class TemplateHash
      # Vacía el hash de templates
      def self.clear!
        @templates_hash = nil
      end
  
      # Obtiene un hash de todos los templates utilizados en este cell,
      # para usarlo como clave de cache y así actualizar la vista cuando actualicemos
      # la aplicación
      # Es el equivalente del hash que pone webpacker al final
      # @return [String]
      def self.hash
        # Usamos @@ para que de lo mismo desde que clase llamamos
        # Podemos cachear porque en producción no cambiaran los templates sin reiniciar la aplicación
        # En desarrollo usamos clear
        @hash ||= begin
          md5 = Digest::MD5.new
          ApplicationCell.view_paths.flat_map{|p| Dir[File.join(p, '**')]}.each do |filename|
            next if File.directory? filename
            File.open(filename, "rb") do |f|
              buf = ""
              md5.update buf while f.read(16384, buf)
            end
          end
          md5.to_s
        end
      end
    end
  
    # Computes the complete, namespaced cache key for +state+.
    # Editado para que agregue un digest de todas las vistas utilizadas por el cell
    def self.state_cache_key(state, key_parts = {})
      # copiado de cells/lib/cell/caching.rb
      digested_state = [state, TemplateHash.hash]
      super(digested_state, key_parts)
    end
  
    def call *args
      view = args.first || :show
      Rack::MiniProfiler.step("Rendering: #{logging_cell_name(view)}") do
        super
      end
    end
  
    def render_to_string(*)
      # El contenido de un cell es siempre safe
      super.html_safe # rubocop:disable Rails/OutputSafety
    end
  
    def self.option name, default: nil, required: false, &block
      raise "Only one of default or block can be given" if block_given? && !default.nil?
      use_default = !block_given?
      define_overridable_method name do
        options.fetch(name) do
          raise "#{self.class} requiere que le pasen #{name}" if required
          if use_default
            default
          else
            instance_eval(&block)
          end
        end
      end
    end
  
    def parent_controller
      raise "No hay contexto, usaste la funcion cell()?" if context.nil?
      super
    end
    alias controller parent_controller
    
    private def logging_cell_name view
      self.class.to_s + '#' + view.to_s
    end
  end
  
module ApplicationHelper
  
    # Formatea un número para mostrar al usuario. Elimina los decimales redundantes, e inserta separador de miles
    #
    # @param [any] value El valor a formatear
    # @param [Integer] precision El número de dígitos decimales a mostrar. Por defecto 2
    #
    # @return [String] El número formateado
    def printable_number value, precision: 2
      number_with_precision(value, precision: precision, strip_insignificant_zeros: true, delimiter: I18n.t('number.format.delimiter'))
    end
  
    def date_format_long date
      date_format(date, "%e de %B de %Y")
    end
  
    def date_format date, format = :default
      return nil if !date
      I18n.l date.to_date, format: format
    end
  
    def mes_abierto
      @mes_abierto ||= Variable.abierta.mes
    end
  
    # Formatea una fecha para impresion en datepicker
    def formatear_datepicker(date)
      date.strftime '%d-%m-%Y' if date
    end
  
    def formatear_datepicker_mes(date)
      date.strftime '%m-%Y' if date
    end
  
    def formatear_fecha_iso(date)
      date.strftime '%Y-%m-%d' if date
    end
  
    def formatear_mes mes
      I18n.l(mes, format: '%B %Y').capitalize
    end
  
    def display_if cond
      if cond
        return ""
      else
        return "display: none"
      end
    end
  
    def display_none_if cond
      "display: none" if cond
    end
  
    def json obj
      raw obj.to_json # rubocop:disable Rails/OutputSafety
    end
  
    def yes_no_collection include_blank: false
      opts = {
        'Sí' => true,
        'No' => false,
      }
      opts = {"" => ""}.merge(opts) if include_blank
      opts
    end
  
    # translate enum
    def enum_list_translated name, object
      object.class.send("translated_#{name.to_s.pluralize}").map{|t, k, _v| [t, k]}
    end
  
  
    # @param action [Symbol]
    # @param objects [Enumerable]
    def can_all? action, objects
      if objects.respond_to? :accessible_by
        objects.accessible_by(current_ability, action).count == objects.count
      else
        objects.all?{|o| can?(action, o) }
      end
    end
  
    def yes_no_filter name
      content_tag('select', options_for_select(yes_no_collection(include_blank: true)), data: { filter: name }, class: 'form-control input-sm')
    end
  
    # Itera sobre una colección, y genera un tag para cada elemento
    #
    # @param [#each] collection La colección a iterar
    # @param [String] tag_name El tag a generar para cada item
    # @param [Hash] options Atributos html a asignar a cada tag
    # @yieldparam [Object] El item en cada iteración
    #
    # @return [ActiveSupport::SafeBuffer] El html generado
    def tag_each collection, tag_name, options = {}, &block
      output = ActiveSupport::SafeBuffer.new
      collection.each do |item|
        content = capture(item, &block)
        output << tag.send(tag_name, content, options)
      end
      output.freeze
    end
  
    def content_for_args name, *args, &block
      if block_given?
        content_for_args_hash[name] = block
      else
        capture do
          content_for_args_hash[name].call(*args)
        end
      end
    end
  
    private def content_for_args_hash
      @content_for_args_hash ||= {}
    end
  end
  
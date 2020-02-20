module IconsHelper
    # Genera un icono ✓
    #
    # @param [Boolean] color Si pintamos el check de color verde
    # @param [Hash] options Opciones a pasar a (see #fa_icon)
    # @return [String]
    def check color: true, **options
      clase = color ? 'text-success' : nil
      fa_icon('check', clase: clase, options: options)
    end
  
    # ‎Genera un icono X
    #
    # @param [Boolean] color Si pintamos el check de color rojo
    # @param [Hash] options Opciones a pasar a (see #fa_icon)
    # @return [String]
    def cross color: true, **options
      clase = color ? 'text-danger' : nil
      fa_icon('times', clase: clase, options: options)
    end
  
    # Genera un icono ✓ o X, dependiendo del valor de `ok`
    #
    # @param [Boolean] ok
    # @param [Boolean] color Si pintamos el check de color verde o rojo
    # @param [Hash] options Opciones a pasar a (see #fa_icon)
    # @return [String]
    def check_cross ok, color: true, **options
      if ok
        check color: color, **options
      else
        cross color: color, **options
      end
    end
  
    # Genera un icono 🔒 o 🔓, dependiendo del valor de `ok`
    #
    # @param [Boolean] ok
    # @param [Hash] options Opciones a pasar a (see #fa_icon)
    # @return [String]
    def check_lock ok, options = {}
      if ok
        fa_icon :lock, options: options
      else
        fa_icon :unlock, options: options
      end
    end
  
    #
    # Genera un ícono de FontAwesome
    #
    # @param [String|Symbol] name El nombre del icono a usar
    # @param [String] pre Contenido html a prepender al icono
    # @param [String] post Contenido html a concatenar al icono
    # @param [String] clase Clases adicionales a agregar al icono
    # @param [:regular, :solid, :brands] type La familia FA a usar
    # @param [Hash] options Atributos html adicionales a agregar al icono
    #
    # @return [String] El html generado. Es html_safe
    #
    def fa_icon(name, pre: '', post: '', clase: '', type: :solid, options: {})
      options[:class] ||= ''
      pre_name = case type
                 when :regular
                   'far'
                 when :solid
                   'fas'
                 when :brands
                   'fab'
                 else
                   raise "Type no implementado: '#{type}'"
                 end
      options[:class] += " #{pre_name} fa-#{name} #{clase}"
      options['aria-hidden'] = true
      tag = content_tag 'i', '', options
      h(pre) + tag + h(post.html_safe) # rubocop:disable Rails/OutputSafety (TODO: eliminar)
    end
  
    # Debiese moverse a BoxWidget cuando no queden usuarios en vistas rails
    def box_collapse_icon
      # Mantener sincronizado con adminlte.js
      fa_icon(:'angle-down')
    end
  
    # Debiese moverse a BoxWidget cuando no queden usuarios en vistas rails
    def box_expand_icon
      # Mantener sincronizado con adminlte.js
      fa_icon(:'angle-left')
    end
  
    def delete_icon
      fa_icon(:'trash-alt')
    end
  
    def create_icon text = ''
      fa_icon(:plus, post: text)
    end
  
    def edit_icon text = ''
      fa_icon(:'pencil-alt', post: text)
    end
  
    def sortable_icon
      fa_icon('ellipsis-v')
    end
  
    def approve_icon
      fa_icon(:check, clase: 'fa-fw')
    end
  
    def reject_icon
      fa_icon(:close, clase: 'fa fa-fw')
    end
  
    def save_icon
      fa_icon(:save, clase: 'fa-fw')
    end
  
    def saving_icon
      fa_icon(:sync, clase: 'fa-fw fa-spin', post: ' Guardando...')
    end
  
    def button_link_to(name = nil, options = nil, html_options = nil, &block)
      if block_given?
        html_options = options
        options = name
        name = block
      end
      options ||= {}
  
      html_options = convert_options_to_data_attributes(options, html_options)
  
      url = url_for(options)
      html_options["href".freeze] ||= url
      size = html_options[:size] || html_options["size"] || 'sm'
      html_options[:class] = "btn btn-light btn-#{size}"
      content_tag("a".freeze, name || url, html_options, &block)
    end
  
    # @param message [String] Mensaje que aparecerá en el tooltip
    # @return [String] HTML
    def exclamation_tooltip message
      content_tag(:span, fa_icon('exclamation-triangle'), data: { toggle: :tooltip }, title: message)
    end
  
    # @param message [String] Mensaje que aparecerá en el tooltip
    # @return [String] HTML
    def question_tooltip message, placement: :top
      tooltip message, placement: placement do
        fa_icon('question-circle', clase: 'fa-fw')
      end
    end
    def label_with_tooltip label, tooltip_message, placement: :top
      ActiveSupport::SafeBuffer.new + label + " " + question_tooltip(tooltip_message, placement: placement)
    end
  
    # @param message [String] Mensaje que aparecerá en el tooltip
    # @return [String] HTML
    def tooltip message, placement: :top, &block
      content_tag :span, data: { toggle: :tooltip, placement: placement}, title: message, &block
    end
  
  end
  
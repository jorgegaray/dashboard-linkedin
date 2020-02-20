module WidgetHelper
    def chartjs_widget chart_type = 'bar', options: {}
      builder = Widget::Chartjs.new chart_type, options: options
      yield builder
      builder
    end
  
    def table_widget models, show_footer: true, datatable: true, sortable_url: nil, add_sortable_url: nil, **table_options
      builder = Widget::Table::Builder.new(models)
      yield builder
      Widget::Table.new(builder, table_options, show_footer: show_footer, datatable: datatable, sortable_url: sortable_url, add_sortable_url: add_sortable_url)
    end
  
    def info_box_widget title, icon: nil, color: 'default', size: :md, body_class: 'info-box-number'
      builder = Widget::InfoBox::Builder.new title, icon: icon, color: color, view: self, size: size, body_class: body_class
      yield builder
      builder.build
    end
  
    # Genera el box estándar para el contenedor principal de cada página
    #
    # @param [String] title El título de la caja
    # @param [String,Array<String>] icon El ícono. Puede ser un array en cuyo caso se pasaran los argumentos a (see #fa_icon)
    # @param [Hash] box_options parámetros html a aplicar al box
    #
    # @return [String] El box rendereado
    def outer_box title:, icon: nil, box_options: {}
      box_widget :primary, solid: false, **box_options do |box|
        box.title title, icon: icon
        yield box
      end
    end
  
    # Genera un box interno dentro de un `outer_box`
    #
    # @param [String] title El título de la caja
    # @param [Boolean, :collapsed] collapse Si el box debe ser colapsable
    # @param [Hash] box_options parámetros html a aplicar al box
    #
    # @return [String] El box rendereado
    def inner_box title:, collapse: false, box_options: {}
      box_widget :default, solid: true, collapse: collapse, **box_options do |box|
        box.title title
        yield box
      end
    end
  
    # No usar directo, usar `outer_box` o `inner_box`
    private def box_widget type, solid:, collapse: false, skip_header: false, **box_options
      # TODO: pasar box_options como parametro aparte para que no se mezclen
      builder = Widget::Box::Builder.new type, solid: solid, collapse: collapse, view: self, skip_header: skip_header, **box_options
      yield builder
      builder.build
    end
  
    def bar_separator_widget separator: ' ', options: {}, tag: 'span'
      builder = Widget::BarSeparator.new(separator: separator, options: options, tag: tag)
      yield builder
      builder
    end
  
    # Wdiget para estandarizar las acciones de una tabla en estilo y orden
    def table_actions_widget size: :sm
      builder = Widget::TableActions.new size: size
      yield builder
      builder
    end
  
    # Genera un button dropdown de bootstrap
    def botones_compuestos titulo, type: 'primary', direction: 'left', caret: true
      widget = Widget::BotonesCompuestos.new(titulo, type: type, direction: direction, caret: caret)
      yield widget
      widget
    end
  
    def dropdown_toggle title
      widget = Widget::DropdownToggle.new(title)
      yield widget
      widget
    end
  
    def opciones_avanzadas id: nil, titulo: 'Opciones Avanzadas', expand: false, &block
      raise "Se necesita un bloque" unless block_given?
      id ||= "opciones_avanzadas_" + SecureRandom.hex(5)
      content = capture(&block)
      Widget::OpcionesAvanzadas.new(
        id: id,
        titulo: titulo,
        expand: expand,
        content: content
      )
    end
  
    def lupa_detalle contenido = nil, placement: :left, title: 'Detalle', action_text: fa_icon('search-plus'), size: nil, &block
      raise ArgumentError, "Se necesita bloque o contenido" if contenido.nil? && !block_given?
      raise ArgumentError, 'Se necesita solo uno de bloque y contenido' if block_given? && !contenido.nil?
  
      contenido = capture(&block) if contenido.nil?
      contenido = html_escape(contenido) unless contenido.html_safe?
      opciones = {
        toggle: 'popover',
        html: true,
        placement: placement,
        content: contenido,
        container: 'body',
      }
      if size.present?
        opciones['template'] = "<div class='popover popover-#{size}' role='tooltip'><div class='arrow'></div><h3 class='popover-title'></h3><div class='popover-content'></div></div>"
      end
      link_to(action_text, 'javascript:void(0)',  data: opciones, title: title)
    end
  
    def wizard_step_widget
      widget = Widget::WizardStep.new
      yield widget
      widget
    end
  
    #
    # Genera un botón para volver atrás
    #
    # @param [String] back_url La dirección a la que apunta el botón
    #
    # @return [String] El html del botón
    #
    def go_back_button back_url
      link_to 'Volver', back_url, class: "btn btn-default pull-right"
    end
  
    def special_checkbox f, name, title
      cell('special_input/checkbox', f, name: name, title: title)
    end
  
    def alert_widget
      widget = Widget::Alert.new
      yield widget
      widget
    end
  
  end
  module WidgetsHelper
    def chartjs_widget chart_type = 'bar', options: {}
      builder = Widget::Chartjs.new chart_type, options: options
      yield builder
      builder
    end
  
    def table_widget models, show_footer: true, datatable: true, sortable_url: nil, add_sortable_url: nil, **table_options
      builder = Widget::Table::Builder.new(models)
      yield builder
      Widget::Table.new(builder, table_options, show_footer: show_footer, datatable: datatable, sortable_url: sortable_url, add_sortable_url: add_sortable_url)
    end
  
    def info_box_widget title, icon: nil, color: 'default', size: :md, body_class: 'info-box-number'
      builder = Widget::InfoBox::Builder.new title, icon: icon, color: color, view: self, size: size, body_class: body_class
      yield builder
      builder.build
    end
  
    # Genera el box estándar para el contenedor principal de cada página
    #
    # @param [String] title El título de la caja
    # @param [String,Array<String>] icon El ícono. Puede ser un array en cuyo caso se pasaran los argumentos a (see #fa_icon)
    # @param [Hash] box_options parámetros html a aplicar al box
    #
    # @return [String] El box rendereado
    def outer_box title:, icon: nil, box_options: {}
      box_widget :primary, solid: false, **box_options do |box|
        box.title title, icon: icon
        yield box
      end
    end
  
    # Genera un box interno dentro de un `outer_box`
    #
    # @param [String] title El título de la caja
    # @param [Boolean, :collapsed] collapse Si el box debe ser colapsable
    # @param [Hash] box_options parámetros html a aplicar al box
    #
    # @return [String] El box rendereado
    def inner_box title:, collapse: false, box_options: {}
      box_widget :default, solid: true, collapse: collapse, **box_options do |box|
        box.title title
        yield box
      end
    end
  
    # No usar directo, usar `outer_box` o `inner_box`
    private def box_widget type, solid:, collapse: false, skip_header: false, **box_options
      # TODO: pasar box_options como parametro aparte para que no se mezclen
      builder = Widget::Box::Builder.new type, solid: solid, collapse: collapse, view: self, skip_header: skip_header, **box_options
      yield builder
      builder.build
    end
  
    def bar_separator_widget separator: ' ', options: {}, tag: 'span'
      builder = Widget::BarSeparator.new(separator: separator, options: options, tag: tag)
      yield builder
      builder
    end
  
    # Wdiget para estandarizar las acciones de una tabla en estilo y orden
    def table_actions_widget size: :sm
      builder = Widget::TableActions.new size: size
      yield builder
      builder
    end
  
    # Genera un button dropdown de bootstrap
    def botones_compuestos titulo, type: 'primary', direction: 'left', caret: true
      widget = Widget::BotonesCompuestos.new(titulo, type: type, direction: direction, caret: caret)
      yield widget
      widget
    end
  
    def dropdown_toggle title
      widget = Widget::DropdownToggle.new(title)
      yield widget
      widget
    end
  
    def opciones_avanzadas id: nil, titulo: 'Opciones Avanzadas', expand: false, &block
      raise "Se necesita un bloque" unless block_given?
      id ||= "opciones_avanzadas_" + SecureRandom.hex(5)
      content = capture(&block)
      Widget::OpcionesAvanzadas.new(
        id: id,
        titulo: titulo,
        expand: expand,
        content: content
      )
    end
  
    def lupa_detalle contenido = nil, placement: :left, title: 'Detalle', action_text: fa_icon('search-plus'), size: nil, &block
      raise ArgumentError, "Se necesita bloque o contenido" if contenido.nil? && !block_given?
      raise ArgumentError, 'Se necesita solo uno de bloque y contenido' if block_given? && !contenido.nil?
  
      contenido = capture(&block) if contenido.nil?
      contenido = html_escape(contenido) unless contenido.html_safe?
      opciones = {
        toggle: 'popover',
        html: true,
        placement: placement,
        content: contenido,
        container: 'body',
      }
      if size.present?
        opciones['template'] = "<div class='popover popover-#{size}' role='tooltip'><div class='arrow'></div><h3 class='popover-title'></h3><div class='popover-content'></div></div>"
      end
      link_to(action_text, 'javascript:void(0)',  data: opciones, title: title)
    end
  
    def wizard_step_widget
      widget = Widget::WizardStep.new
      yield widget
      widget
    end
  
    #
    # Genera un botón para volver atrás
    #
    # @param [String] back_url La dirección a la que apunta el botón
    #
    # @return [String] El html del botón
    #
    def go_back_button back_url
      link_to 'Volver', back_url, class: "btn btn-default pull-right"
    end
  
    def special_checkbox f, name, title
      cell('special_input/checkbox', f, name: name, title: title)
    end
  
    def alert_widget
      widget = Widget::Alert.new
      yield widget
      widget
    end
  
  end
    
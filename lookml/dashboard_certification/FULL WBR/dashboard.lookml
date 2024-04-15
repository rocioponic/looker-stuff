---
- dashboard: full_wbrmbr_one_pager_qcommerce_certified
  title: FULL WBR/MBR One Pager Q-commerce (CERTIFIED)
  layout: newspaper
  preferred_viewer: dashboards-next
  load_configuration: wait
  description: 'This dashboard compile all main KPIs for QCommerce in terms of # Orders
    and € GMV; Users Growth and Retention; User Experience and Profitability in both
    Weekly and Monthly basis. This dashboard compares data for the business units,  geographic
    fields and '
  preferred_slug: RFpoQLRp5rJg65Xm6bgEvG
  elements:
  - name: GMV + Orders  (Weekly)
    title: GMV + Orders  (Weekly)
    merged_queries:
    - model: central_dm_cert
      explore: order_descriptors
      type: table
      fields: [order_descriptors.order_activated_local_week, order_descriptors.number_of_delivered_orders,
        order_descriptors.sum_total_purchase_eur, order_descriptors.order_activated_local_week_of_year]
      filters:
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_parent_relationship_type: 'NULL'
        order_descriptors.order_final_status: DeliveredStatus
        order_descriptors.order_city_code: ''
        order_descriptors.order_country_code: ''
        order_descriptors.order_country_region: ''
        order_descriptors.order_activated_local_week: ''
      sorts: [order_descriptors.order_activated_local_week desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
        label: WEEK
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: week
        _type_hint: string
      hidden_fields: [order_descriptors.order_activated_local_week_of_year, order_descriptors.order_activated_local_week]
      y_axes: []
    - model: central_dm_cert
      explore: order_descriptors
      type: table
      fields: [order_descriptors.number_of_delivered_orders, order_descriptors.order_activated_local_week,
        order_descriptors.average_total_purchase_eur, number_of_delivered_prime_orders,
        bu_gmv]
      fill_fields: [order_descriptors.order_activated_local_week]
      filters:
        order_descriptors.order_vertical: ''
        order_descriptors.order_subvertical2: ''
        order_descriptors.order_subvertical3: ''
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_parent_relationship_type: 'NULL'
        order_descriptors.order_final_status: DeliveredStatus
        order_descriptors.order_country_region: ''
        order_descriptors.order_activated_local_week: ''
      sorts: [order_descriptors.order_activated_local_week desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        label: Number of Delivered Prime Orders
        based_on: order_descriptors.number_of_delivered_orders
        _kind_hint: measure
        measure: number_of_delivered_prime_orders
        type: count_distinct
        _type_hint: number
        filters:
          order_descriptors.order_is_prime: 'Yes'
      - category: measure
        label: BU GMV (€)
        based_on: order_descriptors.sum_total_purchase_eur
        _kind_hint: measure
        measure: bu_gmv
        type: count_distinct
        _type_hint: number
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: order_descriptors.order_activated_local_week
        source_field_name: order_descriptors.order_activated_local_week
    show_sql_query_menu_options: false
    pinned_columns:
      week: left
    column_order: [week, "$$$_row_numbers_$$$", bu_gmv, bu_gmv_growth, bu_gmv_penetration,
      bu_delivered_orders, bu_growth, bu_aov, glovo_delivered_orders, glovo_growth,
      bu_penetration, bu_penetration_copy]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_labels:
      bu_delivered_orders: BU Delivered Orders (#)
      glovo_delivered_orders: Glovo Delivered Orders (#)
      bu_growth: BU Delivered Orders Growth (%)
      glovo_growth: Glovo Delivered Orders Growth (%)
      bu_penetration: BU Order Penetratrion in Glovo (%)
      order_descriptors.average_total_purchase_eur: BU AOV € (Delivered Orders)
      bu_penetration_copy: Prime Penetration in BU Orders (%)
      bu_gmv_growth: BU GMV € Growth (%)
      bu_gmv_penetration: BU GMV € Penetration (%)
      bu_aov: BU AOV € (Delivered Orders)
      bu_gmv: BU GMV €
      order_descriptors.order_activated_local_week: WEEK
    series_cell_visualizations:
      order_descriptors.number_of_delivered_orders:
        is_active: false
    series_text_format:
      bu_delivered_orders:
        bold: true
      glovo_delivered_orders: {}
      bu_growth:
        italic: true
      glovo_growth:
        italic: true
      bu_penetration:
        bold: true
      order_timelines.order_activated_local_week:
        bold: true
        italic: true
      order_descriptors.average_total_purchase_eur:
        bold: true
        align: right
      bu_penetration_copy: {}
      bu_gmv:
        bold: true
      bu_gmv_growth:
        italic: true
      bu_gmv_penetration: {}
      bu_aov:
        bold: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    series_types: {}
    hidden_fields: [order_descriptors.number_of_delivered_orders, q1_order_descriptors.number_of_delivered_orders,
      number_of_delivered_prime_orders, order_descriptors.sum_total_purchase_eur,
      order_descriptors.average_total_purchase_eur, order_descriptors.order_activated_local_week,
      order_timelines.order_activated_local_week_of_year, order_descriptors.order_activated_local_week_of_year]
    y_axes: []
    overlay: true
    mapperOptions: {}
    hide_totals: false
    hide_row_totals: false
    query_fields:
      measures:
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total delivered orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Number of Delivered Orders
        label_from_parameter:
        label_short: Number of Delivered Orders
        map_layer:
        name: order_descriptors.number_of_delivered_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Delivered Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.number_of_delivered_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1020"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Sum Total Order Purchase Eur
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Sum Total Purchase Eur
        label_from_parameter:
        label_short: Sum Total Purchase Eur
        map_layer:
        name: order_descriptors.sum_total_purchase_eur
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: '"€"#,##0.00'
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Sum Total Purchase Eur
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.sum_total_purchase_eur
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1059"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${order_total_purchase_eur} "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total delivered orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Number of Delivered Orders
        label_from_parameter:
        label_short: Number of Delivered Orders
        map_layer:
        name: q1_order_descriptors.number_of_delivered_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Delivered Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.number_of_delivered_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1020"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Average Total Order Purchase
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Average Total Purchase Eur
        label_from_parameter:
        label_short: Average Total Purchase Eur
        map_layer:
        name: order_descriptors.average_total_purchase_eur
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: average_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: '"€"#,##0.00'
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Average Total Purchase Eur
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.average_total_purchase_eur
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1194"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${order_total_purchase_eur} "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total delivered orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Number of Delivered Prime Orders
        label_from_parameter:
        label_short: Number of Delivered Prime Orders
        map_layer:
        name: number_of_delivered_prime_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Delivered Prime Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: number_of_delivered_prime_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: 'order_descriptors.order_id '
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        - field: order_descriptors.order_is_prime
          condition: 'Yes'
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Sum Total Order Purchase Eur
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: BU GMV (€)
        label_from_parameter:
        label_short: BU GMV (€)
        map_layer:
        name: bu_gmv
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: '"€"#,##0.00'
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: BU GMV (€)
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: bu_gmv
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${order_total_purchase_eur} "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      dimensions:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: Conversion of the same field to local time zone for the city
        enumerations:
        field_group_label: Order Activated Local Date
        fill_style: range
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Order Descriptors Order Activated Local Week
        label_from_parameter:
        label_short: Order Activated Local Week
        map_layer:
        name: order_descriptors.order_activated_local_week
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: date_week
        user_attribute_filter_types:
        - datetime
        - advanced_filter_datetime
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group: order_descriptors.order_activated_local
        error:
        field_group_variant: Week
        measure: false
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.order_activated_local_week
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: true
        can_time_filter: false
        time_interval:
          name: week
          count: 1
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=612"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_activated_local_at "
        sql_case:
        filters:
        times_used: 0
        sorted:
          desc: false
          sort_index: 0
      - align: right
        can_filter: false
        category: dimension
        default_filter_value:
        description: Conversion of the same field to local time zone for the city
        enumerations:
        field_group_label: Order Activated Local Date
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Order Activated Local Week of Year
        label_from_parameter:
        label_short: Order Activated Local Week of Year
        map_layer:
        name: order_descriptors.order_activated_local_week_of_year
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: date_week_of_year
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group: order_descriptors.order_activated_local
        error:
        field_group_variant: Week of Year
        measure: false
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.order_activated_local_week_of_year
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=612"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_activated_local_at "
        sql_case:
        filters:
        times_used: 0
      - type: string
        align: left
        measure: false
        dynamic: false
        can_pivot: false
        name: week
        label: WEEK
        value_format:
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      table_calculations:
      - label: BU GMV Growth
        name: bu_gmv_growth
        expression: "(${bu_gmv}/(offset(${bu_gmv},-1)-1))-1"
        can_pivot: true
        sortable: false
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU GMV (€) Penetration (%)
        name: bu_gmv_penetration
        expression: "${bu_gmv}/${order_descriptors.sum_total_purchase_eur}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU Delivered Orders
        name: bu_delivered_orders
        expression: "${q1_order_descriptors.number_of_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: BU Growth (%)
        name: bu_growth
        expression: "(${bu_delivered_orders}/(offset(${bu_delivered_orders},-1)-1))-1"
        can_pivot: true
        sortable: false
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU AOV
        name: bu_aov
        expression: "${order_descriptors.average_total_purchase_eur}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: '"€"#,##0.00'
        is_numeric: true
      - label: Glovo Delivered Orders
        name: glovo_delivered_orders
        expression: "${order_descriptors.number_of_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: Glovo Growth (%)
        name: glovo_growth
        expression: "(${glovo_delivered_orders}/(offset(${glovo_delivered_orders},-1)-1))-1"
        can_pivot: true
        sortable: false
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU Penetration (%)
        name: bu_penetration
        expression: "${bu_delivered_orders}/${glovo_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU Penetration (%) Copy
        name: bu_penetration_copy
        expression: "${number_of_delivered_prime_orders}/${bu_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      pivots: []
    sorts: [order_descriptors.order_activated_local_week]
    dynamic_fields:
    - category: table_calculation
      expression: "(${bu_gmv}/(offset(${bu_gmv},-1)-1))-1"
      label: BU GMV Growth
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_gmv_growth
      _type_hint: number
    - category: table_calculation
      expression: "${bu_gmv}/${order_descriptors.sum_total_purchase_eur}"
      label: BU GMV (€) Penetration (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_gmv_penetration
      _type_hint: number
    - category: table_calculation
      expression: "${q1_order_descriptors.number_of_delivered_orders}"
      label: BU Delivered Orders
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: bu_delivered_orders
      _type_hint: number
    - category: table_calculation
      expression: "(${bu_delivered_orders}/(offset(${bu_delivered_orders},-1)-1))-1"
      label: BU Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_growth
      _type_hint: number
    - category: table_calculation
      expression: "${order_descriptors.average_total_purchase_eur}"
      label: BU AOV
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: bu_aov
      _type_hint: number
    - category: table_calculation
      expression: "${order_descriptors.number_of_delivered_orders}"
      label: Glovo Delivered Orders
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: glovo_delivered_orders
      _type_hint: number
    - category: table_calculation
      expression: "(${glovo_delivered_orders}/(offset(${glovo_delivered_orders},-1)-1))-1"
      label: Glovo Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: glovo_growth
      _type_hint: number
    - category: table_calculation
      expression: "${bu_delivered_orders}/${glovo_delivered_orders}"
      label: BU Penetration (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_penetration
      _type_hint: number
    - category: table_calculation
      expression: "${number_of_delivered_prime_orders}/${bu_delivered_orders}"
      label: BU Penetration (%) Copy
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_penetration_copy
      _type_hint: number
    listen:
    - Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Activated Local Week: order_descriptors.order_activated_local_week
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
    - Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Activated Local Week: order_descriptors.order_activated_local_week
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    row: 14
    col: 2
    width: 11
    height: 6
  - name: "€ GMV + Orders # "
    type: text
    title_text: "€ GMV + Orders # "
    subtitle_text: B. Unit & Glovo
    body_text: ''
    row: 9
    col: 0
    width: 2
    height: 6
  - name: Users and Retention
    type: text
    title_text: Users and Retention
    subtitle_text: B. Unit & Glovo
    body_text: ''
    row: 15
    col: 0
    width: 2
    height: 6
  - name: Users & Retention (Weekly)
    title: Users & Retention (Weekly)
    merged_queries:
    - model: central_dm_cert
      explore: order_descriptors
      type: table
      fields: [order_descriptors.order_activated_local_week, number_of_users, order_descriptors.order_activated_local_week_of_year]
      filters:
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_final_status: DeliveredStatus
        order_descriptors.order_city_code: ''
        order_descriptors.order_country_code: ''
        order_descriptors.order_country_region: ''
      sorts: [order_descriptors.order_activated_local_week desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        expression: ''
        label: Number of Users
        based_on: order_descriptors.customer_id
        _kind_hint: measure
        measure: number_of_users
        type: count_distinct
        _type_hint: number
      - category: table_calculation
        expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
        label: WEEK
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: week
        _type_hint: string
      hidden_fields: []
      y_axes: []
    - model: central_dm_cert
      explore: order_descriptors
      type: table
      fields: [order_descriptors.order_activated_local_week, bu_number_of_users, bu_number_of_prime_users_1]
      fill_fields: [order_descriptors.order_activated_local_week]
      filters:
        order_descriptors.order_vertical: ''
        order_descriptors.order_subvertical2: ''
        order_descriptors.order_subvertical: ''
        order_descriptors.order_subvertical3: ''
        order_descriptors.order_final_status: DeliveredStatus
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_country_region: ''
        order_descriptors.order_activated_local_week: ''
      sorts: [order_descriptors.order_activated_local_week desc]
      limit: 500
      dynamic_fields:
      - category: measure
        expression: ''
        label: BU Number of Users
        based_on: order_descriptors.customer_id
        _kind_hint: measure
        measure: bu_number_of_users
        type: count_distinct
        _type_hint: number
      - category: measure
        expression: ''
        label: 'BU Number of Prime Users '
        based_on: order_descriptors.customer_id
        _kind_hint: measure
        measure: bu_number_of_prime_users
        type: count_distinct
        _type_hint: number
        filters:
          order_descriptors.order_is_prime: 'Yes'
      - category: measure
        expression: ''
        label: 'BU Number of Prime Users '
        based_on: order_descriptors.customer_id
        _kind_hint: measure
        measure: bu_number_of_prime_users_1
        type: count_distinct
        _type_hint: number
        filters:
          order_descriptors.order_is_prime: 'Yes'
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: order_descriptors.order_activated_local_week
        source_field_name: order_descriptors.order_activated_local_week
    - model: central_dm_cert
      explore: order_descriptors
      type: table
      fields: [order_descriptors.order_activated_local_week, first_order_tag_derived.count_NCs]
      fill_fields: [order_descriptors.order_activated_local_week]
      filters:
        order_descriptors.order_final_status: DeliveredStatus
        order_descriptors.order_activated_local_week: 1 weeks ago for 1 weeks
        order_descriptors.p_creation_date: 365 days
        first_order_tag_derived.tag_order_subvertical: ''
        first_order_tag_derived.tag_order_subvertical2: ''
        first_order_tag_derived.tag_order_subvertical3: ''
        first_order_tag_derived.tag_order_vertical: ''
      sorts: [order_descriptors.order_activated_local_week desc]
      limit: 500
      column_limit: 50
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: order_descriptors.order_activated_local_week
        source_field_name: order_descriptors.order_activated_local_week
    show_sql_query_menu_options: false
    pinned_columns:
      week: left
    column_order: [week, bu_number_of_users, bu_growth, bu_new_users, bu_recurrent_users,
      bu_prime_user_penetration, glovo_active_users, glovo_growth, bu_penetration]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_labels:
      bu_delivered_orders: 'BU Delivered Orders #'
      glovo_delivered_orders: "<b>Glovo</b> Delivered Orders #"
      bu_growth: BU Active Users Growth (%)
      glovo_growth: Glovo Active Users Growth (%)
      bu_penetration: BU User Penetratrion in Glovo (%)
      bu_number_of_users: BU Active Users (#)
      glovo_active_users: Glovo Active Users (#)
      order_descriptors.order_activated_local_week: WEEK
    series_column_widths:
      week: 148
      bu_number_of_users: 147
    series_cell_visualizations:
      order_descriptors.number_of_delivered_orders:
        is_active: false
    series_text_format:
      bu_delivered_orders:
        bold: true
      glovo_delivered_orders: {}
      bu_growth:
        italic: true
      glovo_growth:
        italic: true
      bu_penetration:
        bold: true
      order_timelines.order_activated_local_week:
        bold: true
        italic: true
      bu_prime_user_penetration:
        bold: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    series_types: {}
    hidden_fields: [q1_order_descriptors.number_of_delivered_orders, bu_number_of_prime_users_1,
      number_of_users, order_descriptors.order_activated_local_week, order_timelines.order_activated_local_week_of_year,
      first_order_tag_derived.count_NC_week, first_order_tag_derived.count_NCs, order_descriptors.order_activated_local_week_of_year]
    y_axes: []
    overlay: true
    mapperOptions: {}
    hide_totals: false
    hide_row_totals: false
    query_fields:
      measures:
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Number of Users
        label_from_parameter:
        label_short: Number of Users
        map_layer:
        name: number_of_users
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Users
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: number_of_users
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: number_of_users
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: BU Number of Users
        label_from_parameter:
        label_short: BU Number of Users
        map_layer:
        name: bu_number_of_users
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: BU Number of Users
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: bu_number_of_users
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: bu_number_of_users
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: 'BU Number of Prime Users '
        label_from_parameter:
        label_short: 'BU Number of Prime Users '
        map_layer:
        name: bu_number_of_prime_users_1
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: 'BU Number of Prime Users '
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: bu_number_of_prime_users_1
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: bu_number_of_prime_users_1
        sql_case:
        filters:
        - field: order_descriptors.order_is_prime
          condition: 'Yes'
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: |-
          Count users that placed its first tagged order in the time/location/BU
                that you're showing.

                NOTE: This count all the orders that are the first tagged order, considering
                the Tag {####} filters
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: First Order Tag Derived Count NCs
        label_from_parameter:
        label_short: Count NCs
        map_layer:
        name: first_order_tag_derived.count_NCs
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: first_order_tag_derived
        view_label: First Order Tag Derived
        dynamic: false
        week_start_day: monday
        original_view: first_order_tag_derived
        dimension_group:
        error:
        field_group_variant: Count NCs
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: first_order_tag_derived
        suggest_dimension: first_order_tag_derived.count_NCs
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Ffirst_order_tag_derived.view.lkml?line=507"
        permanent: true
        source_file: central_dm/views/first_order_tag_derived.view.lkml
        source_file_path: data_mesh/central_dm/views/first_order_tag_derived.view.lkml
        sql: "CASE WHEN ${order_is_tag_first_order}\n                            \
          \ THEN ${first_order_tag_derived.customer_id}\n                        ELSE\
          \ null END "
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      dimensions:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: Conversion of the same field to local time zone for the city
        enumerations:
        field_group_label: Order Activated Local Date
        fill_style: range
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Order Descriptors Order Activated Local Week
        label_from_parameter:
        label_short: Order Activated Local Week
        map_layer:
        name: order_descriptors.order_activated_local_week
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: date_week
        user_attribute_filter_types:
        - datetime
        - advanced_filter_datetime
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group: order_descriptors.order_activated_local
        error:
        field_group_variant: Week
        measure: false
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.order_activated_local_week
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: true
        can_time_filter: false
        time_interval:
          name: week
          count: 1
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=612"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_activated_local_at "
        sql_case:
        filters:
        times_used: 0
        sorted:
          desc: false
          sort_index: 0
      - align: right
        can_filter: false
        category: dimension
        default_filter_value:
        description: Conversion of the same field to local time zone for the city
        enumerations:
        field_group_label: Order Activated Local Date
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Order Activated Local Week of Year
        label_from_parameter:
        label_short: Order Activated Local Week of Year
        map_layer:
        name: order_descriptors.order_activated_local_week_of_year
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: date_week_of_year
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group: order_descriptors.order_activated_local
        error:
        field_group_variant: Week of Year
        measure: false
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.order_activated_local_week_of_year
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=612"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_activated_local_at "
        sql_case:
        filters:
        times_used: 0
      - type: string
        align: left
        measure: false
        dynamic: false
        can_pivot: false
        name: week
        label: WEEK
        value_format:
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      table_calculations:
      - label: BU Growth (%)
        name: bu_growth
        expression: "(${bu_number_of_users}/(offset(${bu_number_of_users},-1)-1))-1"
        can_pivot: true
        sortable: false
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU New Users
        name: bu_new_users
        expression: "${first_order_tag_derived.count_NCs}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: BU Recurrent Users
        name: bu_recurrent_users
        expression: "${bu_number_of_users} - ${bu_new_users}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: 'BU Prime User Penetration (%) '
        name: bu_prime_user_penetration
        expression: "${bu_number_of_prime_users_1}/${bu_number_of_users}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: Glovo Active Users
        name: glovo_active_users
        expression: "${number_of_users}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: Glovo Growth (%)
        name: glovo_growth
        expression: "(${number_of_users}/(offset(${number_of_users},-1)-1))-1"
        can_pivot: true
        sortable: false
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU Penetration (%)
        name: bu_penetration
        expression: "${bu_number_of_users}/${number_of_users}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      pivots: []
    sorts: [order_descriptors.order_activated_local_week]
    dynamic_fields:
    - category: table_calculation
      expression: "(${bu_number_of_users}/(offset(${bu_number_of_users},-1)-1))-1"
      label: BU Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_growth
      _type_hint: number
    - category: table_calculation
      expression: "${first_order_tag_derived.count_NCs}"
      label: BU New Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: bu_new_users
      _type_hint: number
    - category: table_calculation
      expression: "${bu_number_of_users} - ${bu_new_users}"
      label: BU Recurrent Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: bu_recurrent_users
      _type_hint: number
    - category: table_calculation
      expression: "${bu_number_of_prime_users_1}/${bu_number_of_users}"
      label: 'BU Prime User Penetration (%) '
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_prime_user_penetration
      _type_hint: number
    - category: table_calculation
      expression: "${number_of_users}"
      label: Glovo Active Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: glovo_active_users
      _type_hint: number
    - category: table_calculation
      expression: "(${number_of_users}/(offset(${number_of_users},-1)-1))-1"
      label: Glovo Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: glovo_growth
      _type_hint: number
    - category: table_calculation
      expression: "${bu_number_of_users}/${number_of_users}"
      label: BU Penetration (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_penetration
      _type_hint: number
    listen:
    - Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Activated Local Week: order_descriptors.order_activated_local_week
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
    - Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Activated Local Week: order_descriptors.order_activated_local_week
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    - Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      # Order Activated Local Week: order_descriptors.order_activated_local_week
      Order Subvertical2 (BU): first_order_tag_derived.tag_order_subvertical2
      Order Subvertical3 (BU): first_order_tag_derived.tag_order_subvertical3
      Store Is Specialty? (BU): first_order_tag_derived.tag_is_specialties
      Store Sub-Business Unit (BU): first_order_tag_derived.tag_sub_business_unit
      Store Name (BU): first_order_tag_derived.tag_store_name
      # Store ID (BU): first_order_tag_derived.tag_store_id
      MFC Name (BU): first_order_tag_derived.tag_mfc_name
      Subregion: order_descriptors.order_country_subregion
      # Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): first_order_tag_derived.tag_order_vertical
      Order Subvertical (BU): first_order_tag_derived.tag_order_subvertical
    row: 20
    col: 2
    width: 11
    height: 6
  - name: UX
    type: text
    title_text: UX
    subtitle_text: B. Unit
    body_text: ''
    row: 21
    col: 0
    width: 2
    height: 5
  - title: BU GMV (€) - Weekly
    name: BU GMV (€) - Weekly
    model: central_dm_cert
    explore: order_descriptors
    type: looker_column
    fields: [order_descriptors.order_activated_local_week, order_descriptors.sum_total_purchase_eur,
      order_descriptors.order_activated_local_week_of_year, q_c_bus]
    pivots: [q_c_bus]
    filters:
      order_descriptors.order_parent_relationship_type: 'NULL'
      order_descriptors.order_final_status: DeliveredStatus
      order_descriptors.order_country_region: ''
    sorts: [week]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
      label: WEEK
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: week
      _type_hint: string
    - category: dimension
      expression: "if(${first_order_tag_derived.first_tagged_order_order_subvertical}\
        \ = \"MFC\",\n  \"MFC\", \n  if(${first_order_tag_derived.first_tagged_order_order_subvertical2}\
        \ = \"Retail\",\n  ${first_order_tag_derived.first_tagged_order_order_subvertical3},\n\
        \  ${first_order_tag_derived.first_tagged_order_order_subvertical2}))"
      label: First Tagged Order BU
      value_format:
      value_format_name:
      dimension: first_tagged_order_bu
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "if(${order_descriptors.order_subvertical} = \"MFC\",\n  \"MFC\"\
        , \n  if(${order_descriptors.order_subvertical2} = \"Retail\",\n  ${order_descriptors.order_subvertical3},\n\
        \  ${order_descriptors.order_subvertical2}))"
      label: Q-C BUs - MFC or Subverticals
      value_format:
      value_format_name:
      dimension: q_c_bus_mfc_or_subverticals
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: |-
        if(${stores.is_specialty},
          "Specialties",
          if(${order_descriptors.order_subvertical} = "MFC",
          "MFC",
            if(${order_descriptors.order_subvertical2} = "Retail",
              ${order_descriptors.order_subvertical3},
              ${order_descriptors.order_subvertical2}
            )
          )
        )
      label: 'Q-C BUs '
      value_format:
      value_format_name:
      dimension: q_c_bus
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_fields: [order_descriptors.order_activated_local_week, order_descriptors.order_activated_local_week_of_year]
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Activated Local Week: order_descriptors.order_activated_local_week
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    row: 44
    col: 0
    width: 12
    height: 15
  - name: Subverticals Contributions
    type: text
    title_text: Subverticals Contributions
    subtitle_text: B. Unit
    body_text: ''
    row: 42
    col: 0
    width: 24
    height: 2
  - title: BU Delivered Orders - Weekly
    name: BU Delivered Orders - Weekly
    model: central_dm_cert
    explore: order_descriptors
    type: looker_column
    fields: [order_descriptors.order_activated_local_week, order_descriptors.number_of_delivered_orders,
      order_descriptors.order_activated_local_week_of_year, q_c_bus]
    pivots: [q_c_bus]
    filters:
      order_descriptors.order_parent_relationship_type: 'NULL'
      order_descriptors.order_final_status: DeliveredStatus
      order_descriptors.order_country_region: ''
    sorts: [q_c_bus, order_descriptors.order_activated_local_week]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
      label: WEEK
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: week
      _type_hint: string
    - category: dimension
      expression: "if(${first_order_tag_derived.first_tagged_order_order_subvertical}\
        \ = \"MFC\",\n  \"MFC\", \n  if(${first_order_tag_derived.first_tagged_order_order_subvertical2}\
        \ = \"Retail\",\n  ${first_order_tag_derived.first_tagged_order_order_subvertical3},\n\
        \  ${first_order_tag_derived.first_tagged_order_order_subvertical2}))"
      label: First Order Tagged BU
      value_format:
      value_format_name:
      dimension: first_order_tagged_bu
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: |-
        if(${stores.is_specialty},
          "Specialties",
          if(${order_descriptors.order_subvertical} = "MFC",
          "MFC",
            if(${order_descriptors.order_subvertical2} = "Retail",
              ${order_descriptors.order_subvertical3},
              ${order_descriptors.order_subvertical2}
            )
          )
        )
      label: Q-C BUs
      value_format:
      value_format_name:
      dimension: q_c_bus
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_fields: [order_descriptors.order_activated_local_week, order_descriptors.order_activated_local_week_of_year]
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Activated Local Week: order_descriptors.order_activated_local_week
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    row: 59
    col: 0
    width: 12
    height: 15
  - title: BU NC - Weekly
    name: BU NC - Weekly
    model: central_dm_cert
    explore: order_descriptors
    type: looker_column
    fields: [order_descriptors.order_activated_local_week, order_descriptors.order_activated_local_week_of_year,
      first_orders_levels.store_subvertical3, first_orders_levels.number_of_new_customers_subvertical3]
    pivots: [first_orders_levels.store_subvertical3]
    filters:
      order_descriptors.order_final_status: DeliveredStatus
      order_descriptors.order_country_region: ''
    sorts: [first_orders_levels.store_subvertical3, week]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
      label: WEEK
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: week
      _type_hint: string
    - category: dimension
      expression: "if(${first_order_tag_derived.first_tagged_order_order_subvertical}\
        \ = \"MFC\",\n  \"MFC\", \n  if(${first_order_tag_derived.first_tagged_order_order_subvertical2}\
        \ = \"Retail\",\n  ${first_order_tag_derived.first_tagged_order_order_subvertical3},\n\
        \  ${first_order_tag_derived.first_tagged_order_order_subvertical2}))"
      label: First Tagged Order BU
      value_format:
      value_format_name:
      dimension: first_tagged_order_bu
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_fields: [order_descriptors.order_activated_local_week, order_descriptors.order_activated_local_week_of_year]
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Activated Local Week: order_descriptors.order_activated_local_week
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    row: 74
    col: 0
    width: 12
    height: 15
  - name: GMV + Orders  (Monthly)
    title: GMV + Orders  (Monthly)
    merged_queries:
    - model: central_dm_cert
      explore: order_descriptors
      type: table
      fields: [order_descriptors.number_of_delivered_orders, order_descriptors.sum_total_purchase_eur,
        order_descriptors.order_activated_local_month]
      fill_fields: [order_descriptors.order_activated_local_month]
      filters:
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_parent_relationship_type: 'NULL'
        order_descriptors.order_final_status: DeliveredStatus
        order_descriptors.order_city_code: ''
        order_descriptors.order_country_code: ''
        order_descriptors.order_country_region: ''
        #order_descriptors.order_activated_local_month: 1 months
      sorts: [order_descriptors.order_activated_local_month desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
        label: WEEK
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: week
        _type_hint: string
        is_disabled: true
      hidden_fields: []
      y_axes: []
    - model: central_dm_cert
      explore: order_descriptors
      type: table
      fields: [order_descriptors.number_of_delivered_orders, order_descriptors.average_total_purchase_eur,
        number_of_delivered_prime_orders, bu_gmv, order_descriptors.order_activated_local_month]
      fill_fields: [order_descriptors.order_activated_local_month]
      filters:
        order_descriptors.order_vertical: ''
        order_descriptors.order_subvertical2: ''
        #order_descriptors.order_subvertical: "-Quiero"
        order_descriptors.order_subvertical3: ''
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_parent_relationship_type: 'NULL'
        order_descriptors.order_final_status: DeliveredStatus
        order_descriptors.order_country_region: ''
        #order_descriptors.order_activated_local_month: 1 months
      sorts: [order_descriptors.order_activated_local_month desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        label: Number of Delivered Prime Orders
        based_on: order_descriptors.number_of_delivered_orders
        _kind_hint: measure
        measure: number_of_delivered_prime_orders
        type: count_distinct
        _type_hint: number
        filters:
          order_descriptors.order_is_prime: 'Yes'
      - category: measure
        label: BU GMV (€)
        based_on: order_descriptors.sum_total_purchase_eur
        _kind_hint: measure
        measure: bu_gmv
        type: count_distinct
        _type_hint: number
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: order_descriptors.order_activated_local_month
        source_field_name: order_descriptors.order_activated_local_month
    show_sql_query_menu_options: false
    pinned_columns:
      order_descriptors.order_activated_local_month: left
    column_order: [order_descriptors.order_activated_local_month, bu_gmv, bu_gmv_growth,
      bu_gmv_penetration, bu_delivered_orders, bu_growth, bu_aov, glovo_delivered_orders,
      glovo_growth, bu_penetration, bu_penetration_copy]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_labels:
      bu_delivered_orders: BU Delivered Orders (#)
      glovo_delivered_orders: Glovo Delivered Orders (#)
      bu_growth: BU Delivered Orders Growth (%)
      glovo_growth: Glovo Delivered Orders Growth (%)
      bu_penetration: BU Order Penetratrion in Glovo (%)
      order_timelines.order_activated_local_week: WEEK
      order_descriptors.average_total_purchase_eur: BU AOV € (Delivered Orders)
      bu_penetration_copy: Prime Penetration in BU Orders (%)
      bu_gmv_growth: BU GMV € Growth (%)
      bu_gmv_penetration: BU GMV € Penetration (%)
      bu_aov: BU AOV € (Delivered Orders)
      bu_gmv: BU GMV €
    series_cell_visualizations:
      order_descriptors.number_of_delivered_orders:
        is_active: false
    series_text_format:
      bu_delivered_orders:
        bold: true
      glovo_delivered_orders: {}
      bu_growth:
        italic: true
      glovo_growth:
        italic: true
      bu_penetration:
        bold: true
      order_timelines.order_activated_local_week:
        bold: true
        italic: true
      order_descriptors.average_total_purchase_eur:
        bold: true
        align: right
      bu_penetration_copy: {}
      bu_gmv:
        bold: true
      bu_gmv_growth:
        italic: true
      bu_gmv_penetration: {}
      bu_aov:
        bold: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    series_types: {}
    hidden_fields: [order_descriptors.number_of_delivered_orders, q1_order_descriptors.number_of_delivered_orders,
      number_of_delivered_prime_orders, order_descriptors.sum_total_purchase_eur,
      order_descriptors.average_total_purchase_eur]
    y_axes: []
    overlay: true
    mapperOptions: {}
    hide_totals: false
    hide_row_totals: false
    query_fields:
      measures:
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total delivered orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Number of Delivered Orders
        label_from_parameter:
        label_short: Number of Delivered Orders
        map_layer:
        name: order_descriptors.number_of_delivered_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Delivered Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.number_of_delivered_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1020"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Sum Total Order Purchase Eur
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Sum Total Purchase Eur
        label_from_parameter:
        label_short: Sum Total Purchase Eur
        map_layer:
        name: order_descriptors.sum_total_purchase_eur
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: '"€"#,##0.00'
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Sum Total Purchase Eur
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.sum_total_purchase_eur
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1059"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${order_total_purchase_eur} "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total delivered orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Number of Delivered Orders
        label_from_parameter:
        label_short: Number of Delivered Orders
        map_layer:
        name: q1_order_descriptors.number_of_delivered_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Delivered Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.number_of_delivered_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1020"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Average Total Order Purchase
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Average Total Purchase Eur
        label_from_parameter:
        label_short: Average Total Purchase Eur
        map_layer:
        name: order_descriptors.average_total_purchase_eur
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: average_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: '"€"#,##0.00'
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Average Total Purchase Eur
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.average_total_purchase_eur
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1194"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${order_total_purchase_eur} "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total delivered orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Number of Delivered Prime Orders
        label_from_parameter:
        label_short: Number of Delivered Prime Orders
        map_layer:
        name: number_of_delivered_prime_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Delivered Prime Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: number_of_delivered_prime_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: 'order_descriptors.order_id '
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        - field: order_descriptors.order_is_prime
          condition: 'Yes'
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Sum Total Order Purchase Eur
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: BU GMV (€)
        label_from_parameter:
        label_short: BU GMV (€)
        map_layer:
        name: bu_gmv
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: sum
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: '"€"#,##0.00'
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: BU GMV (€)
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: bu_gmv
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${order_total_purchase_eur} "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      dimensions:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: Conversion of the same field to local time zone for the city
        enumerations:
        field_group_label: Order Activated Local Date
        fill_style: range
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Order Descriptors Order Activated Local Month
        label_from_parameter:
        label_short: Order Activated Local Month
        map_layer:
        name: order_descriptors.order_activated_local_month
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: date_month
        user_attribute_filter_types:
        - datetime
        - advanced_filter_datetime
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group: order_descriptors.order_activated_local
        error:
        field_group_variant: Month
        measure: false
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.order_activated_local_month
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: true
        can_time_filter: false
        time_interval:
          name: month
          count: 1
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=612"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_activated_local_at "
        sql_case:
        filters:
        times_used: 0
        sorted:
          desc: false
          sort_index: 0
      table_calculations:
      - label: BU GMV Growth
        name: bu_gmv_growth
        expression: "(${bu_gmv}/(offset(${bu_gmv},-1)-1))-1"
        can_pivot: true
        sortable: false
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU GMV (€) Penetration (%)
        name: bu_gmv_penetration
        expression: "${bu_gmv}/${order_descriptors.sum_total_purchase_eur}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU Delivered Orders
        name: bu_delivered_orders
        expression: "${q1_order_descriptors.number_of_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: BU Growth (%)
        name: bu_growth
        expression: "(${bu_delivered_orders}/(offset(${bu_delivered_orders},-1)-1))-1"
        can_pivot: true
        sortable: false
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU AOV
        name: bu_aov
        expression: "${order_descriptors.average_total_purchase_eur}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: '"€"#,##0.00'
        is_numeric: true
      - label: Glovo Delivered Orders
        name: glovo_delivered_orders
        expression: "${order_descriptors.number_of_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: Glovo Growth (%)
        name: glovo_growth
        expression: "(${glovo_delivered_orders}/(offset(${glovo_delivered_orders},-1)-1))-1"
        can_pivot: true
        sortable: false
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU Penetration (%)
        name: bu_penetration
        expression: "${bu_delivered_orders}/${glovo_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU Penetration (%) Copy
        name: bu_penetration_copy
        expression: "${number_of_delivered_prime_orders}/${bu_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      pivots: []
    sorts: [order_descriptors.order_activated_local_month]
    dynamic_fields:
    - category: table_calculation
      expression: "(${bu_gmv}/(offset(${bu_gmv},-1)-1))-1"
      label: BU GMV Growth
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_gmv_growth
      _type_hint: number
    - category: table_calculation
      expression: "${bu_gmv}/${order_descriptors.sum_total_purchase_eur}"
      label: BU GMV (€) Penetration (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_gmv_penetration
      _type_hint: number
    - category: table_calculation
      expression: "${q1_order_descriptors.number_of_delivered_orders}"
      label: BU Delivered Orders
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: bu_delivered_orders
      _type_hint: number
    - category: table_calculation
      expression: "(${bu_delivered_orders}/(offset(${bu_delivered_orders},-1)-1))-1"
      label: BU Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_growth
      _type_hint: number
    - category: table_calculation
      expression: "${order_descriptors.average_total_purchase_eur}"
      label: BU AOV
      value_format:
      value_format_name: eur
      _kind_hint: measure
      table_calculation: bu_aov
      _type_hint: number
    - category: table_calculation
      expression: "${order_descriptors.number_of_delivered_orders}"
      label: Glovo Delivered Orders
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: glovo_delivered_orders
      _type_hint: number
    - category: table_calculation
      expression: "(${glovo_delivered_orders}/(offset(${glovo_delivered_orders},-1)-1))-1"
      label: Glovo Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: glovo_growth
      _type_hint: number
    - category: table_calculation
      expression: "${bu_delivered_orders}/${glovo_delivered_orders}"
      label: BU Penetration (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_penetration
      _type_hint: number
    - category: table_calculation
      expression: "${number_of_delivered_prime_orders}/${bu_delivered_orders}"
      label: BU Penetration (%) Copy
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_penetration_copy
      _type_hint: number
    listen:
    - Order Activated Local Month: order_descriptors.order_activated_local_month
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
    - Order Activated Local Month: order_descriptors.order_activated_local_month
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    row: 14
    col: 13
    width: 11
    height: 6
  - name: Users & Retention  (Monthly)
    title: Users & Retention  (Monthly)
    merged_queries:
    - model: central_dm_cert
      explore: order_descriptors
      type: table
      fields: [number_of_users, order_descriptors.order_activated_local_month]
      fill_fields: [order_descriptors.order_activated_local_month]
      filters:
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_final_status: DeliveredStatus
        order_descriptors.order_city_code: ''
        order_descriptors.order_country_code: ''
        order_descriptors.order_country_region: ''
        #order_descriptors.order_activated_local_month: 1 months
      sorts: [order_descriptors.order_activated_local_month desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        expression: ''
        label: Number of Users
        based_on: order_descriptors.customer_id
        _kind_hint: measure
        measure: number_of_users
        type: count_distinct
        _type_hint: number
      - category: table_calculation
        expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
        label: WEEK
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: week
        _type_hint: string
        is_disabled: true
      hidden_fields: []
      y_axes: []
    - model: central_dm_cert
      explore: order_descriptors
      type: table
      fields: [bu_number_of_users, bu_number_of_prime_users_1, order_descriptors.order_activated_local_month]
      fill_fields: [order_descriptors.order_activated_local_month]
      filters:
        order_descriptors.order_vertical: ''
        order_descriptors.order_subvertical2: ''
        order_descriptors.order_subvertical: ''
        order_descriptors.order_subvertical3: ''
        order_descriptors.order_final_status: DeliveredStatus
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_country_region: ''
        #order_descriptors.order_activated_local_month: 1 months
      limit: 500
      dynamic_fields:
      - category: measure
        expression: ''
        label: BU Number of Users
        based_on: order_descriptors.customer_id
        _kind_hint: measure
        measure: bu_number_of_users
        type: count_distinct
        _type_hint: number
      - category: measure
        expression: ''
        label: 'BU Number of Prime Users '
        based_on: order_descriptors.customer_id
        _kind_hint: measure
        measure: bu_number_of_prime_users
        type: count_distinct
        _type_hint: number
        filters:
          order_descriptors.order_is_prime: 'Yes'
      - category: measure
        expression: ''
        label: 'BU Number of Prime Users '
        based_on: order_descriptors.customer_id
        _kind_hint: measure
        measure: bu_number_of_prime_users_1
        type: count_distinct
        _type_hint: number
        filters:
          order_descriptors.order_is_prime: 'Yes'
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: order_descriptors.order_activated_local_month
        source_field_name: order_descriptors.order_activated_local_month
    - model: central_dm_cert
      explore: order_descriptors
      type: table
      fields: [order_descriptors.order_activated_local_month, first_order_tag_derived.count_NCs]
      fill_fields: [order_descriptors.order_activated_local_month]
      filters:
        order_descriptors.order_final_status: DeliveredStatus
        first_order_tag_derived.tag_order_subvertical: ''
        first_order_tag_derived.tag_order_subvertical2: ''
        first_order_tag_derived.tag_order_subvertical3: ''
        first_order_tag_derived.tag_order_country: ''
        first_order_tag_derived.tag_order_city: ''
        first_order_tag_derived.tag_order_vertical: ''
        first_order_tag_derived.tag_store_name: ''
        #order_descriptors.order_activated_local_month: 1 months
        order_descriptors.order_activated_local_date: ''
      sorts: [order_descriptors.order_activated_local_month desc]
      limit: 500
      hidden_pivots: {}
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: order_descriptors.order_activated_local_month
        source_field_name: order_descriptors.order_activated_local_month
    show_sql_query_menu_options: false
    pinned_columns:
      order_descriptors.order_activated_local_month: left
    column_order: [order_descriptors.order_activated_local_month, bu_number_of_users,
      bu_growth, bu_new_users, bu_recurrent_users, bu_prime_user_penetration, glovo_active_users,
      glovo_growth, bu_penetration]
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    series_labels:
      bu_delivered_orders: 'BU Delivered Orders #'
      glovo_delivered_orders: "<b>Glovo</b> Delivered Orders #"
      bu_growth: BU Active Users Growth (%)
      glovo_growth: Glovo Active Users Growth (%)
      bu_penetration: BU User Penetratrion in Glovo (%)
      order_timelines.order_activated_local_week: WEEK
      bu_number_of_users: BU Active Users (#)
      glovo_active_users: Glovo Active Users (#)
    series_column_widths:
      order_descriptors.order_activated_local_month: 165
      bu_number_of_users: 135
    series_cell_visualizations:
      order_descriptors.number_of_delivered_orders:
        is_active: false
    series_text_format:
      bu_delivered_orders:
        bold: true
      glovo_delivered_orders: {}
      bu_growth:
        italic: true
      glovo_growth:
        italic: true
      bu_penetration:
        bold: true
      order_timelines.order_activated_local_week:
        bold: true
        italic: true
      bu_prime_user_penetration:
        bold: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    series_types: {}
    hidden_fields: [q1_order_descriptors.number_of_delivered_orders, bu_number_of_prime_users_1,
      number_of_users, first_order_tag_derived.count_NC_month, first_order_tag_derived.count_NCs]
    y_axes: []
    overlay: true
    mapperOptions: {}
    hide_totals: false
    hide_row_totals: false
    query_fields:
      measures:
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Number of Users
        label_from_parameter:
        label_short: Number of Users
        map_layer:
        name: number_of_users
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Users
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: number_of_users
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: number_of_users
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: BU Number of Users
        label_from_parameter:
        label_short: BU Number of Users
        map_layer:
        name: bu_number_of_users
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: BU Number of Users
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: bu_number_of_users
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: bu_number_of_users
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: 'BU Number of Prime Users '
        label_from_parameter:
        label_short: 'BU Number of Prime Users '
        map_layer:
        name: bu_number_of_prime_users_1
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: 'BU Number of Prime Users '
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: bu_number_of_prime_users_1
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: bu_number_of_prime_users_1
        sql_case:
        filters:
        - field: order_descriptors.order_is_prime
          condition: 'Yes'
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: |-
          Count users that placed its first tagged order in the time/location/BU
                that you're showing.

                NOTE: This count all the orders that are the first tagged order, considering
                the Tag {####} filters
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: First Order Tag Derived Count NCs
        label_from_parameter:
        label_short: Count NCs
        map_layer:
        name: first_order_tag_derived.count_NCs
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: first_order_tag_derived
        view_label: First Order Tag Derived
        dynamic: false
        week_start_day: monday
        original_view: first_order_tag_derived
        dimension_group:
        error:
        field_group_variant: Count NCs
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: first_order_tag_derived
        suggest_dimension: first_order_tag_derived.count_NCs
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Ffirst_order_tag_derived.view.lkml?line=507"
        permanent: true
        source_file: central_dm/views/first_order_tag_derived.view.lkml
        source_file_path: data_mesh/central_dm/views/first_order_tag_derived.view.lkml
        sql: "CASE WHEN ${order_is_tag_first_order}\n                            \
          \ THEN ${first_order_tag_derived.customer_id}\n                        ELSE\
          \ null END "
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      dimensions:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: Conversion of the same field to local time zone for the city
        enumerations:
        field_group_label: Order Activated Local Date
        fill_style: range
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Order Descriptors Order Activated Local Month
        label_from_parameter:
        label_short: Order Activated Local Month
        map_layer:
        name: order_descriptors.order_activated_local_month
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: date_month
        user_attribute_filter_types:
        - datetime
        - advanced_filter_datetime
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group: order_descriptors.order_activated_local
        error:
        field_group_variant: Month
        measure: false
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.order_activated_local_month
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: true
        can_time_filter: false
        time_interval:
          name: month
          count: 1
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=612"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_activated_local_at "
        sql_case:
        filters:
        times_used: 0
        sorted:
          desc: false
          sort_index: 0
      table_calculations:
      - label: BU Growth (%)
        name: bu_growth
        expression: "(${bu_number_of_users}/(offset(${bu_number_of_users},-1)-1))-1"
        can_pivot: true
        sortable: false
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU New Users
        name: bu_new_users
        expression: "${first_order_tag_derived.count_NCs}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: BU Recurrent Users
        name: bu_recurrent_users
        expression: "${bu_number_of_users} - ${bu_new_users}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: 'BU Prime User Penetration (%) '
        name: bu_prime_user_penetration
        expression: "${bu_number_of_prime_users_1}/${bu_number_of_users}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: Glovo Active Users
        name: glovo_active_users
        expression: "${number_of_users}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format:
        is_numeric: true
      - label: Glovo Growth (%)
        name: glovo_growth
        expression: "(${number_of_users}/(offset(${number_of_users},-1)-1))-1"
        can_pivot: true
        sortable: false
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BU Penetration (%)
        name: bu_penetration
        expression: "${bu_number_of_users}/${number_of_users}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      pivots: []
    sorts: [order_descriptors.order_activated_local_month]
    dynamic_fields:
    - category: table_calculation
      expression: "(${bu_number_of_users}/(offset(${bu_number_of_users},-1)-1))-1"
      label: BU Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_growth
      _type_hint: number
    - category: table_calculation
      expression: "${first_order_tag_derived.count_NCs}"
      label: BU New Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: bu_new_users
      _type_hint: number
    - category: table_calculation
      expression: "${bu_number_of_users} - ${bu_new_users}"
      label: BU Recurrent Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: bu_recurrent_users
      _type_hint: number
    - category: table_calculation
      expression: "${bu_number_of_prime_users_1}/${bu_number_of_users}"
      label: 'BU Prime User Penetration (%) '
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_prime_user_penetration
      _type_hint: number
    - category: table_calculation
      expression: "${number_of_users}"
      label: Glovo Active Users
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: glovo_active_users
      _type_hint: number
    - category: table_calculation
      expression: "(${number_of_users}/(offset(${number_of_users},-1)-1))-1"
      label: Glovo Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: glovo_growth
      _type_hint: number
    - category: table_calculation
      expression: "${bu_number_of_users}/${number_of_users}"
      label: BU Penetration (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_penetration
      _type_hint: number
    listen:
    - Order Activated Local Month: order_descriptors.order_activated_local_month
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
    - Order Activated Local Month: order_descriptors.order_activated_local_month
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    - Order Activated Local Month: order_descriptors.order_activated_local_month
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Subvertical2 (BU): first_order_tag_derived.tag_order_subvertical2
      Order Subvertical3 (BU): first_order_tag_derived.tag_order_subvertical3
      Store Is Specialty? (BU): first_order_tag_derived.tag_is_specialties
      Store Sub-Business Unit (BU): first_order_tag_derived.tag_sub_business_unit
      Store Name (BU): first_order_tag_derived.tag_store_name
      #Store ID (BU): first_order_tag_derived.tag_store_id
      MFC Name (BU): first_order_tag_derived.tag_mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): first_order_tag_derived.tag_order_vertical
      Order Subvertical (BU): first_order_tag_derived.tag_order_subvertical
    row: 20
    col: 13
    width: 11
    height: 6
  - title: BU NC  - Monthly
    name: BU NC  - Monthly
    model: central_dm_cert
    explore: order_descriptors
    type: looker_column
    fields: [order_descriptors.order_activated_local_month, first_orders_levels.store_subvertical3,
      first_orders_levels.number_of_new_customers_subvertical3]
    pivots: [first_orders_levels.store_subvertical3]
    fill_fields: [order_descriptors.order_activated_local_month]
    filters:
      order_descriptors.order_final_status: DeliveredStatus
      order_descriptors.order_country_region: ''
    sorts: [order_descriptors.order_activated_local_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
      label: WEEK
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: week
      _type_hint: string
      is_disabled: true
    - category: dimension
      expression: "if(${first_order_tag_derived.first_tagged_order_order_subvertical}\
        \ = \"MFC\",\n  \"MFC\", \n  if(${first_order_tag_derived.first_tagged_order_order_subvertical2}\
        \ = \"Retail\",\n  ${first_order_tag_derived.first_tagged_order_order_subvertical3},\n\
        \  ${first_order_tag_derived.first_tagged_order_order_subvertical2}))"
      label: First Tagged Order BU
      value_format:
      value_format_name:
      dimension: first_tagged_order_bu
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_fields: []
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Order Activated Local Month: order_descriptors.order_activated_local_month
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    row: 74
    col: 12
    width: 12
    height: 15
  - title: BU GMV (€) - Monthly
    name: BU GMV (€) - Monthly
    model: central_dm_cert
    explore: order_descriptors
    type: looker_column
    fields: [order_descriptors.sum_total_purchase_eur, order_descriptors.order_activated_local_month,
      q_c_bus]
    pivots: [q_c_bus]
    fill_fields: [order_descriptors.order_activated_local_month]
    filters:
      order_descriptors.order_parent_relationship_type: 'NULL'
      order_descriptors.order_final_status: DeliveredStatus
      order_descriptors.order_country_region: ''
    sorts: [q_c_bus, order_descriptors.order_activated_local_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
      label: WEEK
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: week
      _type_hint: string
      is_disabled: true
    - category: dimension
      expression: "if(${first_order_tag_derived.first_tagged_order_order_subvertical}\
        \ = \"MFC\",\n  \"MFC\", \n  if(${first_order_tag_derived.first_tagged_order_order_subvertical2}\
        \ = \"Retail\",\n  ${first_order_tag_derived.first_tagged_order_order_subvertical3},\n\
        \  ${first_order_tag_derived.first_tagged_order_order_subvertical2}))"
      label: First Tagged Order BU
      value_format:
      value_format_name:
      dimension: first_tagged_order_bu
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: |-
        if(${stores.is_specialty},
          "Specialties",
          if(${order_descriptors.order_subvertical} = "MFC",
          "MFC",
            if(${order_descriptors.order_subvertical2} = "Retail",
              ${order_descriptors.order_subvertical3},
              ${order_descriptors.order_subvertical2}
            )
          )
        )
      label: Q-C BUs
      value_format:
      value_format_name:
      dimension: q_c_bus
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_fields: []
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Order Activated Local Month: order_descriptors.order_activated_local_month
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    row: 44
    col: 12
    width: 12
    height: 15
  - title: BU Delivered Orders - Monthly
    name: BU Delivered Orders - Monthly
    model: central_dm_cert
    explore: order_descriptors
    type: looker_column
    fields: [order_descriptors.number_of_delivered_orders, order_descriptors.order_activated_local_month,
      q_c_bus]
    pivots: [q_c_bus]
    fill_fields: [order_descriptors.order_activated_local_month]
    filters:
      order_descriptors.order_parent_relationship_type: 'NULL'
      order_descriptors.order_final_status: DeliveredStatus
      order_descriptors.order_country_region: ''
    sorts: [q_c_bus, order_descriptors.order_activated_local_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
      label: WEEK
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: week
      _type_hint: string
      is_disabled: true
    - category: dimension
      expression: "if(${first_order_tag_derived.first_tagged_order_order_subvertical}\
        \ = \"MFC\",\n  \"MFC\", \n  if(${first_order_tag_derived.first_tagged_order_order_subvertical2}\
        \ = \"Retail\",\n  ${first_order_tag_derived.first_tagged_order_order_subvertical3},\n\
        \  ${first_order_tag_derived.first_tagged_order_order_subvertical2}))"
      label: First Order Tagged BU
      value_format:
      value_format_name:
      dimension: first_order_tagged_bu
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: |-
        if(${stores.is_specialty},
          "Specialties",
          if(${order_descriptors.order_subvertical} = "MFC",
          "MFC",
            if(${order_descriptors.order_subvertical2} = "Retail",
              ${order_descriptors.order_subvertical3},
              ${order_descriptors.order_subvertical2}
            )
          )
        )
      label: Q-C BUs
      value_format:
      value_format_name:
      dimension: q_c_bus
      _kind_hint: dimension
      _type_hint: string
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_fields: []
    hidden_pivots: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Order Activated Local Month: order_descriptors.order_activated_local_month
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    row: 59
    col: 12
    width: 12
    height: 15
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"IMPORTANT","underline":true,"bold":true,"color":"hsl(0,
      100%, 50%)"}],"id":1676997953860},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","children":[{"text":"Partition
      key","bold":true},{"text":": "},{"text":"This dashboard uses a partition key
      to improve performance. This partition reduces the amount of data that the dashboard
      is looking into. For example, selecting “Last 6 months” will look at data created
      in the last 6 months. You should always select a Partition Key with a date range
      more extensive than the “WEEK” and “Order Activated Local Month\".","fontSize":"14px","backgroundColor":"rgb(255,
      255, 255)","color":"rgb(38, 45, 51)"}],"id":1686059891001}],"id":1686059891001},{"type":"li","children":[{"type":"lic","children":[{"text":"Remake","bold":true},{"text":"/"},{"text":"Split","bold":true},{"text":"/"},{"text":"Reorder
      ","bold":true},{"text":"orders "},{"text":"unconsidered","underline":true},{"text":"."}],"id":1680603748521}],"id":1680603748154},{"type":"li","children":[{"type":"lic","children":[{"text":"GMV
      ","bold":true},{"text":"is calculated as the SUM of Total Orders Purchase."}],"id":1678369270542}],"id":1680603748524},{"type":"li","children":[{"type":"lic","children":[{"text":"Store
      Subvertical ","bold":true},{"text":"is MFC or QCPartners, because "},{"text":"we
      don''t wish to take Quiero into account","bold":true},{"text":" when analyzing
      Q-Commerce."}],"id":1678891170765}],"id":1680603748522}],"id":1680603754546},{"type":"p","children":[{"text":""}],"id":1680603755915},{"type":"p","id":1680603732949,"children":[{"underline":true,"text":"INSTRUCTIONS:"}]},{"type":"ul","children":[{"type":"li","children":[{"type":"lic","id":1676887789465,"children":[{"text":"Use
      the proper codes in "},{"text":"Region","bold":true},{"text":", "},{"text":"Country
      ","bold":true},{"text":"and "},{"text":"City ","bold":true},{"text":"in CAPITAL
      LETTERS (don''t wait for suggested values)."}]}],"id":1676887790650},{"type":"li","children":[{"type":"lic","children":[{"text":"To
      distinguish between GEN1, GEN2 and Pickup → "},{"text":"Order Handling Strategy","bold":true}],"id":1676887999174}],"id":1676887999174}],"id":1676997953860}]'
    rich_content_json: '{"format":"slate"}'
    row: 2
    col: 0
    width: 24
    height: 3
  - name: UX Metrics
    type: text
    title_text: UX Metrics
    subtitle_text: ''
    body_text: "**Cancellations w/o Self Cancel. < 5min:** consider those Cancellations\
      \ that were NOT Self Cancellations occurred in less than 5 min of creation\n\
      \  \n**BR due to missing/wrong product:** consider unique orders with _feedback_submitted_option_\
      \ = wrong or missing products (either accessed through THUMBS DOWN or HELP).\
      \ PERCENTAGE OVER DELIVERED ORDERS.\n\n\n**PNA:** sum of UNIQUE 1) Groceries\
      \ Delivered Orders that had had either a replacement or removal 2) Delivered\
      \ Orders with _feedback_submitted_option_ due to wrong or missing product (either\
      \ via THUMBS DOWN or HELP) and 3) Canceled Orders with _cancel_reason_ = wrong\
      \ or missing products. PERCENTAGE OVER TOTAL ORDERS."
    row: 31
    col: 0
    width: 24
    height: 4
  - name: " (Copy)"
    type: text
    title_text: " (Copy)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"FYI","underline":true},{"text":":This
      Dashboard uses "},{"text":"Verticals, Sub Verticals, Store/MFC Names","bold":true},{"text":"
      for filtering NC/RC, check the correspondencies below.\n"},{"text":"By default
      is Q-Commerce.","italic":true},{"text":"\n"}],"id":1674487332751},{"type":"p","children":[{"text":"Vertical                Sub
      Vertical           Sub Vertical 2           Sub Vertical 3","bold":true}],"indent":2,"id":1674487332751},{"type":"p","children":[{"text":"Qcommerce       Quiero                      Quiero                         Quiero"}],"indent":2,"id":1674487332751},{"type":"p","children":[{"text":"Qcommerce       MFC                         Groceries                    Groceries
      "}],"indent":2,"id":1674487409467},{"type":"p","children":[{"text":"Qcommerce       MFC                         Retail                           Health"}],"indent":2,"id":1674487409467},{"type":"p","children":[{"text":"Qcommerce       MFC                         Retail                           Shops"}],"indent":2,"id":1674487409467},{"type":"p","children":[{"text":"Qcommerce       MFC                         Retail                           Smoking"}],"indent":2,"id":1674487409468},{"type":"p","children":[{"text":"Qcommerce       QCPartners             Groceries                    Groceries
      "}],"indent":2,"id":1674487332752},{"type":"p","children":[{"text":"Qcommerce       QCPartners             Retail                           Health"}],"indent":2,"id":1674487332752},{"type":"p","children":[{"text":"Qcommerce       QCPartners             Retail                           Shops"}],"indent":2,"id":1674487332752},{"type":"p","children":[{"text":"Qcommerce       QCPartners             Retail                           Smoking"}],"indent":2,"id":1674487332752},{"type":"p","children":[{"text":"","bold":true}],"id":1674487463450},{"type":"p","id":1674487465453,"children":[{"text":"Source:","bold":true},{"text":"
      Using Data Mesh’s Product Order Descriptors."}]},{"type":"p","children":[{"text":"\n\n"}],"id":1674487463450},{"type":"p","indent":2,"id":1674487443187,"children":[{"text":""}]}]'
    rich_content_json: '{"format":"slate"}'
    row: 5
    col: 0
    width: 24
    height: 4
  - name: Profitability
    type: text
    title_text: Profitability
    subtitle_text: B. Unit
    body_text: ''
    row: 35
    col: 0
    width: 2
    height: 4
  - title: WIP Profitability (Weekly)
    name: WIP Profitability (Weekly)
    model: finance_dm_cert
    explore: financial_order_metrics
    type: looker_grid
    fields: [financial_order_metrics.order_started_local_at_week, financial_order_metrics.avg_cm0_eur,
      financial_order_metrics.avg_RPO, financial_order_metrics.avg_CPO]
    fill_fields: [financial_order_metrics.order_started_local_at_week]
    filters: {}
    sorts: [financial_order_metrics.order_started_local_at_week]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [financial_order_metrics.order_started_local_at_week, financial_order_metrics.avg_cm0_eur,
      financial_order_metrics.avg_RPO, financial_order_metrics.avg_CPO]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      financial_order_metrics.avg_RPO:
        is_active: false
    defaults_version: 1
    overlay: true
    mapperOptions: {}
    hidden_pivots: {}
    y_axes: []
    pinned_columns:
      financial_order_metrics.order_started_local_at_week: left
    listen:
      Order Handling Strategy: financial_order_metrics.order_handling_strategy
      Country: financial_order_metrics.order_country_code
      City: financial_order_metrics.order_city_code
      Order Is Prime (Yes / No): financial_order_metrics.order_is_prime
      Order Activated Local Week: financial_order_metrics.order_started_local_at_week
      Order Subvertical2 (BU): financial_order_metrics.order_subvertical2
      Store Name (BU): financial_order_metrics.store_name
      Store ID (BU): financial_order_metrics.store_id
      Partition key (Order Creation Date): financial_order_metrics.p_creation_date
      Order Vertical (BU): financial_order_metrics.order_vertical
      Order Subvertical (BU): financial_order_metrics.order_subvertical
    row: 35
    col: 2
    width: 11
    height: 4
  - title: WIP Profitability (Monthly)
    name: WIP Profitability (Monthly)
    model: finance_dm_cert
    explore: financial_order_metrics
    type: looker_grid
    fields: [financial_order_metrics.order_started_local_at_month, financial_order_metrics.avg_cm0_eur,
      financial_order_metrics.avg_RPO, financial_order_metrics.avg_CPO]
    fill_fields: [financial_order_metrics.order_started_local_at_month]
    filters: {}
    sorts: [financial_order_metrics.order_started_local_at_month]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [financial_order_metrics.order_started_local_at_month, financial_order_metrics.avg_cm0_eur,
      financial_order_metrics.avg_RPO, financial_order_metrics.avg_CPO]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      financial_order_metrics.avg_RPO:
        is_active: false
    defaults_version: 1
    overlay: true
    mapperOptions: {}
    y_axes: []
    pinned_columns:
      financial_order_metrics.order_started_local_at_month: left
    listen:
      Order Activated Local Month: financial_order_metrics.order_started_local_at_month
      Order Handling Strategy: financial_order_metrics.order_handling_strategy
      Country: financial_order_metrics.order_country_code
      City: financial_order_metrics.order_city_code
      Order Is Prime (Yes / No): financial_order_metrics.order_is_prime
      Order Subvertical2 (BU): financial_order_metrics.order_subvertical2
      Store Name (BU): financial_order_metrics.store_name
      Store ID (BU): financial_order_metrics.store_id
      Partition key (Order Creation Date): financial_order_metrics.p_creation_date
      Order Vertical (BU): financial_order_metrics.order_vertical
      Order Subvertical (BU): financial_order_metrics.order_subvertical
    row: 35
    col: 13
    width: 11
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      The source of the Profitability table comes from the Finance Team, but is *not aligned with the P&L yet*.

      *Note: Order Subvertical 3, Store is Specialty, Store Sub-Business Unit and MFC Name don't work here.*
    row: 39
    col: 0
    width: 11
    height: 3
  - name: UX (Weekly)
    title: UX (Weekly)
    merged_queries:
    - model: central_dm_cert
      explore: order_descriptors
      type: looker_grid
      fields: [order_descriptors.order_activated_local_week, order_descriptors.number_of_cancelled_orders,
        order_descriptors.number_of_orders, number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes,
        bu_dt, wt_at_pickup, order_descriptors.number_of_delivered_orders, order_descriptors.order_activated_local_week_of_year,
        ratings.number_of_orders_with_negative_rating, order_pna.percentage_of_orders_with_pna_cancellations,
        order_pna.percentage_of_orders_with_pna]
      filters:
        order_descriptors.order_subvertical: ''
        order_descriptors.order_subvertical2: ''
        order_descriptors.order_subvertical3: ''
        order_descriptors.store_id: ''
        order_descriptors.store_name: ''
        order_descriptors.order_vertical: ''
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_is_partner_order: ''
        order_descriptors.order_parent_relationship_type: 'NULL'
        order_descriptors.order_activated_local_week: ''
        order_descriptors.p_creation_date: ''
      sorts: [order_descriptors.order_activated_local_week]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: "${order_descriptors.number_of_cancelled_orders}/${order_descriptors.number_of_orders}"
        label: Cancellations (%)
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        table_calculation: cancellations
        _type_hint: number
      - category: table_calculation
        expression: "(${order_descriptors.number_of_cancelled_orders} - ${number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes})/${order_descriptors.number_of_orders}"
        label: Cancellations w/o Self-Cancelled in 5 min (%)
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        table_calculation: cancellations_wo_self_cancelled_in_5_min
        _type_hint: number
      - category: measure
        expression: "diff_seconds(${order_descriptors.order_created_local_raw}, ${order_descriptors.order_terminated_local_raw})\
          \ / 60.0 <= 5 \n OR (\n  NOT is_null(${order_descriptors.order_scheduled_local_raw})\n\
          \ AND (is_null(${order_descriptors.order_activated_local_raw})\n OR diff_seconds(${order_descriptors.order_activated_local_month},\
          \ ${order_descriptors.order_terminated_local_raw}) / 60.0 <= 5))"
        label: Number of Canceled Orders without Self Cancelation in less than 5 minutes
        based_on: order_descriptors.number_of_cancelled_orders
        filter_expression: "diff_seconds(${order_descriptors.order_created_local_raw},\
          \ ${order_descriptors.order_terminated_local_raw}) / 60.0 <= 5 \n OR (\n\
          \  NOT is_null(${order_descriptors.order_scheduled_local_raw})\n AND (is_null(${order_descriptors.order_activated_local_raw})\n\
          \ OR diff_seconds(${order_descriptors.order_activated_local_month}, ${order_descriptors.order_terminated_local_raw})\
          \ / 60.0 <= 5))"
        _kind_hint: measure
        measure: number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes
        type: count_distinct
        _type_hint: number
        filters:
          order_descriptors.order_cancel_reason: '"SELF_CANCELLATION",UNKNOWN,OTHER,"DELIVERY_TAKING_TOO_LONG","CUSTOMER_DOESNT_WANT_PRODUCTS","CUSTOMER_REFUSED"'
      - category: measure
        expression: ''
        label: Average of Minutes Delivered Order Duration
        value_format: 0.# "min"
        value_format_name: __custom
        based_on: order_descriptors.minutes_delivery_duration
        _kind_hint: measure
        measure: average_of_minutes_delivered_order_duration
        type: average
        _type_hint: number
      - category: measure
        expression: ''
        label: Average of Minutes Waiting time pickup
        value_format: 0.# "min"
        value_format_name: __custom
        based_on: order_descriptors.minutes_waiting_time_pickup
        _kind_hint: measure
        measure: average_of_minutes_waiting_time_pickup
        type: average
        _type_hint: number
      - category: measure
        label: BU DT
        value_format: 0.# "min"
        value_format_name: __custom
        based_on: order_descriptors.average_delivery_duration
        _kind_hint: measure
        measure: bu_dt
        type: count_distinct
        _type_hint: number
      - category: measure
        label: WT at Pickup
        value_format: 0.# "min"
        value_format_name: __custom
        based_on: order_descriptors.average_waiting_time_pickup
        _kind_hint: measure
        measure: wt_at_pickup
        type: count_distinct
        _type_hint: number
      - category: table_calculation
        expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
        label: WEEK
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: week
        _type_hint: string
      - category: measure
        label: Cancelled PNA
        based_on: order_descriptors.number_of_cancelled_orders
        _kind_hint: measure
        measure: cancelled_pna
        type: count_distinct
        _type_hint: number
        filters:
          order_descriptors.order_cancel_reason: '"PRODUCTS_NOT_AVAILABLE"'
      - category: table_calculation
        expression: "${order_pna.percentage_of_orders_with_pna_cancellations}"
        label: Cancellations by PNA
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        table_calculation: cancellations_by_pna
        _type_hint: number
      - category: table_calculation
        expression: "${ratings.number_of_orders_with_negative_rating} / ${order_descriptors.number_of_delivered_orders}"
        label: BR / Del. Orders (%)
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        table_calculation: br_del_orders
        _type_hint: number
      - category: table_calculation
        expression: "${order_pna.percentage_of_orders_with_pna}"
        label: PNA (%)
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        table_calculation: pna
        _type_hint: number
      show_view_names: false
      show_row_numbers: true
      transpose: true
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: editable
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: '12'
      rows_font_size: '12'
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      truncate_header: false
      series_labels:
        average_of_minutes_delivered_order_duration: BU Delivery Time
        average_of_minutes_waiting_time_pickup: WT at PickUp
      series_cell_visualizations:
        average_of_minutes_delivered_order_duration:
          is_active: false
      series_text_format:
        cancellations_wo_self_cancelled_in_5_min:
          bold: true
        cancellations:
          bold: true
        bu_dt:
          align: right
        wt_at_pickup:
          align: right
          bold: true
      hidden_fields: [order_descriptors.number_of_cancelled_orders, order_descriptors.number_of_orders,
        number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes,
        order_descriptors.number_of_delivered_orders, ratings.number_of_orders_with_negative_rating,
        order_pna.percentage_of_orders_with_pna_cancellations]
      truncate_column_names: false
      defaults_version: 1
      y_axes: []
      hidden_pivots: {}
    - model: central_dm_cert
      explore: order_feedback_facts
      type: looker_line
      fields: [order_descriptors.order_activated_local_week, order_feedback_facts.number_of_order_store_wrong_or_missing_products,
        order_feedback_facts.feedback_all_store, count_order_id_feedback_facts, total_orders_with_selected_option_not_null]
      fill_fields: [order_descriptors.order_activated_local_week]
      filters:
        order_descriptors.order_subvertical: ''
        order_descriptors.order_subvertical2: ''
        order_descriptors.order_subvertical3: ''
        order_descriptors.order_vertical: ''
        order_descriptors.store_id: ''
        order_descriptors.store_name: ''
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_is_partner_order: ''
        order_descriptors.order_parent_relationship_type: 'NULL'
        order_descriptors.order_activated_local_week: ''
      sorts: [order_descriptors.order_activated_local_week desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: measure
        expression: ''
        label: Count Order ID Feedback Facts
        based_on: order_feedback_facts.order_id
        _kind_hint: measure
        measure: count_order_id_feedback_facts
        type: count_distinct
        _type_hint: number
      - category: measure
        label: Total Orders with Selected Option not Null
        based_on: order_descriptors.number_of_orders
        _kind_hint: measure
        measure: total_orders_with_selected_option_not_null
        type: count_distinct
        _type_hint: number
        filters:
          order_feedback_facts.selected_option: "-NULL"
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: order_descriptors.order_activated_local_week
        source_field_name: order_descriptors.order_activated_local_week
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_labels:
      br_due_to_wm_items_delivered_orders: BR due W/M items / Del. Orders (%)
      cancelled_pna: Cancellations because of PNA (%)
      cancellations_by_pna: Cancellations because of PNA (%)
    series_cell_visualizations:
      bu_dt:
        is_active: false
    series_text_format:
      bu_dt:
        align: right
      wt_at_pickup:
        bold: true
        align: right
      cancellations_wo_self_cancelled_in_5_min:
        bold: true
      cancellations:
        bold: true
      bu_delivery_time_delivered_orders: {}
      waiting_time_at_pick_up:
        bold: true
      pna_1:
        bold: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [order_feedback_facts.number_of_order_store_wrong_or_missing_products,
      order_descriptors.number_of_cancelled_orders, number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes,
      order_descriptors.number_of_delivered_orders, bu_dt, wt_at_pickup, order_timelines.order_activated_local_week,
      order_timelines.order_activated_local_week_of_year,
      q2_order_descriptors.number_of_orders, order_feedback_facts.feedback_all_store,
      ratings.number_of_orders_with_negative_rating, pna, total_orders_with_selected_option_not_null,
      count_order_id_feedback_facts, br_del_orders, br_delorders, order_descriptors.order_activated_local_week,
      order_descriptors.order_activated_local_week_of_year, order_pna.percentage_of_orders_with_pna_cancellations,
      order_descriptors.number_of_orders, order_pna.percentage_of_orders_with_pna]
    type: looker_grid
    series_types: {}
    y_axes: []
    hidden_pivots: {}
    hide_totals: false
    hide_row_totals: false
    minimum_column_width: 75
    pinned_columns:
      week: left
    column_order: [week, cancellations, cancellations_wo_self_cancelled_in_5_min,
      cancellations_by_pna, bu_delivery_time_delivered_orders, waiting_time_at_pick_up,
      br_due_to_wm_items_delivered_orders, pna_1]
    series_column_widths:
      week: 154
    query_fields:
      measures:
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total cancelled orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Number of Cancelled Orders
        label_from_parameter:
        label_short: Number of Cancelled Orders
        map_layer:
        name: order_descriptors.number_of_cancelled_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Cancelled Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.number_of_cancelled_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1027"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: CanceledStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Number of Orders
        label_from_parameter:
        label_short: Number of Orders
        map_layer:
        name: order_descriptors.number_of_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.number_of_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1000"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total cancelled orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Number of Canceled Orders without Self Cancelation in less than 5 minutes
        label_from_parameter:
        label_short: Number of Canceled Orders without Self Cancelation in less than
          5 minutes
        map_layer:
        name: number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Canceled Orders without Self Cancelation in
          less than 5 minutes
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: 'order_descriptors.order_id '
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: CanceledStatus
        - field: order_descriptors.order_cancel_reason
          condition: '"SELF_CANCELLATION",UNKNOWN,OTHER,"DELIVERY_TAKING_TOO_LONG","CUSTOMER_DOESNT_WANT_PRODUCTS","CUSTOMER_REFUSED"'
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Average duration of delivered orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: BU DT
        label_from_parameter:
        label_short: BU DT
        map_layer:
        name: bu_dt
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: average_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: 0.# "min"
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: BU DT
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: bu_dt
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${seconds_delivery_duration} / 60.00 "
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: |-
          Time between courier entering PU point and PU time (min)
                - using the 100m geofence (old/deprecated definition of WTP).
                The current definition of WTP uses the 10m geofence and is not computed in this view
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: WT at Pickup
        label_from_parameter:
        label_short: WT at Pickup
        map_layer:
        name: wt_at_pickup
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: average_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: 0.# "min"
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: WT at Pickup
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: wt_at_pickup
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${seconds_waiting_time_pickup} / 60.00 "
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total delivered orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Number of Delivered Orders
        label_from_parameter:
        label_short: Number of Delivered Orders
        map_layer:
        name: order_descriptors.number_of_delivered_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Delivered Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.number_of_delivered_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1020"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Number of orders with bad rating (negative)
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Ratings Number of Orders with Negative Rating
        label_from_parameter:
        label_short: Number of Orders with Negative Rating
        map_layer:
        name: ratings.number_of_orders_with_negative_rating
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: ratings
        view_label: Ratings
        dynamic: false
        week_start_day: monday
        original_view: ratings
        dimension_group:
        error:
        field_group_variant: Number of Orders with Negative Rating
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: ratings
        suggest_dimension: ratings.number_of_orders_with_negative_rating
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Fratings.view.lkml?line=155"
        permanent: true
        source_file: central_dm/views/ratings.view.lkml
        source_file_path: data_mesh/central_dm/views/ratings.view.lkml
        sql: 'case when ${negative_ratings_any_service} then ${order_id} end '
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Percentage of orders with cancellations due to PNA
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Pna Percentage of Orders with Pna Cancellations
        label_from_parameter:
        label_short: Percentage of Orders with Pna Cancellations
        map_layer:
        name: order_pna.percentage_of_orders_with_pna_cancellations
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: number
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: "#,##0.00%"
        view: order_pna
        view_label: Order Pna
        dynamic: false
        week_start_day: monday
        original_view: order_pna
        dimension_group:
        error:
        field_group_variant: Percentage of Orders with Pna Cancellations
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_pna
        suggest_dimension: order_pna.percentage_of_orders_with_pna_cancellations
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_pna.view.lkml?line=181"
        permanent: true
        source_file: central_dm/views/order_pna.view.lkml
        source_file_path: data_mesh/central_dm/views/order_pna.view.lkml
        sql: '1.0000 * ${number_of_orders_with_pna_cancellations} / nullif(${number_of_orders},
          0) '
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Percentage of orders with pna
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Pna Percentage of Orders with Pna
        label_from_parameter:
        label_short: Percentage of Orders with Pna
        map_layer:
        name: order_pna.percentage_of_orders_with_pna
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: number
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: "#,##0.00%"
        view: order_pna
        view_label: Order Pna
        dynamic: false
        week_start_day: monday
        original_view: order_pna
        dimension_group:
        error:
        field_group_variant: Percentage of Orders with Pna
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_pna
        suggest_dimension: order_pna.percentage_of_orders_with_pna
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_pna.view.lkml?line=223"
        permanent: true
        source_file: central_dm/views/order_pna.view.lkml
        source_file_path: data_mesh/central_dm/views/order_pna.view.lkml
        sql: '1.0000 * ${number_of_orders_with_pna} / nullif(${number_of_orders},
          0) '
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - type: number
        align: right
        measure: true
        dynamic: false
        can_pivot: true
        is_numeric: true
        name: cancellations
        label: Cancellations (%)
        value_format: "#,##0.0%"
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - type: number
        align: right
        measure: true
        dynamic: false
        can_pivot: true
        is_numeric: true
        name: cancellations_wo_self_cancelled_in_5_min
        label: Cancellations w/o Self-Cancelled in 5 min (%)
        value_format: "#,##0.0%"
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - type: number
        align: right
        measure: true
        dynamic: false
        can_pivot: true
        is_numeric: true
        name: cancellations_by_pna
        label: Cancellations by PNA
        value_format: "#,##0.0%"
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - type: number
        align: right
        measure: true
        dynamic: false
        can_pivot: true
        is_numeric: true
        name: br_del_orders
        label: BR / Del. Orders (%)
        value_format: "#,##0.0%"
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - type: number
        align: right
        measure: true
        dynamic: false
        can_pivot: true
        is_numeric: true
        name: pna
        label: PNA (%)
        value_format: "#,##0.0%"
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Feedback due to reasons 'Wrong Products', 'Missing Products'
          or 'Missing Extras'
        enumerations:
        field_group_label: Number of Orders with Feedback due to Store Related Reasons
          (Past Order)
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Feedback Facts Number of Order Store Wrong or Missing Products
        label_from_parameter:
        label_short: Number of Order Store Wrong or Missing Products
        map_layer:
        name: order_feedback_facts.number_of_order_store_wrong_or_missing_products
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_feedback_facts
        view_label: Order Feedback Facts
        dynamic: false
        week_start_day: monday
        original_view: order_feedback_facts
        dimension_group:
        error:
        field_group_variant: Wrong or Missing Products
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_feedback_facts
        suggest_dimension: order_feedback_facts.number_of_order_store_wrong_or_missing_products
        suggest_explore: order_feedback_facts
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_feedback_facts.view.lkml?line=668"
        permanent: true
        source_file: central_dm/views/order_feedback_facts.view.lkml
        source_file_path: data_mesh/central_dm/views/order_feedback_facts.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        - field: order_feedback_facts.selected_option
          condition: MISSING_PRODUCTS,MISSING_WRONG_PRODUCTS,WRONG_PRODUCTS,MISSING_EXTRAS
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total number of orders with feedback due to store reasons.
        enumerations:
        field_group_label: Number of Orders with Feedback due to Store Related Reasons
          (Past Order)
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Feedback Facts Feedback All Store
        label_from_parameter:
        label_short: Feedback All Store
        map_layer:
        name: order_feedback_facts.feedback_all_store
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_feedback_facts
        view_label: Order Feedback Facts
        dynamic: false
        week_start_day: monday
        original_view: order_feedback_facts
        dimension_group:
        error:
        field_group_variant: All Store Related Reasons
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_feedback_facts
        suggest_dimension: order_feedback_facts.feedback_all_store
        suggest_explore: order_feedback_facts
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_feedback_facts.view.lkml?line=809"
        permanent: true
        source_file: central_dm/views/order_feedback_facts.view.lkml
        source_file_path: data_mesh/central_dm/views/order_feedback_facts.view.lkml
        sql: "CASE\n          WHEN (${TABLE}.feedback_selected_option in (\n     \
          \       'ALLERGY_NOT_CONSIDERED',\n            'CHARGED_WRONG_AMOUNT',\n\
          \            'MISSING_EXTRAS',\n            'MISSING_PRODUCTS',\n      \
          \      'MISSING_WRONG_PRODUCTS',\n            'PACKAGING_ISSUES',\n    \
          \        'DAMAGED_ITEMS',\n            'TRANSPORTED_IMPROPERLY',\n     \
          \       'POOR_QUALITY',\n            'SPECIAL_STORE_PROMOS',\n         \
          \   'PROMO_CODE_CHECK_BALANCE',\n            'PROMO_CODE_NOT_VALID',\n \
          \           'TASTED_BAD',\n            'WRONG_PRODUCTS'\n            ))\n\
          \            OR (\n              ${TABLE}.feedback_selected_option='ORDER_LATE'\n\
          \              and ${order_descriptors.seconds_partner_dispatch_to_pickup_time}>1500\n\
          \              and ${order_descriptors.seconds_waiting_time_pickup}>420\n\
          \            )\n          THEN ${TABLE}.order_id\n          ELSE NULL\n\
          \        END "
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Count Order ID Feedback Facts
        label_from_parameter:
        label_short: Count Order ID Feedback Facts
        map_layer:
        name: count_order_id_feedback_facts
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_feedback_facts
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_feedback_facts
        dimension_group:
        error:
        field_group_variant: Count Order ID Feedback Facts
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_feedback_facts
        suggest_dimension: count_order_id_feedback_facts
        suggest_explore: order_feedback_facts
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_feedback_facts.view.lkml
        source_file_path: data_mesh/central_dm/views/order_feedback_facts.view.lkml
        sql: count_order_id_feedback_facts
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Total Orders with Selected Option not Null
        label_from_parameter:
        label_short: Total Orders with Selected Option not Null
        map_layer:
        name: total_orders_with_selected_option_not_null
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Total Orders with Selected Option not Null
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: total_orders_with_selected_option_not_null
        suggest_explore: order_feedback_facts
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: 'order_descriptors.order_id '
        sql_case:
        filters:
        - field: order_feedback_facts.selected_option
          condition: "-NULL"
        times_used: 0
        aggregate: true
      dimensions:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: Conversion of the same field to local time zone for the city
        enumerations:
        field_group_label: Order Activated Local Date
        fill_style: range
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Order Descriptors Order Activated Local Week
        label_from_parameter:
        label_short: Order Activated Local Week
        map_layer:
        name: order_descriptors.order_activated_local_week
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: date_week
        user_attribute_filter_types:
        - datetime
        - advanced_filter_datetime
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group: order_descriptors.order_activated_local
        error:
        field_group_variant: Week
        measure: false
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.order_activated_local_week
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: true
        can_time_filter: false
        time_interval:
          name: week
          count: 1
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=612"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_activated_local_at "
        sql_case:
        filters:
        times_used: 0
        sorted:
          sort_index: 0
          desc: false
      - align: right
        can_filter: false
        category: dimension
        default_filter_value:
        description: Conversion of the same field to local time zone for the city
        enumerations:
        field_group_label: Order Activated Local Date
        fill_style: enumeration
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Order Activated Local Week of Year
        label_from_parameter:
        label_short: Order Activated Local Week of Year
        map_layer:
        name: order_descriptors.order_activated_local_week_of_year
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: date_week_of_year
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group: order_descriptors.order_activated_local
        error:
        field_group_variant: Week of Year
        measure: false
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.order_activated_local_week_of_year
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=612"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_activated_local_at "
        sql_case:
        filters:
        times_used: 0
      - type: string
        align: left
        measure: false
        dynamic: false
        can_pivot: false
        name: week
        label: WEEK
        value_format:
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      table_calculations:
      - label: BU Delivery Time Delivered Orders
        name: bu_delivery_time_delivered_orders
        expression: "${bu_dt}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: 0.# "min"
        is_numeric: true
      - label: Waiting Time at Pick Up
        name: waiting_time_at_pick_up
        expression: "${wt_at_pickup}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: 0.# "min"
        is_numeric: true
      - label: BR Del./Orders
        name: br_delorders
        expression: "(${total_orders_with_selected_option_not_null})/${order_descriptors.number_of_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BR due to W/M Items / Delivered Orders
        name: br_due_to_wm_items_delivered_orders
        expression: "${order_feedback_facts.number_of_order_store_wrong_or_missing_products}/${order_descriptors.number_of_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: PNA
        name: pna_1
        expression: "${pna}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      pivots: []
    dynamic_fields:
    - category: table_calculation
      expression: "${bu_dt}"
      label: BU Delivery Time Delivered Orders
      value_format: 0.# "min"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: bu_delivery_time_delivered_orders
      _type_hint: number
    - category: table_calculation
      expression: "${wt_at_pickup}"
      label: Waiting Time at Pick Up
      value_format: 0.# "min"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: waiting_time_at_pick_up
      _type_hint: number
    - category: table_calculation
      expression: "(${total_orders_with_selected_option_not_null})/${order_descriptors.number_of_delivered_orders}"
      label: BR Del./Orders
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: br_delorders
      _type_hint: number
    - category: table_calculation
      expression: "${order_feedback_facts.number_of_order_store_wrong_or_missing_products}/${order_descriptors.number_of_delivered_orders}"
      label: BR due to W/M Items / Delivered Orders
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: br_due_to_wm_items_delivered_orders
      _type_hint: number
    - category: table_calculation
      expression: "${pna}"
      label: PNA
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: pna_1
      _type_hint: number
    listen:
    - Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Activated Local Week: order_descriptors.order_activated_local_week
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    - Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Activated Local Week: order_descriptors.order_activated_local_week
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    row: 26
    col: 2
    width: 11
    height: 5
  - name: UX (Monthly)
    title: UX (Monthly)
    merged_queries:
    - model: central_dm_cert
      explore: order_descriptors
      type: looker_grid
      fields: [order_descriptors.number_of_cancelled_orders, order_descriptors.number_of_orders,
        number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes,
        bu_dt, wt_at_pickup, order_descriptors.number_of_delivered_orders, cancelled_pna,
        ratings.number_of_orders_with_negative_rating, order_descriptors.order_activated_local_month,
        order_pna.percentage_of_orders_with_pna]
      fill_fields: [order_descriptors.order_activated_local_month]
      filters:
        order_descriptors.order_subvertical: ''
        order_descriptors.order_subvertical2: ''
        order_descriptors.order_subvertical3: ''
        order_descriptors.store_id: ''
        order_descriptors.store_name: ''
        order_descriptors.order_vertical: ''
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_is_partner_order: ''
        order_descriptors.order_parent_relationship_type: 'NULL'
        # order_descriptors.order_activated_local_month: 1 months
        # order_descriptors.p_creation_date: 365 days
      sorts: [order_descriptors.order_activated_local_month desc]
      limit: 500
      column_limit: 50
      dynamic_fields:
      - category: table_calculation
        expression: "${order_descriptors.number_of_cancelled_orders}/${order_descriptors.number_of_orders}"
        label: Cancellations (%)
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        table_calculation: cancellations
        _type_hint: number
      - category: table_calculation
        expression: "(${order_descriptors.number_of_cancelled_orders} - ${number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes})/${order_descriptors.number_of_orders}"
        label: Cancellations w/o Self-Cancelled in 5 min (%)
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        table_calculation: cancellations_wo_self_cancelled_in_5_min
        _type_hint: number
      - category: measure
        expression: "diff_seconds(${order_descriptors.order_created_local_raw}, ${order_descriptors.order_terminated_local_raw})\
          \ / 60.0 <= 5 \n OR (\n  NOT is_null(${order_descriptors.order_scheduled_local_raw})\n\
          \ AND (is_null(${order_descriptors.order_activated_local_raw})\n OR diff_seconds(${order_descriptors.order_activated_local_month},\
          \ ${order_descriptors.order_terminated_local_raw}) / 60.0 <= 5))"
        label: Number of Canceled Orders without Self Cancelation in less than 5 minutes
        based_on: order_descriptors.number_of_cancelled_orders
        filter_expression: "diff_seconds(${order_descriptors.order_created_local_raw},\
          \ ${order_descriptors.order_terminated_local_raw}) / 60.0 <= 5 \n OR (\n\
          \  NOT is_null(${order_descriptors.order_scheduled_local_raw})\n AND (is_null(${order_descriptors.order_activated_local_raw})\n\
          \ OR diff_seconds(${order_descriptors.order_activated_local_month}, ${order_descriptors.order_terminated_local_raw})\
          \ / 60.0 <= 5))"
        _kind_hint: measure
        measure: number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes
        type: count_distinct
        _type_hint: number
        filters:
          order_descriptors.order_cancel_reason: '"SELF_CANCELLATION",UNKNOWN,OTHER,"DELIVERY_TAKING_TOO_LONG","CUSTOMER_DOESNT_WANT_PRODUCTS","CUSTOMER_REFUSED"'
      - category: measure
        expression: ''
        label: Average of Minutes Delivered Order Duration
        value_format: 0.# "min"
        value_format_name: __custom
        based_on: order_descriptors.minutes_delivery_duration
        _kind_hint: measure
        measure: average_of_minutes_delivered_order_duration
        type: average
        _type_hint: number
      - category: measure
        expression: ''
        label: Average of Minutes Waiting time pickup
        value_format: 0.# "min"
        value_format_name: __custom
        based_on: order_descriptors.minutes_waiting_time_pickup
        _kind_hint: measure
        measure: average_of_minutes_waiting_time_pickup
        type: average
        _type_hint: number
      - category: measure
        label: BU DT
        value_format: 0.# "min"
        value_format_name: __custom
        based_on: order_descriptors.average_delivery_duration
        _kind_hint: measure
        measure: bu_dt
        type: count_distinct
        _type_hint: number
      - category: measure
        label: WT at Pickup
        value_format: 0.# "min"
        value_format_name: __custom
        based_on: order_descriptors.average_waiting_time_pickup
        _kind_hint: measure
        measure: wt_at_pickup
        type: count_distinct
        _type_hint: number
      - category: table_calculation
        expression: concat(${order_descriptors.order_activated_local_week},"  ","W",${order_descriptors.order_activated_local_week_of_year})
        label: WEEK
        value_format:
        value_format_name:
        _kind_hint: dimension
        table_calculation: week
        _type_hint: string
        is_disabled: true
      - category: measure
        label: Cancelled PNA
        based_on: order_descriptors.number_of_cancelled_orders
        _kind_hint: measure
        measure: cancelled_pna
        type: count_distinct
        _type_hint: number
        filters:
          order_descriptors.order_cancel_reason: '"PRODUCTS_NOT_AVAILABLE"'
      - category: table_calculation
        expression: "${cancelled_pna}/${order_descriptors.number_of_orders}"
        label: Cancellations by PNA
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        table_calculation: cancellations_by_pna
        _type_hint: number
      - category: table_calculation
        expression: "${ratings.number_of_orders_with_negative_rating} / ${order_descriptors.number_of_delivered_orders}"
        label: BR / Del. Orders (%)
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        table_calculation: br_del_orders
        _type_hint: number
      - category: table_calculation
        expression: "${order_pna.percentage_of_orders_with_pna}"
        label: PNA (%)
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        table_calculation: pna
        _type_hint: number
      show_view_names: false
      show_row_numbers: true
      transpose: true
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: editable
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: '12'
      rows_font_size: '12'
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      truncate_header: false
      series_labels:
        average_of_minutes_delivered_order_duration: BU Delivery Time
        average_of_minutes_waiting_time_pickup: WT at PickUp
      series_cell_visualizations:
        average_of_minutes_delivered_order_duration:
          is_active: false
      series_text_format:
        cancellations_wo_self_cancelled_in_5_min:
          bold: true
        cancellations:
          bold: true
        bu_dt:
          align: right
        wt_at_pickup:
          align: right
          bold: true
      hidden_fields: [order_descriptors.number_of_cancelled_orders, order_descriptors.number_of_orders,
        number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes,
        order_descriptors.number_of_delivered_orders, cancelled_pna, ratings.number_of_orders_with_negative_rating,
        order_pna.percentage_of_orders_with_pna]
      truncate_column_names: false
      defaults_version: 1
      hidden_pivots: {}
      y_axes: []
    - model: central_dm_cert
      explore: order_feedback_facts
      type: looker_line
      fields: [order_feedback_facts.number_of_order_store_wrong_or_missing_products,
        order_feedback_facts.feedback_all_store, count_order_id_feedback_facts, total_orders_with_selected_option_not_null,
        order_descriptors.order_activated_local_month]
      fill_fields: [order_descriptors.order_activated_local_month]
      filters:
        order_descriptors.order_subvertical: ''
        order_descriptors.order_subvertical2: ''
        order_descriptors.order_subvertical3: ''
        order_descriptors.order_vertical: ''
        order_descriptors.store_id: ''
        order_descriptors.store_name: ''
        order_descriptors.order_handling_strategy: ''
        order_descriptors.order_is_partner_order: ''
        order_descriptors.order_parent_relationship_type: 'NULL'
        #order_descriptors.order_user_is_glovo_refund_account: ''
        #order_descriptors.order_activated_local_month: 1 months
      limit: 500
      dynamic_fields:
      - category: measure
        expression: ''
        label: Count Order ID Feedback Facts
        based_on: order_feedback_facts.order_id
        _kind_hint: measure
        measure: count_order_id_feedback_facts
        type: count_distinct
        _type_hint: number
      - category: measure
        label: Total Orders with Selected Option not Null
        based_on: order_descriptors.number_of_orders
        _kind_hint: measure
        measure: total_orders_with_selected_option_not_null
        type: count_distinct
        _type_hint: number
        filters:
          order_feedback_facts.selected_option: "-NULL"
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: order_descriptors.order_activated_local_month
        source_field_name: order_descriptors.order_activated_local_month
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_labels:
      br_due_to_wm_items_delivered_orders: BR due W/M items / Del. Orders (%)
      cancelled_pna: Cancellations because of PNA (%)
      cancellations_by_pna: Cancellations because of PNA (%)
    series_cell_visualizations:
      bu_dt:
        is_active: false
    series_text_format:
      bu_dt:
        align: right
      wt_at_pickup:
        bold: true
        align: right
      cancellations_wo_self_cancelled_in_5_min:
        bold: true
      cancellations:
        bold: true
      bu_delivery_time_delivered_orders: {}
      waiting_time_at_pick_up:
        bold: true
      pna_1:
        bold: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [order_feedback_facts.number_of_order_store_wrong_or_missing_products,
      order_descriptors.number_of_cancelled_orders, number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes,
      order_descriptors.number_of_delivered_orders, bu_dt, wt_at_pickup, cancelled_pna, q2_order_descriptors.number_of_orders,
      order_feedback_facts.feedback_all_store, ratings.number_of_orders_with_negative_rating,
      pna, total_orders_with_selected_option_not_null, count_order_id_feedback_facts,
      br_del_orders, br_delorders, order_descriptors.number_of_orders, order_pna.percentage_of_orders_with_pna]
    type: looker_grid
    series_types: {}
    y_axes: []
    hidden_pivots: {}
    hide_totals: false
    hide_row_totals: false
    minimum_column_width: 75
    pinned_columns:
      order_descriptors.order_activated_local_month: left
    column_order: [order_descriptors.order_activated_local_month, cancellations, cancellations_wo_self_cancelled_in_5_min,
      cancellations_by_pna, bu_delivery_time_delivered_orders, waiting_time_at_pick_up,
      br_due_to_wm_items_delivered_orders, pna_1]
    series_column_widths:
      order_descriptors.order_activated_local_month: 170
    query_fields:
      measures:
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total cancelled orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Number of Cancelled Orders
        label_from_parameter:
        label_short: Number of Cancelled Orders
        map_layer:
        name: order_descriptors.number_of_cancelled_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Cancelled Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.number_of_cancelled_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1027"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: CanceledStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Number of Orders
        label_from_parameter:
        label_short: Number of Orders
        map_layer:
        name: order_descriptors.number_of_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.number_of_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1000"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total cancelled orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Number of Canceled Orders without Self Cancelation in less than 5 minutes
        label_from_parameter:
        label_short: Number of Canceled Orders without Self Cancelation in less than
          5 minutes
        map_layer:
        name: number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Canceled Orders without Self Cancelation in
          less than 5 minutes
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: number_of_canceled_orders_without_self_cancelation_in_less_than_5_minutes
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: 'order_descriptors.order_id '
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: CanceledStatus
        - field: order_descriptors.order_cancel_reason
          condition: '"SELF_CANCELLATION",UNKNOWN,OTHER,"DELIVERY_TAKING_TOO_LONG","CUSTOMER_DOESNT_WANT_PRODUCTS","CUSTOMER_REFUSED"'
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Average duration of delivered orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: BU DT
        label_from_parameter:
        label_short: BU DT
        map_layer:
        name: bu_dt
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: average_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: 0.# "min"
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: BU DT
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: bu_dt
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${seconds_delivery_duration} / 60.00 "
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: |-
          Time between courier entering PU point and PU time (min)
                - using the 100m geofence (old/deprecated definition of WTP).
                The current definition of WTP uses the 10m geofence and is not computed in this view
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: WT at Pickup
        label_from_parameter:
        label_short: WT at Pickup
        map_layer:
        name: wt_at_pickup
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: average_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: 0.# "min"
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: WT at Pickup
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: wt_at_pickup
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${seconds_waiting_time_pickup} / 60.00 "
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total delivered orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Descriptors Number of Delivered Orders
        label_from_parameter:
        label_short: Number of Delivered Orders
        map_layer:
        name: order_descriptors.number_of_delivered_orders
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Number of Delivered Orders
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.number_of_delivered_orders
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=1020"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: DeliveredStatus
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total cancelled orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Cancelled PNA
        label_from_parameter:
        label_short: Cancelled PNA
        map_layer:
        name: cancelled_pna
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Cancelled PNA
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: cancelled_pna
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: 'order_descriptors.order_id '
        sql_case:
        filters:
        - field: order_descriptors.order_final_status
          condition: CanceledStatus
        - field: order_descriptors.order_cancel_reason
          condition: '"PRODUCTS_NOT_AVAILABLE"'
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Number of orders with bad rating (negative)
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Ratings Number of Orders with Negative Rating
        label_from_parameter:
        label_short: Number of Orders with Negative Rating
        map_layer:
        name: ratings.number_of_orders_with_negative_rating
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: ratings
        view_label: Ratings
        dynamic: false
        week_start_day: monday
        original_view: ratings
        dimension_group:
        error:
        field_group_variant: Number of Orders with Negative Rating
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: ratings
        suggest_dimension: ratings.number_of_orders_with_negative_rating
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Fratings.view.lkml?line=155"
        permanent: true
        source_file: central_dm/views/ratings.view.lkml
        source_file_path: data_mesh/central_dm/views/ratings.view.lkml
        sql: 'case when ${negative_ratings_any_service} then ${order_id} end '
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Percentage of orders with pna
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Pna Percentage of Orders with Pna
        label_from_parameter:
        label_short: Percentage of Orders with Pna
        map_layer:
        name: order_pna.percentage_of_orders_with_pna
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: number
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format: "#,##0.00%"
        view: order_pna
        view_label: Order Pna
        dynamic: false
        week_start_day: monday
        original_view: order_pna
        dimension_group:
        error:
        field_group_variant: Percentage of Orders with Pna
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_pna
        suggest_dimension: order_pna.percentage_of_orders_with_pna
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_pna.view.lkml?line=223"
        permanent: true
        source_file: central_dm/views/order_pna.view.lkml
        source_file_path: data_mesh/central_dm/views/order_pna.view.lkml
        sql: '1.0000 * ${number_of_orders_with_pna} / nullif(${number_of_orders},
          0) '
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - type: number
        align: right
        measure: true
        dynamic: false
        can_pivot: true
        is_numeric: true
        name: cancellations
        label: Cancellations (%)
        value_format: "#,##0.0%"
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - type: number
        align: right
        measure: true
        dynamic: false
        can_pivot: true
        is_numeric: true
        name: cancellations_wo_self_cancelled_in_5_min
        label: Cancellations w/o Self-Cancelled in 5 min (%)
        value_format: "#,##0.0%"
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - type: number
        align: right
        measure: true
        dynamic: false
        can_pivot: true
        is_numeric: true
        name: cancellations_by_pna
        label: Cancellations by PNA
        value_format: "#,##0.0%"
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - type: number
        align: right
        measure: true
        dynamic: false
        can_pivot: true
        is_numeric: true
        name: br_del_orders
        label: BR / Del. Orders (%)
        value_format: "#,##0.0%"
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - type: number
        align: right
        measure: true
        dynamic: false
        can_pivot: true
        is_numeric: true
        name: pna
        label: PNA (%)
        value_format: "#,##0.0%"
        is_disabled:
        sortable: true
        aggregate: true
        can_filter: false
        permanent: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Feedback due to reasons 'Wrong Products', 'Missing Products'
          or 'Missing Extras'
        enumerations:
        field_group_label: Number of Orders with Feedback due to Store Related Reasons
          (Past Order)
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Feedback Facts Number of Order Store Wrong or Missing Products
        label_from_parameter:
        label_short: Number of Order Store Wrong or Missing Products
        map_layer:
        name: order_feedback_facts.number_of_order_store_wrong_or_missing_products
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_feedback_facts
        view_label: Order Feedback Facts
        dynamic: false
        week_start_day: monday
        original_view: order_feedback_facts
        dimension_group:
        error:
        field_group_variant: Wrong or Missing Products
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_feedback_facts
        suggest_dimension: order_feedback_facts.number_of_order_store_wrong_or_missing_products
        suggest_explore: order_feedback_facts
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_feedback_facts.view.lkml?line=668"
        permanent: true
        source_file: central_dm/views/order_feedback_facts.view.lkml
        source_file_path: data_mesh/central_dm/views/order_feedback_facts.view.lkml
        sql: "${TABLE}.order_id "
        sql_case:
        filters:
        - field: order_feedback_facts.selected_option
          condition: MISSING_PRODUCTS,MISSING_WRONG_PRODUCTS,WRONG_PRODUCTS,MISSING_EXTRAS
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total number of orders with feedback due to store reasons.
        enumerations:
        field_group_label: Number of Orders with Feedback due to Store Related Reasons
          (Past Order)
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Order Feedback Facts Feedback All Store
        label_from_parameter:
        label_short: Feedback All Store
        map_layer:
        name: order_feedback_facts.feedback_all_store
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_feedback_facts
        view_label: Order Feedback Facts
        dynamic: false
        week_start_day: monday
        original_view: order_feedback_facts
        dimension_group:
        error:
        field_group_variant: All Store Related Reasons
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_feedback_facts
        suggest_dimension: order_feedback_facts.feedback_all_store
        suggest_explore: order_feedback_facts
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_feedback_facts.view.lkml?line=809"
        permanent: true
        source_file: central_dm/views/order_feedback_facts.view.lkml
        source_file_path: data_mesh/central_dm/views/order_feedback_facts.view.lkml
        sql: "CASE\n          WHEN (${TABLE}.feedback_selected_option in (\n     \
          \       'ALLERGY_NOT_CONSIDERED',\n            'CHARGED_WRONG_AMOUNT',\n\
          \            'MISSING_EXTRAS',\n            'MISSING_PRODUCTS',\n      \
          \      'MISSING_WRONG_PRODUCTS',\n            'PACKAGING_ISSUES',\n    \
          \        'DAMAGED_ITEMS',\n            'TRANSPORTED_IMPROPERLY',\n     \
          \       'POOR_QUALITY',\n            'SPECIAL_STORE_PROMOS',\n         \
          \   'PROMO_CODE_CHECK_BALANCE',\n            'PROMO_CODE_NOT_VALID',\n \
          \           'TASTED_BAD',\n            'WRONG_PRODUCTS'\n            ))\n\
          \            OR (\n              ${TABLE}.feedback_selected_option='ORDER_LATE'\n\
          \              and ${order_descriptors.seconds_partner_dispatch_to_pickup_time}>1500\n\
          \              and ${order_descriptors.seconds_waiting_time_pickup}>420\n\
          \            )\n          THEN ${TABLE}.order_id\n          ELSE NULL\n\
          \        END "
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: ''
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Count Order ID Feedback Facts
        label_from_parameter:
        label_short: Count Order ID Feedback Facts
        map_layer:
        name: count_order_id_feedback_facts
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_feedback_facts
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_feedback_facts
        dimension_group:
        error:
        field_group_variant: Count Order ID Feedback Facts
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_feedback_facts
        suggest_dimension: count_order_id_feedback_facts
        suggest_explore: order_feedback_facts
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_feedback_facts.view.lkml
        source_file_path: data_mesh/central_dm/views/order_feedback_facts.view.lkml
        sql: count_order_id_feedback_facts
        sql_case:
        filters:
        times_used: 0
        aggregate: true
      - align: right
        can_filter: false
        category: measure
        default_filter_value:
        description: Total orders
        enumerations:
        field_group_label:
        fill_style:
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: true
        label: Total Orders with Selected Option not Null
        label_from_parameter:
        label_short: Total Orders with Selected Option not Null
        map_layer:
        name: total_orders_with_selected_option_not_null
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: count_distinct
        user_attribute_filter_types:
        - number
        - advanced_filter_number
        value_format:
        view: order_descriptors
        view_label: ''
        dynamic: true
        week_start_day: monday
        original_view: order_descriptors
        dimension_group:
        error:
        field_group_variant: Total Orders with Selected Option not Null
        measure: true
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: total_orders_with_selected_option_not_null
        suggest_explore: order_feedback_facts
        suggestable: false
        is_fiscal: false
        is_timeframe: false
        can_time_filter: false
        time_interval:
        lookml_link:
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: 'order_descriptors.order_id '
        sql_case:
        filters:
        - field: order_feedback_facts.selected_option
          condition: "-NULL"
        times_used: 0
        aggregate: true
      dimensions:
      - align: left
        can_filter: false
        category: dimension
        default_filter_value:
        description: Conversion of the same field to local time zone for the city
        enumerations:
        field_group_label: Order Activated Local Date
        fill_style: range
        fiscal_month_offset: 0
        has_allowed_values: false
        hidden: false
        is_filter: false
        is_numeric: false
        label: Order Descriptors Order Activated Local Month
        label_from_parameter:
        label_short: Order Activated Local Month
        map_layer:
        name: order_descriptors.order_activated_local_month
        strict_value_format: false
        requires_refresh_on_sort: false
        sortable: true
        suggestions:
        tags: []
        type: date_month
        user_attribute_filter_types:
        - datetime
        - advanced_filter_datetime
        value_format:
        view: order_descriptors
        view_label: Order Descriptors
        dynamic: false
        week_start_day: monday
        original_view: order_descriptors
        dimension_group: order_descriptors.order_activated_local
        error:
        field_group_variant: Month
        measure: false
        parameter: false
        primary_key: false
        project_name: looker-certified
        scope: order_descriptors
        suggest_dimension: order_descriptors.order_activated_local_month
        suggest_explore: order_descriptors
        suggestable: false
        is_fiscal: false
        is_timeframe: true
        can_time_filter: false
        time_interval:
          name: month
          count: 1
        lookml_link: "/projects/data_mesh/files/central_dm%2Fviews%2Forder_descriptors.view.lkml?line=612"
        permanent: true
        source_file: central_dm/views/order_descriptors.view.lkml
        source_file_path: data_mesh/central_dm/views/order_descriptors.view.lkml
        sql: "${TABLE}.order_activated_local_at "
        sql_case:
        filters:
        times_used: 0
        sorted:
          desc: false
          sort_index: 0
      table_calculations:
      - label: BU Delivery Time Delivered Orders
        name: bu_delivery_time_delivered_orders
        expression: "${bu_dt}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: 0.# "min"
        is_numeric: true
      - label: Waiting Time at Pick Up
        name: waiting_time_at_pick_up
        expression: "${wt_at_pickup}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: 0.# "min"
        is_numeric: true
      - label: BR Del./Orders
        name: br_delorders
        expression: "(${total_orders_with_selected_option_not_null})/${order_descriptors.number_of_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: BR due to W/M Items / Delivered Orders
        name: br_due_to_wm_items_delivered_orders
        expression: "${order_feedback_facts.number_of_order_store_wrong_or_missing_products}/${order_descriptors.number_of_delivered_orders}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      - label: PNA
        name: pna_1
        expression: "${pna}"
        can_pivot: true
        sortable: true
        type: number
        align: right
        measure: true
        is_table_calculation: true
        dynamic: true
        value_format: "#,##0.0%"
        is_numeric: true
      pivots: []
    sorts: [order_descriptors.order_activated_local_month]
    dynamic_fields:
    - category: table_calculation
      expression: "${bu_dt}"
      label: BU Delivery Time Delivered Orders
      value_format: 0.# "min"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: bu_delivery_time_delivered_orders
      _type_hint: number
    - category: table_calculation
      expression: "${wt_at_pickup}"
      label: Waiting Time at Pick Up
      value_format: 0.# "min"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: waiting_time_at_pick_up
      _type_hint: number
    - category: table_calculation
      expression: "(${total_orders_with_selected_option_not_null})/${order_descriptors.number_of_delivered_orders}"
      label: BR Del./Orders
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: br_delorders
      _type_hint: number
    - category: table_calculation
      expression: "${order_feedback_facts.number_of_order_store_wrong_or_missing_products}/${order_descriptors.number_of_delivered_orders}"
      label: BR due to W/M Items / Delivered Orders
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: br_due_to_wm_items_delivered_orders
      _type_hint: number
    - category: table_calculation
      expression: "${pna}"
      label: PNA
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: pna_1
      _type_hint: number
    listen:
    - Order Activated Local Month: order_descriptors.order_activated_local_month
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    - Order Activated Local Month: order_descriptors.order_activated_local_month
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Is Specialty? (BU): stores.is_specialty
      Store Sub-Business Unit (BU): stores.store_sub_business_unit
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      MFC Name (BU): mfc_store_addresses.mfc_name
      Subregion: order_descriptors.order_country_subregion
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.order_vertical
      Order Subvertical (BU): order_descriptors.order_subvertical
    row: 26
    col: 13
    width: 11
    height: 5
  - name: " (Copy 2)"
    type: text
    title_text: " (Copy 2)"
    subtitle_text: ''
    body_text: '[{"type":"p","children":[{"text":"DESCRIPTION","underline":true,"bold":true,"color":"hsl(0,
      100%, 50%)"}],"id":1676997953860},{"type":"p","children":[{"text":"This dashboard
      compile all main KPIs for QCommerce in terms of # Orders and € GMV; Users Growth
      and Retention; User Experience and Profitability in both Weekly and Monthly
      basis. This dashboard compares data for the business units,  geographic fields
      and timespan selected in the filters above."}],"id":1676887999174}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 24
    height: 2
  - title: GMV 20 (Weekly)
    name: GMV 20 (Weekly)
    model: central_dm_cert
    explore: order_descriptors
    type: looker_grid
    fields: [order_descriptors.order_activated_local_week, order_descriptors.sum_total_purchase_eur,
      order_descriptors.bu_sum_total_purchase_eur, order_descriptors.number_of_delivered_orders,
      order_descriptors.bu_number_of_delivered_orders, order_descriptors.bu_number_of_delivered_orders_prime,
      order_descriptors.bu_average_total_purchase_eur, order_descriptors.number_of_delivered_orders_prime,
      order_descriptors.order_activated_local_week_of_year]
    filters:
      order_descriptors.order_subvertical: ''
      order_descriptors.order_vertical: ''
      order_descriptors.order_activated_local_month: 5 months
      order_descriptors.order_activated_local_week: 4 week ago for 4 week
      order_descriptors.order_final_status: DeliveredStatus
      order_descriptors.filter_bu_store_name: ''
      order_descriptors.filter_bu_subvertical2: ''
      order_descriptors.filter_bu_subvertical3: ''
      order_descriptors.number_of_delivered_orders: NOT NULL
      order_descriptors.order_parent_relationship_type: 'NULL'
    sorts: [order_descriptors.order_activated_local_week]
    limit: 5
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${order_descriptors.bu_sum_total_purchase_eur} / offset(${order_descriptors.bu_sum_total_purchase_eur},\
        \ -1) -1)"
      label: BU GMV $ Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_gmv_growth
      _type_hint: number
    - category: table_calculation
      expression: |-
        ${order_descriptors.bu_sum_total_purchase_eur}/
        ${order_descriptors.sum_total_purchase_eur}
      label: BU GMV $ Penetration (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_gmv_penetration
      _type_hint: number
    - category: table_calculation
      expression: "(${order_descriptors.bu_number_of_delivered_orders} / offset(${order_descriptors.bu_number_of_delivered_orders},\
        \ -1) -1)"
      label: BU Delivered Orders Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_delivered_orders_growth
      _type_hint: number
    - category: table_calculation
      expression: "(${order_descriptors.number_of_delivered_orders} / offset(${order_descriptors.number_of_delivered_orders},\
        \ -1) -1)"
      label: Glovo Delivered Orders Growth (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: glovo_delivered_orders_growth
      _type_hint: number
    - category: table_calculation
      expression: |2-
         ${order_descriptors.bu_number_of_delivered_orders}/
        ${order_descriptors.number_of_delivered_orders}
      label: BU Order Penetration in Glovo (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_order_penetration_in_glovo
      _type_hint: number
    - category: table_calculation
      expression: |-
        ${order_descriptors.bu_number_of_delivered_orders_prime}/
        ${order_descriptors.number_of_delivered_orders_prime}
      label: Prime Penetration in BU Order (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: prime_penetration_in_bu_order
      _type_hint: number
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: glovo-monochromatic
      palette_id: glovo-monochromatic-categorical-0
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", order_descriptors.order_activated_local_week,
      order_descriptors.bu_sum_total_purchase_eur, bu_gmv_growth, bu_gmv_penetration,
      order_descriptors.bu_number_of_delivered_orders, bu_delivered_orders_growth,
      order_descriptors.bu_average_total_purchase_eur, order_descriptors.number_of_delivered_orders,
      glovo_delivered_orders_growth, bu_order_penetration_in_glovo, order_descriptors.bu_number_of_delivered_orders_prime]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      order_descriptors.order_activated_local_week: Week
    series_cell_visualizations:
      order_descriptors.bu_number_of_delivered_orders:
        is_active: false
    series_text_format:
      order_descriptors.order_activated_local_week: {}
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: glovo-monochromatic,
          palette_id: glovo-monochromatic-diverging-0}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_fields: [order_descriptors.sum_total_purchase_eur, order_descriptors.number_of_delivered_orders_prime,
      order_descriptors.bu_number_of_delivered_orders_prime]
    hidden_points_if_no: []
    theme: looker
    customTheme: ''
    layout: fixed
    minWidthForIndexColumns: true
    headerFontSize: 12
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder:
      order_descriptors.bu_sum_total_purchase_eur: 0
      order_descriptors.number_of_delivered_orders: 60
      order_descriptors.bu_number_of_delivered_orders: 30
      order_descriptors.bu_average_total_purchase_eur: 50
      bu_gmv_growth: 10
      bu_gmv_penetration: 20
      bu_delivered_orders_growth: 40
      glovo_delivered_orders_growth: 70
      bu_order_penetration_in_glovo: 80
      prime_penetration_in_bu_order: 90
    rowSubtotals: false
    colSubtotals: false
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: pivots
    useViewName: false
    useHeadings: false
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|order_descriptors.order_activated_local_week: Order Activated Local Week
    heading|order_descriptors.order_activated_local_week: ''
    hide|order_descriptors.order_activated_local_week: false
    subtotalDepth: '1'
    label|order_descriptors.bu_sum_total_purchase_eur: BU GMV €
    heading|order_descriptors.bu_sum_total_purchase_eur: ''
    style|order_descriptors.bu_sum_total_purchase_eur: normal
    reportIn|order_descriptors.bu_sum_total_purchase_eur: '1'
    unit|order_descriptors.bu_sum_total_purchase_eur: ''
    comparison|order_descriptors.bu_sum_total_purchase_eur: no_variance
    switch|order_descriptors.bu_sum_total_purchase_eur: false
    var_num|order_descriptors.bu_sum_total_purchase_eur: true
    var_pct|order_descriptors.bu_sum_total_purchase_eur: false
    label|order_descriptors.number_of_delivered_orders: Glovo Delivered Orders
    heading|order_descriptors.number_of_delivered_orders: ''
    style|order_descriptors.number_of_delivered_orders: normal
    reportIn|order_descriptors.number_of_delivered_orders: '1'
    unit|order_descriptors.number_of_delivered_orders: ''
    comparison|order_descriptors.number_of_delivered_orders: no_variance
    switch|order_descriptors.number_of_delivered_orders: false
    var_num|order_descriptors.number_of_delivered_orders: true
    var_pct|order_descriptors.number_of_delivered_orders: false
    label|order_descriptors.bu_number_of_delivered_orders: BU Delivered Orders
    heading|order_descriptors.bu_number_of_delivered_orders: ''
    style|order_descriptors.bu_number_of_delivered_orders: normal
    reportIn|order_descriptors.bu_number_of_delivered_orders: '1'
    unit|order_descriptors.bu_number_of_delivered_orders: ''
    comparison|order_descriptors.bu_number_of_delivered_orders: no_variance
    switch|order_descriptors.bu_number_of_delivered_orders: false
    var_num|order_descriptors.bu_number_of_delivered_orders: true
    var_pct|order_descriptors.bu_number_of_delivered_orders: false
    label|order_descriptors.bu_average_total_purchase_eur: BU AOV €
    heading|order_descriptors.bu_average_total_purchase_eur: ''
    style|order_descriptors.bu_average_total_purchase_eur: normal
    reportIn|order_descriptors.bu_average_total_purchase_eur: '1'
    unit|order_descriptors.bu_average_total_purchase_eur: ''
    comparison|order_descriptors.bu_average_total_purchase_eur: no_variance
    switch|order_descriptors.bu_average_total_purchase_eur: false
    var_num|order_descriptors.bu_average_total_purchase_eur: true
    var_pct|order_descriptors.bu_average_total_purchase_eur: false
    label|bu_gmv_growth: BU GMV € Growth (%)
    heading|bu_gmv_growth: ''
    style|bu_gmv_growth: normal
    reportIn|bu_gmv_growth: '1'
    unit|bu_gmv_growth: ''
    comparison|bu_gmv_growth: no_variance
    switch|bu_gmv_growth: false
    var_num|bu_gmv_growth: true
    var_pct|bu_gmv_growth: false
    label|bu_gmv_penetration: BU GMV € Penetration (%)
    heading|bu_gmv_penetration: ''
    style|bu_gmv_penetration: normal
    reportIn|bu_gmv_penetration: '1'
    unit|bu_gmv_penetration: ''
    comparison|bu_gmv_penetration: no_variance
    switch|bu_gmv_penetration: false
    var_num|bu_gmv_penetration: true
    var_pct|bu_gmv_penetration: false
    label|bu_delivered_orders_growth: BU Delivered Orders Growth (%)
    heading|bu_delivered_orders_growth: ''
    style|bu_delivered_orders_growth: normal
    reportIn|bu_delivered_orders_growth: '1'
    unit|bu_delivered_orders_growth: ''
    comparison|bu_delivered_orders_growth: no_variance
    switch|bu_delivered_orders_growth: false
    var_num|bu_delivered_orders_growth: true
    var_pct|bu_delivered_orders_growth: false
    label|glovo_delivered_orders_growth: Glovo Delivered Orders Growth (%)
    heading|glovo_delivered_orders_growth: ''
    style|glovo_delivered_orders_growth: normal
    reportIn|glovo_delivered_orders_growth: '1'
    unit|glovo_delivered_orders_growth: ''
    comparison|glovo_delivered_orders_growth: no_variance
    switch|glovo_delivered_orders_growth: false
    var_num|glovo_delivered_orders_growth: true
    var_pct|glovo_delivered_orders_growth: false
    label|bu_order_penetration_in_glovo: BU Order Penetration in Glovo (%)
    heading|bu_order_penetration_in_glovo: ''
    style|bu_order_penetration_in_glovo: normal
    reportIn|bu_order_penetration_in_glovo: '1'
    unit|bu_order_penetration_in_glovo: ''
    comparison|bu_order_penetration_in_glovo: no_variance
    switch|bu_order_penetration_in_glovo: false
    var_num|bu_order_penetration_in_glovo: true
    var_pct|bu_order_penetration_in_glovo: false
    label|prime_penetration_in_bu_order: Prime Penetration in BU Order (%)
    heading|prime_penetration_in_bu_order: ''
    style|prime_penetration_in_bu_order: normal
    reportIn|prime_penetration_in_bu_order: '1'
    unit|prime_penetration_in_bu_order: ''
    comparison|prime_penetration_in_bu_order: no_variance
    switch|prime_penetration_in_bu_order: false
    var_num|prime_penetration_in_bu_order: true
    var_pct|prime_penetration_in_bu_order: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Subregion: order_descriptors.order_country_subregion
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.filter_bu_vertical
      Order Subvertical (BU): order_descriptors.filter_bu_subvertical
    row: 9
    col: 2
    width: 11
    height: 5
  - title: GMV 20 (Monthly)
    name: GMV 20 (Monthly)
    model: central_dm_cert
    explore: order_descriptors
    type: looker_grid
    fields: [order_descriptors.sum_total_purchase_eur, order_descriptors.bu_sum_total_purchase_eur,
      order_descriptors.number_of_delivered_orders, order_descriptors.bu_number_of_delivered_orders,
      order_descriptors.bu_number_of_delivered_orders_prime, order_descriptors.bu_average_total_purchase_eur,
      order_descriptors.number_of_delivered_orders_prime, order_descriptors.order_activated_local_month]
    filters:
      order_descriptors.order_subvertical: ''
      order_descriptors.order_vertical: ''
      order_descriptors.order_activated_local_month: 5 months
      order_descriptors.order_final_status: DeliveredStatus
      order_descriptors.filter_bu_store_name: ''
      order_descriptors.filter_bu_subvertical2: ''
      order_descriptors.filter_bu_subvertical3: ''
      order_descriptors.number_of_delivered_orders: NOT NULL
      order_descriptors.order_parent_relationship_type: 'NULL'
    sorts: [order_descriptors.order_activated_local_month]
    limit: 5
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: BU GMV $ Growth (%)
      value_format:
      value_format_name: percent_1
      calculation_type: percent_difference_from_previous
      table_calculation: bu_gmv_growth
      args:
      - order_descriptors.bu_sum_total_purchase_eur
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: |-
        ${order_descriptors.bu_sum_total_purchase_eur}/
        ${order_descriptors.sum_total_purchase_eur}
      label: BU GMV $ Penetration (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_gmv_penetration
      _type_hint: number
    - category: table_calculation
      label: BU Delivered Orders Growth (%)
      value_format:
      value_format_name: percent_1
      calculation_type: percent_difference_from_previous
      table_calculation: bu_delivered_orders_growth
      args:
      - order_descriptors.bu_number_of_delivered_orders
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      label: Glovo Delivered Orders Growth (%)
      value_format:
      value_format_name: percent_1
      calculation_type: percent_difference_from_previous
      table_calculation: glovo_delivered_orders_growth
      args:
      - order_descriptors.number_of_delivered_orders
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: |2-
         ${order_descriptors.bu_number_of_delivered_orders}/
        ${order_descriptors.number_of_delivered_orders}
      label: BU Order Penetration in Glovo (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: bu_order_penetration_in_glovo
      _type_hint: number
    - category: table_calculation
      expression: |-
        ${order_descriptors.bu_number_of_delivered_orders_prime}/
        ${order_descriptors.number_of_delivered_orders_prime}
      label: Prime Penetration in BU Order (%)
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      table_calculation: prime_penetration_in_bu_order
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      order_descriptors.bu_number_of_delivered_orders:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [order_descriptors.sum_total_purchase_eur, order_descriptors.number_of_delivered_orders_prime,
      order_descriptors.bu_number_of_delivered_orders_prime]
    column_order: ["$$$_row_numbers_$$$", order_descriptors.order_activated_local_week,
      order_descriptors.bu_sum_total_purchase_eur, bu_gmv_growth, bu_gmv_penetration,
      order_descriptors.bu_number_of_delivered_orders, bu_delivered_orders_growth,
      order_descriptors.bu_average_total_purchase_eur, order_descriptors.number_of_delivered_orders,
      glovo_delivered_orders_growth, bu_order_penetration_in_glovo, order_descriptors.bu_number_of_delivered_orders_prime]
    listen:
      Subregion: order_descriptors.order_country_subregion
      Country: order_descriptors.order_country_code
      City: order_descriptors.order_city_code
      Order Handling Strategy: order_descriptors.order_handling_strategy
      Order Subvertical2 (BU): order_descriptors.order_subvertical2
      Order Subvertical3 (BU): order_descriptors.order_subvertical3
      Store Name (BU): order_descriptors.store_name
      Store ID (BU): order_descriptors.store_id
      Order Is Prime (Yes / No): order_descriptors.order_is_prime
      Partition key (Order Creation Date): order_descriptors.p_creation_date
      Order Vertical (BU): order_descriptors.filter_bu_vertical
      Order Subvertical (BU): order_descriptors.filter_bu_subvertical
    row: 9
    col: 13
    width: 11
    height: 5
  filters:
  - name: Order Activated Local Week
    title: Order Activated Local Week
    type: date_filter
    default_value: 4 weeks ago for 4 weeks
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
  - name: Order Activated Local Month
    title: Order Activated Local Month
    type: date_filter
    default_value: 5 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
  - name: Subregion
    title: Subregion
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: order_descriptors.order_country_subregion
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: order_descriptors.order_country_code
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: order_descriptors.order_city_code
  - name: Order Handling Strategy
    title: Order Handling Strategy
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - GEN1
      - GEN2
      - PICKUP
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: order_descriptors.order_handling_strategy
  - name: Order Vertical (BU)
    title: Order Vertical (BU)
    type: field_filter
    default_value: QCommerce
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - QCommerce
      - Food
      - LaaS
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: order_descriptors.order_vertical
  - name: Order Subvertical (BU)
    title: Order Subvertical (BU)
    type: field_filter
    default_value: QCPartners,MFC
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - MFC
      - QCPartners
      - Quiero
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: [Order Vertical (BU)]
    field: order_descriptors.order_subvertical
  - name: Order Subvertical2 (BU)
    title: Order Subvertical2 (BU)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options:
      - Groceries
      - Quiero
      - Retail
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: [Order Vertical (BU), Order Subvertical (BU)]
    field: order_descriptors.order_subvertical2
  - name: Order Subvertical3 (BU)
    title: Order Subvertical3 (BU)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - Groceries
      - Health
      - Quiero
      - Shops
      - Smoking
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: [Order Vertical (BU), Order Subvertical (BU)]
    field: order_descriptors.order_subvertical3
  - name: MFC Name (BU)
    title: MFC Name (BU)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: mfc_store_addresses.mfc_name
  - name: Store Is Specialty? (BU)
    title: Store Is Specialty? (BU)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: stores.is_specialty
  - name: Store Sub-Business Unit (BU)
    title: Store Sub-Business Unit (BU)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: stores.store_sub_business_unit
  - name: Store Name (BU)
    title: Store Name (BU)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: [Order Vertical (BU), Order Subvertical (BU)]
    field: order_descriptors.store_name
  - name: Partition key (Order Creation Date)
    title: Partition key (Order Creation Date)
    type: field_filter
    default_value: 6 month
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: order_descriptors.p_creation_date
  - name: Store ID (BU)
    title: Store ID (BU)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: order_descriptors.store_id
  - name: Order Is Prime (Yes / No)
    title: Order Is Prime (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
    model: central_dm_cert
    explore: order_descriptors
    listens_to_filters: []
    field: order_descriptors.order_is_prime

- dashboard: test_dash
  title: Sys Act Performance Dashboard
  layout: newspaper
  elements:
  - name: '1'
    type: text
    title_text: ''
    body_text: <font size="6" color="navy">Queries<br>Per<br>Source</font>
    row: 0
    col: 0
    width: 3
    height: 6
  - name: '2'
    type: text
    body_text: <font size="6" color="navy">Queries<br>Per<br>User</font>
    row: 6
    col: 0
    width: 3
    height: 6
  - name: '3'
    type: text
    body_text: <font size="5" color="navy">Dashboard<br>Refresh<br>and<br>Downloads</font>
    row: 12
    col: 0
    width: 3
    height: 5
  - title: Scheduled jobs by source
    name: Scheduled jobs by source
    model: system__activity
    explore: scheduled_plan
    type: looker_line
    fields: [scheduled_job.created_date, source, scheduled_job.count]
    pivots: [source]
    fill_fields: [scheduled_job.created_date]
    filters:
      scheduled_plan.run_once: 'no'
      scheduled_job.created_date: 14 days
    sorts: [scheduled_job.created_date desc, source]
    limit: 500
    dynamic_fields: [{dimension: source, label: Source, expression: "if(NOT is_null(${scheduled_job.look_id}),\
          \ \"look\",\n  if(NOT is_null(${scheduled_job.dashboard_id}),\"dashboard\"\
          ,\"other\"\n    )\n  )", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    query_timezone: UTC
    color_application:
      collection_id: b6347139-8179-43dd-9c1b-edf08aba97e0
      palette_id: 64711cb9-7c31-47af-ab1a-7772bc773b5f
      options:
        steps: 5
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
    row: 17
    col: 14
    width: 10
    height: 6
  - title: Scheduled jobs by content id
    name: Scheduled jobs by content id
    model: system__activity
    explore: scheduled_plan
    type: looker_column
    fields: [scheduled_job.created_date, source, scheduled_job.count, content_id]
    pivots: [source, content_id]
    fill_fields: [scheduled_job.created_date]
    filters:
      scheduled_plan.run_once: 'no'
      scheduled_job.created_date: 14 days
    sorts: [scheduled_job.created_date desc, source, content_id]
    limit: 500
    dynamic_fields: [{dimension: source, label: Source, expression: "if(NOT is_null(${scheduled_job.look_id}),\
          \ \"look\",\n  if(NOT is_null(${scheduled_job.dashboard_id}),\"dashboard\"\
          ,\"other\"\n    )\n  )", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}, {dimension: content_id, label: Content
          Id, expression: 'if(${source}="dashboard",${scheduled_job.dashboard_id},${scheduled_job.look_id})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: UTC
    color_application:
      collection_id: b6347139-8179-43dd-9c1b-edf08aba97e0
      palette_id: 64711cb9-7c31-47af-ab1a-7772bc773b5f
      options:
        steps: 5
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
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 17
    col: 3
    width: 11
    height: 6
  - name: ''
    type: text
    body_text: <font size="6" color="navy">Schedules</font>
    row: 17
    col: 0
    width: 3
    height: 6
  - title: Unlimited Downloads
    name: Unlimited Downloads
    model: system__activity
    explore: history
    type: table
    fields: [history.created_time, query.link, user.id, user.name]
    filters:
      query.limit: "%-1%"
    sorts: [history.created_time desc]
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen: {}
    row: 12
    col: 14
    width: 10
    height: 5
  - title: dashboard with refresh interval
    name: dashboard with refresh interval
    model: system__activity
    explore: history
    type: table
    fields: [dashboard.title, history.real_dash_id, dashboard.refresh_interval]
    filters:
      dashboard.refresh_interval: "-NULL"
    sorts: [dashboard.refresh_interval desc]
    limit: 50
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 225}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml, __LINE_NUM: 220}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 12
    col: 3
    width: 11
    height: 5
  - title: query per user -hourly today
    name: query per user -hourly today
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, user.name, history.created_hour_of_day]
    pivots: [user.name]
    fill_fields: [history.created_hour_of_day]
    filters:
      history.created_date: 1 days
    sorts: [user.name 0, history.created_hour_of_day]
    limit: 500
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 180}, bold: false, italic: false, strikethrough: false, fields: [
          history.query_run_count], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
        __LINE_NUM: 175, color_application: {collection_id: legacy, custom: {id: 4843ba73-6e60-e9d2-a6b6-750160e2cf50,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 6
    col: 14
    width: 10
    height: 6
  - title: query per user -daily last 7days
    name: query per user -daily last 7days
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, user.name, history.created_day_of_week]
    pivots: [user.name]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [user.name 0, history.created_day_of_week]
    limit: 500
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 133}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml, __LINE_NUM: 128,
        color_application: {collection_id: legacy, custom: {id: e6b8c20d-c5be-ebda-46b7-f0cb8d9ee81d,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 6
    col: 3
    width: 11
    height: 6
  - title: query per source -hourly today
    name: query per source -hourly today
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, history.source, history.created_hour_of_day]
    pivots: [history.source]
    fill_fields: [history.created_hour_of_day]
    filters:
      history.created_date: 1 days
    sorts: [history.source 0, history.created_hour_of_day]
    limit: 500
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 83}, bold: false, italic: false, strikethrough: false, fields: [
          history.query_run_count], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
        __LINE_NUM: 78, color_application: {collection_id: legacy, custom: {id: 2120bd97-6bf2-0ed4-e64f-9959eccf6cc2,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 0
    col: 14
    width: 10
    height: 6
  - title: query per source -daily last 7days
    name: query per source -daily last 7days
    model: system__activity
    explore: history
    type: table
    fields: [history.query_run_count, history.source, history.created_day_of_week]
    pivots: [history.source]
    fill_fields: [history.created_day_of_week]
    filters:
      history.created_date: 7 days
    sorts: [history.source 0, history.created_day_of_week]
    limit: 500
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', palette: {name: Red to Yellow to Green, colors: ["#F36254",
            "#FCF758", "#4FBC89"], __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml,
          __LINE_NUM: 36}, bold: false, italic: false, strikethrough: false, fields: !!null '',
        __FILE: sandbox/sys_act_performance_dashboard.dashboard.lookml, __LINE_NUM: 31,
        color_application: {collection_id: legacy, custom: {id: 35adb615-92f6-1be9-0c85-5f578df91827,
            label: Custom, type: continuous, stops: [{color: "#F36254", offset: 0},
              {color: "#FCF758", offset: 50}, {color: "#4FBC89", offset: 100}]}, options: {
            steps: 5, reverse: true}}}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 0
    col: 3
    width: 11
    height: 6

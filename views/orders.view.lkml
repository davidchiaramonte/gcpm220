view: orders {
  label: "orders"
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }


  dimension: status_new {
    type: string
    sql: CASE
         WHEN ${TABLE}.status = 'cancelled' THEN '{{ _localization['cancelled'] }}'
         WHEN ${TABLE}.status = 'pending' THEN '{{ _localization['pendingggg'] }}'
         WHEN ${TABLE}.status = 'complete' THEN '{{ _localization['complete'] }}'
         END ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  parameter: dynamic_field_toggle {
    type: unquoted
    allowed_value: {
      label: "ID"
      value: "id"
    }
    allowed_value: {
      label: "Status"
      value: "status"
    }
  }

  dimension: dynamic_field {
    type: string
    sql:
    {% if dynamic_field_toggle._parameter_value == 'id' %}
    ${id}
    {% else %}
    ${status}
    {% endif %};;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    link: {
      label: "Google"
      url: "https://www.google.com/"
    }
    link: {
      label: "Check out this other Explore"
      url: "/explore/ak1/ints"
    }
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      ten_million_orders.count
    ]
  }
}

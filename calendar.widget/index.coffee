refreshFrequency: 60000

style: """
  top: 30px
  right: 128px
  color: #fff
  font-family: Helvetica Neue

  table
    border-collapse: collapse
    table-layout: fixed

  td
    text-align: center
    padding: 4px 6px
    text-shadow: 0 0 1px rgba(#000, 0.5)

  thead tr
    &:first-child td
      font-size: 24px
      font-weight: 300

    &:last-child td
      font-size: 11px
      padding-bottom: 10px
      font-weight: 500

  tbody td
    font-size: 12px

  .today
    font-weight: bold
    color: cyan;
#background: rgba(#fff, 0.2)
    border-radius: 50%
"""

render: -> """
  <table>
    <thead>

    </thead>
    <tbody>
    </tbody>
  </table>
"""

monthName: (month) ->
  return ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"][month]

updateHeader: (table, date) ->
  month = "#{@monthName(date.getMonth())} #{date.getFullYear()}"
  thead = table.find("thead")
  thead.empty()

  thead.append "<tr><td colspan='7'>#{month}</td></tr>"
  tableRow = $("<tr></tr>").appendTo(thead)

  for dayOfWeek in ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
    tableRow.append "<td>#{dayOfWeek}</td>"

updateBody: (table, date) ->
  tbody = table.find("tbody")
  tbody.empty()

  today = date.getDate();
  daysInMonth = new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate()
  emptyDays = new Date(date.getFullYear(), date.getMonth(), 1).getDay() - 1
  if (emptyDays < 0)
    emptyDays = 6

  day = 1
  while (day <= daysInMonth)
    tableRow = $("<tr></tr>").appendTo(tbody)
    daysInWeek = 0
    while (day <= daysInMonth && daysInWeek++ < 7)
      if(emptyDays-- > 0)
        $("<td></td>").appendTo(tableRow)
      else
        cell = $("<td>#{day}</td>").appendTo(tableRow)
        cell.addClass("today") if day == today
        day++

update: (output, domEl) ->
  table = $(domEl).find("table")

  date = new Date()

  @updateHeader table, date
  @updateBody table, date

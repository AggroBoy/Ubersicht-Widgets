command: "systat.widget/stats.rb"

refreshFrequency: 60000

style: """
  bottom: 0px
  right: 0px
  color: rgba(255, 255, 255, 0.6)
  font-family: "Source Code Pro"
  font-size: 10pt
  font-weight: 100
  background: rgba(0, 0, 0, 0.4)
  padding: 12px 10px 5px 20px
  border-top-left-radius: 10px

  .hostname
    border-bottom: 0

  .stats
    margin-top: 0
    font-family: "Source Code Pro"
    font-size: 10pt
    margin-left: 1em

  .error
    color: orange
    font-weight: bold


"""

render: (output)-> """
#{output}
"""


$ ->
  $(document).ready ->
    Highcharts.setOptions global:
      useUTC: false

    chart = undefined
    $("#tickchart").highcharts
      chart:
        type: "spline"
        animation: Highcharts.svg # don't animate in old IE
        marginRight: 10
        events:
          load: ->
            
            # set up the updating of the chart each second
            series = @series[0]
            setInterval (->
              x = (new Date()).getTime() # current time
              y = Math.random()
              series.addPoint [x, y], true, true
            ), 1000

      title:
        text: "Live random data"

      xAxis:
        type: "datetime"
        tickPixelInterval: 150

      yAxis:
        title:
          text: "Value"

        plotLines: [
          value: 0
          width: 1
          color: "#808080"
        ]

      tooltip:
        formatter: ->
          "<b>" + @series.name + "</b><br/>" + Highcharts.dateFormat("%Y-%m-%d %H:%M:%S", @x) + "<br/>" + Highcharts.numberFormat(@y, 2)

      legend:
        enabled: true

      exporting:
        enabled: false

      series: [
        name: "Random data"
        data: (->
          
          # generate an array of random data
          data = []
          time = (new Date()).getTime()
          i = undefined
          i = -19
          while i <= 0
            data.push
              x: time + i * 1000
              y: Math.random()

            i++
          data
        )()
      ]

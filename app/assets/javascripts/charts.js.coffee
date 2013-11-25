$ ->
  rnow = new Date()
  yest = new Date()
  yest.setTime(rnow.getTime() - 1000 * 60 * 60 * 24)
  dataurl = dataURL('SPY', yest, rnow)  
  $.getJSON dataURL, (data) ->
    # Create the chart
    $("#tickchart").highcharts "StockChart",
      rangeSelector:
        selected: 2

      title:
        text: "Click an instrument to get data."

      series: [
        name: "SPY"
        data: data
        lineWidth: 0
        marker:
          enabled: true
          radius: 2

        tooltip:
          valueDecimals: 2
      ]

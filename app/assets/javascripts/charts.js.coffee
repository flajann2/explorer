$ ->
  $.getJSON "http://localhost:3000/market_data/data/SPY/1378381132361/1378384732361", (data) ->
    # Create the chart
    $("#tickchart").highcharts "StockChart",
      rangeSelector:
        selected: 2

      title:
        text: "SPY tick data"

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

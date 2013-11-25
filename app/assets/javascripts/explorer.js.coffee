app = angular.module("Explorer", ["ngResource"])

app.factory "Symbols", ($resource) ->
  $resource("/market_data/index")

app.factory "ChartData", ($resource) ->
  $resource("/market_data/data")

@dataURL = (symbol, tstart, tend) ->
  return "http://localhost:3000/market_data/data/" + escape(symbol) \
            + "/" + tstart.getTime() + "/" + tend.getTime()  

@SymbolsCtrl = ($scope, Symbols) ->
  $scope.sySelected = {name: 'NONE'}
  $scope.symlist = Symbols.query()

  $scope.selectInstrument = (sy) ->
    $scope.sySelected = sy
    $scope.tickchart = $("#tickchart").highcharts()
    $scope.tickchart.setTitle(text: sy.name)
    rnow = new Date()
    yest = new Date()
    yest.setTime(rnow.getTime() - 1000 * 60 * 60 * 24)
    dataurl = dataURL(sy.name, yest, rnow)
    $.getJSON dataurl, (data) ->
      $scope.tickchart.series[0].remove()
      $scope.tickchart.addSeries({
            name: sy.name
            data: data
            lineWidth: 1
            marker:
              enabled: true
              radius: 2
            tooltip:
              valueDecimals: 2
        })

@ChartCtrl = ($scope, ChartData) ->
  $scope.chart = [
  ]
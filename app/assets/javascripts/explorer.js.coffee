app = angular.module("Explorer", ["ngResource"])

app.factory "Symbols", ($resource) ->
  $resource("/market_data/index")

app.factory "ChartData", ($resource) ->
  $resource("/market_data/data")

@SymbolsCtrl = ($scope, Symbols) ->
  $scope.sySelected = {name: 'NONE'}
  $scope.symlist = Symbols.query()

  $scope.selectInstrument = (sy) ->
    $scope.sySelected = sy
    $scope.tickchart = $("#tickchart").highcharts()
    $scope.tickchart.setTitle(text: sy.name)
    rnow = new Date()
    yest = new Date()
    yest.setDate(rnow.getDate() - 4)
    dataurl = "http://localhost:3000/market_data/data/" + escape(sy.name) \
            + "/" + yest.getTime() + "/" + rnow.getTime()
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
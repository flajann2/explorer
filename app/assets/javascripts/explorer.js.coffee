app = angular.module("Explorer", ["ngResource"])

app.factory "Symbols", ($resource) ->
  $resource("/market_data/index")

@SymbolsCtrl = ($scope, Symbols) ->
  $scope.symlist = Symbols.query()

  $scope.selectInstrument = (sy) ->
    $scope.sySelected.name = sy.name

@ChartCtrl = ($scope, $resource) ->
  ChartData = $resource("/market_data/data")
  $scope.chart = [
  ]
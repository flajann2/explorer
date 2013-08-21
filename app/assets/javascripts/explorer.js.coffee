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

@ChartCtrl = ($scope, ChartData) ->
  $scope.chart = [
  ]
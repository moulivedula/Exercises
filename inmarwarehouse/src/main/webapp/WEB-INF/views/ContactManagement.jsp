<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html ng-app="app">
  <head>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.7.0/angular.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.7.0/angular-touch.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.7.0/angular-animate.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.7.0/angular-aria.js"></script>
    <script src="http://ui-grid.info/docs/grunt-scripts/csv.js"></script>
    <script src="http://ui-grid.info/docs/grunt-scripts/pdfmake.js"></script>
    <script src="http://ui-grid.info/docs/grunt-scripts/vfs_fonts.js"></script>
    <script src="http://ui-grid.info/docs/grunt-scripts/lodash.min.js"></script>
    <script src="http://ui-grid.info/docs/grunt-scripts/jszip.min.js"></script>
    <script src="http://ui-grid.info/docs/grunt-scripts/excel-builder.dist.js"></script>
    <script src="http://ui-grid.info/release/ui-grid.js"></script>
    <link rel="stylesheet" href="http://ui-grid.info/release/ui-grid.css" type="text/css">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    

	<style>
		.grid {
		  width: 1150px;
		  height: 450px;
		}
	</style>
  </head>
  <body>
<div class="panel-heading">
          		<span class="lead">External Contacts </span> 
          		
          		<a data-toggle="collapse" href="#myDiv" style="float: right; margin-right: 100px">Collapse</a>
          		<button data-toggle="collapse" data-target="#myDiv" style="height:10px; float: right;margin-right: 5px">-</button><br>
          		<span class="col-md-7">Select the Client contacts associated with the offer </span><br>
	
	<div id="myDiv" class="collapse in" ng-controller="MainCtrl">
	  <div ui-grid="gridOptions" ui-grid-edit ui-grid-row-edit ui-grid-cellNav class="grid"></div>
	</div>
	
</div>

    <script type="text/javascript">
    var app = angular.module('app', ['ngTouch', 'ui.grid', 'ui.grid.edit', 'ui.grid.rowEdit', 'ui.grid.cellNav']);
    var REST_SERVICE_URI = 'http://localhost:8080/inmarwarehouse/api/v1/';
    /*angular.module('addressFormatter', []).filter('address', function () {
      return function (input) {
          return input.street + ', ' + input.city + ', ' + input.state + ', ' + input.zip;
      };
    });*/

    app.controller('MainCtrl', ['$scope', '$http', '$q', '$interval', function ($scope, $http, $q, $interval) {
      $scope.gridOptions = {};

      $scope.gridOptions.columnDefs = [
        { name: 'id', enableCellEdit: false },
        { name: 'type', displayName: 'Type' },
        { name: 'name', displayName: 'Name' },
        { name: 'title', displayName: 'Title' },
        { name: 'phone', displayName: 'Phone' },
        { name: 'ext', displayName: 'Ext' },
        { name: 'fax', displayName: 'Fax' },
        { name: 'email', displayName: 'Email' }
      ];

      $scope.gridOptions.data = [];
      
      $scope.saveRow = function( rowEntity ) {
    	  console.log("rowEntityID :" + rowEntity.id);
    	  console.log(rowEntity);
    	  var promise = updateRow(rowEntity);
    	  return promise;
      };
      
      function updateRow(rowEntity){
    	  var promise = $q.defer();
    	  $http.put(REST_SERVICE_URI+"contact/"+rowEntity.id, rowEntity)
		.then(
	  		function (success){
	            console.log("post success");
	            promise.resolve();
	            return promise;
        	},
	      	function(errResponse){
	            console.log("post failure");
	            return promise;
        	}
        );
    	return {};
      }

      $scope.gridOptions.onRegisterApi = function(gridApi){
        //set gridApi on scope
        $scope.gridApi = gridApi;
        var promise = gridApi.rowEdit.on.saveRow($scope, $scope.saveRow);
      };

      $http.get(REST_SERVICE_URI+'/contact')
      .then(function(response) {
        var data = response.data;

        for(i = 0; i < data.length; i++){
          data[i].registered = new Date(data[i].registered);
        }
        $scope.gridOptions.data = data;
      });
    }]);

    </script>
  </body>
</html>
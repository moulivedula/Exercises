'use strict';
 
angular.module('myApp').factory('ItemService', ['$http', '$q', function($http, $q){
 
    var REST_SERVICE_URI = 'http://localhost:8080/inmarwarehouse/api/v1/';
 
    var factory = {
    	fetchAllItems: fetchAllItems,
    	createItem: createItem,
        updateItem:updateItem,
        deleteItem:deleteItem
    };
 
    return factory;
 
    function fetchAllItems() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+"location/")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Items');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
    function createItem(item) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI+"item/", item)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating Item');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
 
    function updateItem(item, sku) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+"item/"+sku, item)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating Item');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
    function deleteItem(sku) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+"item/"+sku)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting Item');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
}]);
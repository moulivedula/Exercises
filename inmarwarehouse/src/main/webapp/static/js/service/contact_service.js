'use strict';
 
angular.module('myApp').factory('ContactService', ['$http', '$q', function($http, $q){
 
    var REST_SERVICE_URI = 'http://localhost:8080/inmarwarehouse/api/v1/';
 
    var factory = {
    	fetchAllContacts: fetchAllContacts,
    	createContact: createContact,
        updateContact:updateContact,
        deleteContact:deleteContact
    };
 
    return factory;
 
    function fetchAllContacts() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI+"contact/")
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Contacts');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
    function createContact(contact) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI+"contact/", contact)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating Contact');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
 
    function updateContact(contact, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+"contact/"+id, contact)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating Contact');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
    function deleteContact(id) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+"contact/"+id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting Contact');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
 
}]);
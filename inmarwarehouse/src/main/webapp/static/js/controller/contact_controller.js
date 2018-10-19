'use strict';
 
angular.module('myApp').controller('ContactController', ['$scope', 'ContactService', function($scope, ContactService) {
    var self = this;
    self.contact={id:null,type:'',name:'',title:'',phone:'',ext:'',fax:'',email:''};
    $scope.contacts=[];
    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;
 
    fetchAllContacts();
 
    $scope.gridOptions = {
  		  enableFiltering: true,
  		  paginationPageSizes: [25, 50, 75],
  		  paginationPageSize: 10,
  		  columnDefs: [
	  		  { field: 'id' },
	  		  { field: 'Type' },
	  		  { field: 'name' },
	  		  { field: 'title', enableFiltering: false },
	  		  { field: 'phone' },
	  		  { field: 'ext' },
	  		  { field: 'fax' },
	  		  { field: 'email' }
  		  ],

  		  onRegisterApi: function (gridApi) {
  		  	$scope.grid1Api = gridApi;
  		  }

  	};
    
 
    function fetchAllContacts(){
    	console.log("In fetchAllContacts :");
        ContactService.fetchAllContacts()
            .then(
            function(d) {
            	$scope.contacts = d;
                $scope.gridOptions.data = d;
                
            	console.log("In fetchAllContacts success :");
            	console.log($scope.contacts);
            },
            function(errResponse){
                console.error('Error while fetching Contact');
            }
        );
    }
 
    function createContact(contact){
        ContactService.createContact(contact)
            .then(
            fetchAllContacts,
            function(errResponse){
                console.error('Error while creating Contact');
            }
        );
    }
 
    function updateContact(contact, id){
        ContactService.updateContact(contact, id)
            .then(
            fetchAllContacts,
            function(errResponse){
                console.error('Error while updating Contact');
            }
        );
    }
 
    function deleteContact(id){
        ContactService.deleteContact(id)
            .then(
            fetchAllContacts,
            function(errResponse){
                console.error('Error while deleting Contact');
            }
        );
    }
 
    function submit() {
        if(self.contact.id===null){
            console.log('Saving New Contact', self.contact);
            createContact(self.contact);
        }else{
            updateContact(self.contact, self.contact.id);
            console.log('Contact updated with ID ', self.contact.id);
        }
        reset();
    }
 
    function edit(id){
        console.log('ID to be edited', id);
        for(var i = 0; i < $scope.contacts.length; i++){
            if($scope.contacts[i].id === id) {
                self.contact = angular.copy($scope.contacts[i]);
                break;
            }
        }
    }
 
    function remove(id){
        console.log('ID to be deleted', id);
        if($scope.contacts.id === id) {//clean form if the user to be deleted is shown there.
            reset();
        }
        deleteContact(id);
    }
 
 
    function reset(){
    	self.contact={id:null,type:'',name:'',title:'',phone:'',ext:'',fax:'',email:''};
        $scope.myForm.$setPristine(); //reset Form
    }
 
}]);
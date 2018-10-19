'use strict';
 
angular.module('myApp').controller('ItemController', ['$scope', 'ItemService', function($scope, ItemService) {
    var self = this;
    self.item={sku:null,name:'',location:'',department:'',category:'',subCategory:''};
    self.items=[];
    
    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;
 
 
    fetchAllItems();
 
    function fetchAllItems(){
        ItemService.fetchAllItems()
            .then(
            function(d) {
                self.items = d;
                $scope.users=d;
            },
            function(errResponse){
                console.error('Error while fetching Items');
            }
        );
    }
 
    function createItem(item){
        ItemService.createItem(item)
            .then(
            fetchAllItems,
            function(errResponse){
                console.error('Error while creating Item');
            }
        );
    }
 
    function updateItem(item, sku){
        ItemService.updateItem(item, sku)
            .then(
            fetchAllItems,
            function(errResponse){
                console.error('Error while updating Item');
            }
        );
    }
 
    function deleteItem(sku){
        ItemService.deleteItem(sku)
            .then(
            fetchAllItems,
            function(errResponse){
                console.error('Error while deleting Item');
            }
        );
    }
 
    function submit() {
        if(self.item.sku===null){
            console.log('Saving New Item', self.item);
            createItem(self.item);
        }else{
            updateItem(self.item, self.item.sku);
            console.log('Item updated with SKU ', self.item.sku);
        }
        reset();
    }
 
    function edit(sku){
        console.log('SKU to be edited', sku);
        for(var i = 0; i < self.items.length; i++){
            if(self.items[i].sku === sku) {
                self.item = angular.copy(self.items[i]);
                break;
            }
        }
    }
 
    function remove(sku){
        console.log('SKU to be deleted', sku);
        if(self.item.sku === sku) {//clean form if the user to be deleted is shown there.
            reset();
        }
        deleteItem(sku);
    }
 
 
    function reset(){
        self.item={sku:null,name:'',location:'',department:'',category:'',subCategory:''}
        $scope.myForm.$setPristine(); //reset Form
    }
 
}]);
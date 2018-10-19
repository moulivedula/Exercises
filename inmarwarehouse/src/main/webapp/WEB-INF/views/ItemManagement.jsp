<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>AngularJS $http Example</title>  
    <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
 
    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container" ng-controller="ItemController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">User Registration Form </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.item.sku" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uname">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.item.name" id="name" class="username form-control input-sm" placeholder="Enter SKU name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.name.$error.required">This is a required field</span>
                                      <span ng-show="myForm.name.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="address">Location</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.item.location" id="location" class="form-control input-sm" placeholder="Enter Location" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.location.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Department</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.item.department" id="department" class="form-control input-sm" placeholder="Enter Department" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.department.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Category</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.item.category" id="category" class="form-control input-sm" placeholder="Enter Category" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.category.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Sub Category</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.item.subCategory" id="subCategory" class="form-control input-sm" placeholder="Enter Sub Category" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.subCategory.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.item.sku ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Items </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>SKU.</th>
                              <th>Name</th>
                              <th>Location</th>
                              <th>Department</th>
                              <th>Category</th>
                              <th>Sub Category</th>
                              <th width="15%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="item in ctrl.items">
                              <td><span ng-bind="item.sku"></span></td>
                              <td><span ng-bind="item.name"></span></td>
                              <td><span ng-bind="item.location"></span></td>
                              <td><span ng-bind="item.department"></span></td>
                              <td><span ng-bind="item.category"></span></td>
                              <td><span ng-bind="item.subCategory"></span></td>
                              <td>
	                              <button type="button" ng-click="ctrl.edit(item.sku)" class="btn btn-success custom-width">Edit</button>  
	                              <button type="button" ng-click="ctrl.remove(item.sku)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
       
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="http://ui-grid.info/release/ui-grid.js"></script>
	  <link href="<c:url value='/static/css/ui-grid.css' />" rel="stylesheet"></link>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/item_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/item_controller.js' />"></script>
  </body>
</html>
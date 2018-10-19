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
 .myGrid {

width: 1150px;

height: 270px;

}


    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container" ng-controller="ContactController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Contact Registration Form </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.contact.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uname">Type</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.contact.type" id="type" class="username form-control input-sm" placeholder="Enter Type"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.type.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="address">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.contact.name" id="name" class="form-control input-sm" placeholder="Enter Name" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.name.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Title</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.contact.title" id="title" class="form-control input-sm" placeholder="Enter Title" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.title.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" >Phone</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.contact.phone" id="phone" class="form-control input-sm" placeholder="Enter Phone" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.phone.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Extension</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.contact.ext" id="ext" class="form-control input-sm" placeholder="Enter Extension" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.ext.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Fax</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.contact.fax" id="ext" class="form-control input-sm" placeholder="Enter Fax Number" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.fax.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Email</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.contact.email" id="email" class="form-control input-sm" placeholder="Enter EEmail" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.contact.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          
          
          
          	<div class="panel-heading">
          		<span class="lead">External Contacts </span> 
          		<button data-toggle="collapse" data-target="#myDiv" style="height:10px;v-align:center">-</button><a data-toggle="collapse" href="#myDiv">Collapse</a><br>
          		<span class="col-md-7">Select the Client contacts associated with the offer </span><br>
	          	
	          	<div id="myDiv" class="collapse in" ng-controller="ContactController">
	          	
					<div ui-grid="gridOptions" ui-grid-pagination class="myGrid"></div>
	          	</div>
          </div>
      </div>
       
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="http://ui-grid.info/release/ui-grid.js"></script>
	  <link href="<c:url value='/static/css/ui-grid.css' />" rel="stylesheet"></link>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/contact_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/contact_controller.js' />"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </body>
</html>
<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Create User</title>
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
<body>
	
	<div class="generic-container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">Index </span>
			</div>
			<div class="formcontainer">

				<div class="row">
					<div class="form-group col-md-12">
						<div class="col-md-7">
							<a href="<c:url value="/item"/>">Manage Items</a>
						</div>
						<div class="col-md-7">
							<a href="<c:url value="/contact"/>">Manage Contacts</a>
						</div>
						<div class="col-md-7">
							<a href=<c:url value="/graph"/>>Graph</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
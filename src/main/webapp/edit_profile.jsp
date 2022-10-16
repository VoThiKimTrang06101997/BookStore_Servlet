<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Edit Profile</h4>
						
						<c:if test="${not empty successMessage }">
							<h5 class="text-center text-success">${successMessage}</h5>
							<c:remove var="successMessage" scope="session" />
						</c:if>
						
						<c:if test="${not empty FailedMessage }">
							<h5 class="text-center text-danger">${FailedMessage}</h5>
							<c:remove var="FailedMessage" scope="session" />
						</c:if>
						
						<form action="update_profile" method="post">
						<input type="text" value="${ UserObjective.id}" name="id">
							<div class="form-group">
								<label for="exampleInputEmail1">Full Name:</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Full Name"
									required="required" name="name" 
									value="${UserObjective.name}">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address:</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Email"
									required="required" name="email" 
									value="${UserObjective.email }">		
							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Phone Number:</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Phone Number" required="required"
									name="phone_number" value="${UserObjective.phone_number }">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password:</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Password" required="required"
									name="password" value="${UserObjective.password }">
							</div>

							<div class="text-center p-2">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
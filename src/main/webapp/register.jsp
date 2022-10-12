<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookStore: Register</title>
</head>
<%@ include file="all_component/allCss.jsp"%>

<body style="background-color: #f0f1f2">
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-danger">Registration Page</h4>
						
						<c:if test="${not empty SuccessMessage }">
							<p class="text-center text-success">${SuccessMessage  }</p>
							<c:remove var="SuccessMessage" scope="session"/>
						</c:if>
						
						<c:if test="${not empty FailedMessage }">
							<p class="text-center text-danger">${FailedMessage  }</p>
							<c:remove var="FailedMessage" scope="session"/>
						</c:if>
						
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Full Name:</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Full Name"
									required="required" name="name">	
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email address:</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Email"
									required="required" name="email">	
							</div>
							
							
							<div class="form-group">
								<label for="exampleInputPassword1">Phone Number:</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Phone Number"
									required="required" name="phone_number">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password:</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Password" 
									required="required" name="password">
							</div>
							
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1" name="check">Agree terms & Conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<a href="login.jsp"> Test</a>
	</div>
	
	<%@ include file="all_component/footer.jsp" %>
</body>
</html>
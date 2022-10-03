<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookStore: Login</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-danger">Login</h3>

						<c:if test="${not empty FailedMessage }">
							<h5 class="text-center text-danger">${FailedMessage}</h5>
							<c:remove var="FailedMessage" scope="session" />
						</c:if>
						
						<c:if test="${not empty successMessage }">
							<h5 class="text-center text-success">${successMessage}</h5>
							<c:remove var="successMessage" scope="session" />
						</c:if>
						

						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" required="required"
									name="email">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required"
									name="password">
							</div>
						
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br/>
								<a href="register.jsp" class="text-center text-success mt-1">Create
									Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="all_component/footer.jsp" %>
</body>
</html>
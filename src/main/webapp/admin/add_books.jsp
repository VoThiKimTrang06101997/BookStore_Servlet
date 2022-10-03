<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty UserObjective }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-danger">Add Books</h4>
						
							<c:if test="${not empty successMessage }">
								<p class="text-center text-success">${successMessage }</p>
								<c:remove var="successMessage" scope="session"/>
							</c:if>
							
							<c:if test="${not empty failedMessage }">
								<p class="text-center text-danger">${failedMessage }</p>
								<c:remove var="failedMessage" scope="session"/>
							</c:if>
							
							
						<form action="../add_books" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Book Name"
									name="book_name">
								
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Author Name"
									name="author_name">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Price"
									name="price">
							</div>

							<div class="form-group">
								<label for="inputStatus">Book Categories*</label> <select
									class="form-control" id="inputStatus" name="book_categories">
									<option selected>--Select--</option>
									<option value="New">New Book</option>	
									<option value="Old">Old Book</option>	
								</select>
							</div>
							
							<div class="form-group">
								<label for="inputStatus">Book Status</label> <select
									class="form-control" id="inputStatus" name="book_status">
									<option selected>--Select--</option>
									<option value="Active">Active</option>	
									<option value="Inactive">Inactive</option>	
								</select>
							</div>
	
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo*</label><input
									type="file" class="form-control-file" id="exampleFormControlFile1"
									name="book_image"> 
							</div>
							
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 40px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
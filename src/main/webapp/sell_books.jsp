<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary p-1">Sell Old Books</h5>
						
						<c:if test="${not empty successMessage }">
								<p class="text-center text-success">${successMessage }</p>
								<c:remove var="successMessage" scope="session"/>
							</c:if>
							
							<c:if test="${not empty failedMessage }">
								<p class="text-center text-danger">${failedMessage }</p>
								<c:remove var="failedMessage" scope="session"/>
							</c:if>
							
						<form action="add_old_books" method="post"
							enctype="multipart/form-data">
						
							<input type="text" value="${UserObjective.email }" name="user" />
							
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Book Name"
									name="book_name">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Author Name" name="author_name">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Price" name="price">
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo*</label><input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" name="book_image">
							</div>
							
							<div class="text-center p-2">
								<button type="submit" class="btn btn-primary">Sell Book</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
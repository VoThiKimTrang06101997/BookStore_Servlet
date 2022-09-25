<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-danger">Add Books</h4>
						<form action="../AdminAddBookServlet" method="post">
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
									placeholder="Enter Author Name"
									name="price">
							</div>

							<div class="form-group">
								<label for="inputStatus">Book Categories*</label> <select
									class="form-control" id="inputStatus" name="book_categories">
									<option selected>--Select--</option>
									<option value="New">New Book</option>	
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
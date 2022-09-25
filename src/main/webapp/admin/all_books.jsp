<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center text-danger">Hello Admin</h3>
	<div class="container">
		<table class="table table-dark">
			<thead class="bg-primary">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>
						<a href="#" class="btn btn-sm btn-success">Edit</a>
						<a href="#" class="btn btn-sm btn-danger">Delete</a>
					</td>
				</tr>
				
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>
						<a href="#" class="btn btn-sm btn-success">Edit</a>
						<a href="#" class="btn btn-sm btn-danger">Delete</a>
					</td>
				</tr>
				
				<tr>
					<th scope="row">3</th>
					<td>Larry</td>
					<td>the Bird</td>
					<td>@twitter</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>
						<a href="#" class="btn btn-sm btn-success">Edit</a>
						<a href="#" class="btn btn-sm btn-danger">Delete</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div style="margin-top: 40px">
		<%@include file="footer.jsp"%>
	</div>
</body>

</html>
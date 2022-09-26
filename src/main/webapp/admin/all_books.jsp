<%@page import="com.entity.BookAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
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
					<th scope="col">Book ID</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConnection());
				List<BookAdmin> list = bookDAOImpl.getAllBooks();
				for (BookAdmin bookAdmin : list) {
				%>
				<tr>
					<th><%=bookAdmin.getBookId()%></th>
					<td><img src="../book_img/<%=bookAdmin.getPhoto()%>"
						style="width: 60px; height: 60px"></td>
					<td><%=bookAdmin.getBookName()%></td>
					<td><%=bookAdmin.getAuthor()%></td>
					<td><%=bookAdmin.getPrice()%></td>
					<td><%=bookAdmin.getBookCategory()%></td>
					<td><%=bookAdmin.getStatus()%></td>
					<td><a href="#" class="btn btn-sm btn-success">Edit</a> <a
						href="#" class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>

	<div style="margin-top: 40px">
		<%@include file="footer.jsp"%>
	</div>
</body>

</html>
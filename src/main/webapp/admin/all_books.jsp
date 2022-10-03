<%@page import="com.entity.BookAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty UserObjective }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3 class="text-center text-danger">Hello Admin</h3>

	<c:if test="${not empty successMessage }">
		<p class="text-center text-success">${successMessage }</p>
		<c:remove var="successMessage" scope="session" />
	</c:if>

	<c:if test="${not empty failedMessage }">
		<p class="text-center text-danger">${failedMessage }</p>
		<c:remove var="failedMessage" scope="session" />
	</c:if>


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
					<td><a href="edit_books.jsp?id=<%=bookAdmin.getBookId()%>"
						class="btn btn-sm btn-success"><i class="fas fa-edit"></i> Edit</a>
						<a href="../delete?id=<%=bookAdmin.getBookId()%>"
						class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Delete</a></td>
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
<%@page import="com.entity.BookAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${not empty SuccessMessage }">
		<div class="alert alert-success text-center">${SuccessMessage  }
		</div>
		<c:remove var="SuccessMessage" scope="session" />
	</c:if>

	<c:if test="${not empty FailedMessage }">
		<p class="text-center text-danger">${FailedMessage  }</p>
		<c:remove var="FailedMessage" scope="session" />
	</c:if>

	<div class="container p-5">
		<table class="table table-dark">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Book Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			User user = (User) session.getAttribute("UserObjective");
			String email = user.getEmail();
			BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConnection());
			List<BookAdmin> list = bookDAOImpl.getBooksByOld(email, "Old");
			for(BookAdmin bookAdmin: list) {%>
				<tr>
					<th scope="row"><%=bookAdmin.getBookName() %></th>
					<td><%=bookAdmin.getAuthor() %></td>
					<td><%=bookAdmin.getPrice() %></td>
					<td><%=bookAdmin.getBookCategory() %></td>
					<td><a href="delete_old_books?email=<%=email %>&&bookId=<%=bookAdmin.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>
					
				</tr>
				
			<%}
			
			%>
			
								
			</tbody>
		</table>
	</div>



</body>
</html>
<%@page import="com.entity.BookAdmin"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	
	<%
		int bid = Integer.parseInt(request.getParameter("bid")) ;
		BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConnection());
		BookAdmin bookAdmin = bookDAOImpl.getBookById(bid);
	%>
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book_img/<%=bookAdmin.getPhoto() %>" style="height: 200px; width: 150px"> <br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=bookAdmin.getBookName() %></span>
				</h4>
				<h4 class="mt-3">
					Author Name: <span class="text-success"><%=bookAdmin.getAuthor() %></span>
				</h4>
				<h4 class="mt-3">
					Category: <span class="text-success"><%=bookAdmin.getBookCategory() %></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2 class="text-danger"><%=bookAdmin.getBookName() %></h2>

				<%
				if ("Old".equals(bookAdmin.getBookCategory())) {
				%>
				<h5 class="text-success">Contact to Seller</h5>
				<h5 class="text-primary">
					<i class="fas fa-envelope"></i> Email:
					<%=bookAdmin.getUserEmail()%></h5>
				<%
				}
				%>

				<div class="row ">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>

					<div class="col-md-4 text-warning text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Returns Available</p>
					</div>

					<div class="col-md-4 text-success text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>


				<%
				if ("Old".equals(bookAdmin.getBookCategory())) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>
						Continue Shopping </a> <a href="" class="btn btn-danger ml-2">200
						<i class="fas fa-dollar-sign"></i>
					</a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>
						Add Cart </a> <a href="" class="btn btn-danger ml-2">200 <i
						class="fas fa-dollar-sign"></i></a>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>
	
</body>
</html>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Store</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
	.back-img {
		background: url("img/book.jpg");
		height: 80vh;
		width: 100%;
		background-repeat: no-repeat;
		background-size: cover;
	}
	
	.crd-ho:hover {
		background-color: #fcf7f7;
		cursor: pointer;
	}
</style>
</head>

<style>

</style>

<body style="background-color: #f7f7f7">
	<%
	User user = (User) session.getAttribute("UserObjective");
	%>

	<%@include file="all_component/navbar.jsp" %>
	
	<div class="container-fluid back-img">
		<h2 class="text-center text-success">Ebook Management System</h2>
	</div>
	
	<% Connection connection = DBConnect.getConnection(); %>
	
	<!-- out.println(connection); -->
	
	<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center text-danger">Recent Book</h3>

		<div class="row">
			<%
			BookDAOImpl daoImpl = new BookDAOImpl(DBConnect.getConnection());
			List<BookAdmin> list = daoImpl.getRecentBooks();

			for (BookAdmin admin : list) {
			%>
			<div class="col-md-4 mt-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book_img/<%=admin.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p class="text-danger"><%=admin.getBookName()%></p>
						<p class="text-success"><%=admin.getAuthor()%></p>

						<%
						if (admin.getBookCategory().equals("Old")) {
						%>
						<p class="text-primary">
							Categories:
							<%=admin.getBookCategory()%></p>
						<div class="row ml-4">
							<a href="view_books.jsp?bookId=<%=admin.getBookId() %>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=admin.getPrice()%> <i
								class="fas fa-dollar-sign"></i></a>
						</div>
						<%
						} else {
						%>
						<p class="text-primary">
							Categories:
							<%=admin.getBookCategory()%></p>
						<div class="row ml-4">

							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a>
							<%
							} else {
							%>
							<a
								href="cart?bookId=<%=admin.getBookId()%>&&userId=<%=user.getId()%>"
								class="btn btn-danger btn-sm ml-2"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bookId=<%=admin.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> 
								<a href="view_books.jsp?bookId=<%=admin.getBookId()%>"
								class="btn btn-danger btn-sm ml-1"><%=admin.getPrice()%> <i
								class="fas fa-dollar-sign"></i></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

	</div>

	<div class="text-center mt-2">
		<a href="all_recent_books.jsp" class="btn btn-warning btn-sm text-white">View All</a>
	</div>

	</div>
	<!-- End Recent Book -->
	
	<hr/>
	
	<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center text-danger">New Book</h3>
		<div class="row">
			<%
			BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConnection());
			List<BookAdmin> listBooks = bookDAOImpl.getNewBooks();

			for (BookAdmin bookAdmin : listBooks) {
			%>
			<div class="col-md-4 mt-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book_img/<%=bookAdmin.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p class="text-danger"><%=bookAdmin.getBookName()%></p>
						<p class="text-success"><%=bookAdmin.getAuthor()%></p>

						<p class="text-primary">
							Categories:
							<%=bookAdmin.getBookCategory()%></p>
						<div class="row ml-4">

							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a>
							<%
							} else {
							%>
							<a href="cart?bookId=<%=bookAdmin.getBookId()%>&&userId=<%=user.getId() %>" class="btn btn-danger btn-sm ml-2"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bookId=<%=bookAdmin.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=bookAdmin.getPrice()%>
								<i class="fas fa-dollar-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-2">
			<a href="all_new_books.jsp" class="btn btn-warning btn-sm text-white">View All</a>
		</div>

	</div>
	
	<!-- End New Book -->
	
	<hr/>
	
	<!-- Start Old Book -->
		<div class="container">
		<h3 class="text-center text-danger">Old Book</h3>

		<div class="row">
			<%
			BookDAOImpl bookDAOImpl2 = new BookDAOImpl(DBConnect.getConnection());
			List<BookAdmin> listBookAdmins = bookDAOImpl2.getOldBooks();

			for (BookAdmin bookAdmin : listBookAdmins) {
			%>
			<div class="col-md-4 mt-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book_img/<%=bookAdmin.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p class="text-danger"><%=bookAdmin.getBookName()%></p>
						<p class="text-success"><%=bookAdmin.getAuthor()%></p>
						
						
						<%
						if (bookAdmin.getBookCategory().equals("Old")) {
						%>
						<p class="text-primary">
							Categories:
							<%=bookAdmin.getBookCategory()%></p>
						<div class="row ml-4">
							<a href="view_books.jsp?bookId=<%=bookAdmin.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
							<a href="" class="btn btn-danger btn-sm ml-1"><%=bookAdmin.getPrice()%>
								<i class="fas fa-dollar-sign"></i></a>
						</div>
						<%
						} else {
						%>
						<p class="text-primary">
							Categories:
							<%=bookAdmin.getBookCategory()%></p>
						<div class="row ml-4">

							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a>
							<%
							} else {
							%>
							<a
								href="cart?bookId=<%=bookAdmin.getBookId()%>&&userId=<%=user.getId()%>"
								class="btn btn-danger btn-sm ml-2"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bookId=<%=bookAdmin.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> 
							<a href=""
								class="btn btn-danger btn-sm ml-1"><%=bookAdmin.getPrice()%>
								<i class="fas fa-dollar-sign"></i></a>
						</div>
						<%
						}
						%>
							
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>


		<div class="text-center mt-2">
			<a href="all_old_books.jsp" class="btn btn-warning btn-sm text-white">View All</a>
		</div>
		
	</div>
	<!-- End Old Book -->
	
	<!-- Footer -->
	<%@include file="all_component/footer.jsp" %>
</body>
</html>
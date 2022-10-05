<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<h3 class="text-center text-danger mt-2">New Book</h3>
		<div class="row p-3">
			<%
			BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConnection());
			List<BookAdmin> listBooks = bookDAOImpl.getNewBooks();

			for (BookAdmin bookAdmin : listBooks) {
			%>
			<div class="col-md-3 mt-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book_img/<%=bookAdmin.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p class="text-danger"><%=bookAdmin.getBookName()%></p>
						<p class="text-success"><%=bookAdmin.getAuthor()%></p>

						<p class="text-primary">
							Categories:
							<%=bookAdmin.getBookCategory()%></p>
						<div class="row ml-5">
							<a href="" class="btn btn-danger btn-sm ml-2"> <i
								class="fas fa-cart-plus"></i> Add Cart
							</a> <a href="" class="btn btn-success btn-sm ml-1">View Details</a>
							<a href="" class="btn btn-danger btn-sm ml-1"><%=bookAdmin.getPrice()%>
								<i class="fas fa-dollar-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

	</div>



</body>
</html>
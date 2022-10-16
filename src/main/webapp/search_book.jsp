<%@page import="com.entity.User"%>
<%@page import="com.entity.BookAdmin"%>
<%@page import="java.util.List"%>
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
<title>Search Books</title>
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
<body>
	<%
	User user = (User) session.getAttribute("UserObjective");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<h3 class="text-center text-danger mt-2">Recent Book</h3>

		<div class="row p-3">
			<%
			String ch = request.getParameter("ch");
			BookDAOImpl daoImpl = new BookDAOImpl(DBConnect.getConnection());
			List<BookAdmin> list = daoImpl.getBookBySearch(ch);

			for (BookAdmin admin : list) {
			%>
			<div class="col-md-3 mt-3">
				<div class="card crd-ho mt-2">
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
						<div class="row ml-5">
							<a href="" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=admin.getPrice()%>
								<i class="fas fa-dollar-sign"></i></a>
						</div>
						<%
						} else {
						%>
						<p class="text-primary">
							Categories:
							<%=admin.getBookCategory()%></p>
						<div class="row ml-5">

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
							
							<a href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=admin.getPrice()%>
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
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
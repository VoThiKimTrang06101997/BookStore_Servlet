<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookAdmin"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Books</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>

<body>
	<%
	User user = (User) session.getAttribute("UserObjective");
	%>

	<c:if test="${not empty addCart }">
		<div id="toast">${addCart }</div>

		<script type="text/javascript">
			showToast();
			function showToast(content) {
				$('#toast').addClass("display");
				$('#toast').html(content);
				setTimeout(() => {
					$('#toast').removeClass("display");
				}, 2000);
			}
		</script>

		<c:remove var="addCart" scope="session" />
	</c:if>

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

	</div>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>
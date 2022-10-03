<%@page import="com.entity.BookAdmin"%>
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
<title>Admin: Edit Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty UserObjective }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-danger">Edit Books</h4>
							
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConnection());
							BookAdmin bookAdmin = bookDAOImpl.getBookById(id);
						%>
							
								
						<form action="../edit_books" method="post" action="fileuploadservlet"
						enctype="multipart/form-data">
							<div class="form-group">
							<label for="exampleInputEmail1">Book ID*: </label>
								<br/>
								<input type="text" name="id" value="<%=bookAdmin.getBookId()%>" >
							</div>
							
							
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Book Name"
									name="book_name"
									value="<%= bookAdmin.getBookName() %>">
								
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Author Name"
									name="author_name"
									value="<%= bookAdmin.getAuthor() %>">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Price"
									name="price" value="<%= bookAdmin.getPrice() %>">
							</div>
							
							<div class="form-group">
								<label for="inputStatus">Book Status</label> <select
									class="form-control" id="inputStatus" name="book_status">

									<%
									if ("Active".equals(bookAdmin.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo*</label><input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" name="book_image">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
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
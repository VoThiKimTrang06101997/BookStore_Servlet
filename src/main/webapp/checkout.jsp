<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_component/navbar.jsp"%>

	<c:if test="${empty UserObjective }">
		<c:redirect url="login.jsp"></c:redirect>	
	</c:if>


	<c:if test="${ not empty successMessage}">
		<div class="alert alert-success text-center" role="alert">${successMessage}</div>
		<c:remove var="successMessage" scope="session"/>  
	</c:if>
	
	
	<c:if test="${ not empty failedMessage}">
		<div class="alert alert-danger text-danger text-center" role="alert">${failedMessage }</div>
		<c:remove var="failedMessage" scope="session"/>  
	</c:if>
	
	
	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-dark">
							<thead>
								<tr class="text-warning">
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User user = (User) session.getAttribute("UserObjective");
								CartDAOImpl cartDAOImpl = new CartDAOImpl(DBConnect.getConnection());
								List<Cart> cart = cartDAOImpl.getBookByUser(user.getId());
								Double totalPrice = 0.00;

								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_books?bookId=<%=c.getBookId()%>&&userId=<%=c.getUserId()%>&&cartId=<%=c.getCartId()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								
								
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice %></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center text-success">Your Details For Orders</h3>
						<form action="order" method="post">
							<input type="text" value="${UserObjective.id }" name="id" >
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="Name"
										name="name" value="${UserObjective.name }" required="required" >
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input
										type="email" class="form-control" id="inputPassword4"
										name="email" placeholder="Email" value="${UserObjective.email }" 
										required="required">
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input type="number"
										class="form-control" id="inputEmail4" placeholder="Phone Number"
										name="phone_number" value="${UserObjective.phone_number }"
										required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input
										type="text" class="form-control" id="inputPassword4"
										name="address" placeholder="Address"
										required="required">
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="Landmark" 
										name="landmark"
										required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input
										type="text" class="form-control" id="inputPassword4"
										placeholder="City" name="city"
										required="required">
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="State" name="state"
										required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin Code</label> <input
										type="text" class="form-control" id="inputPassword4"
										placeholder="Pin Code" name="pin_code"
										required="required">
								</div>

								<div class="form-group">
									<label>Payment Mode</label> <select class="form-control" name="payment_type">
										<option value="no_select">--Select--</option>
										<option value="COD">Cash On Delivery</option>
									</select>
								</div>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="all_component/footer.jsp" %>
</body>
</html>
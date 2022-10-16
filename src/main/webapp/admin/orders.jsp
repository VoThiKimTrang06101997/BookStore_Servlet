<%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty UserObjective }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<h3 class="text-center text-danger">Hello Admin</h3>
	<div class="container">
		<table class="table table-dark">
			<thead class="bg-primary">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone Number</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Method</th>
				</tr>
			</thead>
			
			<tbody>
				<%
				OrderDAOImpl orderDAOImpl = new OrderDAOImpl(DBConnect.getConnection());
				List<Order> listOrders = orderDAOImpl.getAllOrder();
				for (Order order : listOrders) {
				%>
				<tr>
					<th scope="row"><%=order.getOrderId()%></th>
					<td><%=order.getUserName()%></td>
					<td><%=order.getEmail()%></td>
					<td><%=order.getFullAddress()%></td>
					<td><%=order.getPhone()%></td>
					<td><%=order.getBookName()%></td>
					<td><%=order.getAuthor()%></td>
					<td><%=order.getPrice()%></td>
					<td><%=order.getPaymentType()%></td>
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
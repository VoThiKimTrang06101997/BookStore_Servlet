<%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Books</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_component/navbar.jsp"%>
	
	<c:if test="${empty UserObjective }">
		<c:redirect url="login.jsp"></c:redirect>	
	</c:if>

	<div class="container p-1">
	<h3 class="text-center text-danger">Your Order</h3>
		<table class="table table-dark mt-5">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			
			<tbody>

				<%
				User user = (User) session.getAttribute("UserObjective");
				OrderDAOImpl orderDAOImpl = new OrderDAOImpl(DBConnect.getConnection());
				List<Order> listBooks = orderDAOImpl.getBook(user.getEmail());

				for (Order order : listBooks) 
				{%>
					<tr>
					<th scope="row"><%=order.getOrderId() %></th>
					<td><%=order.getUserName() %></td>
					<td><%=order.getBookName() %></td>
					<td><%=order.getAuthor()%></td>
					<td><%=order.getPrice() %></td>
					<td><%=order.getPaymentType() %></td>
				</tr>
				<%}
				%>

			</tbody>
		</table>
	</div>
</body>
</html>
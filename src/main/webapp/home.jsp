<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User:Home</title>
</head>
<body>
	<h1>User: Home</h1>
	
	<c:if test="${not empty UserObjective }">
		<h1>Name: ${ UserObjective.name}</h1>
		<h1>Email: ${ UserObjective.email}</h1>
		<c:remove var="FailedMessage" scope="session" />
	</c:if>
	
	
	
</body>
</html>
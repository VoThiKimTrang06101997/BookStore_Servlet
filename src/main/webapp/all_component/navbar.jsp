<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<div class="container-fluid" style="height: 10px; background-color: #ff80ab">

</div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-danger">
			<h3><i class="fas fa-book"></i> Book Store</h3>
		</div>

		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty UserObjective}">
			<div class="col-md-3">
				<a href="checkout.jsp"> <i class="fas fa-cart-plus fa-2x"></i> Cart</a> 
				
				<a href="login.jsp" class="btn btn-success"> <i
					class="fas fa-user-plus"></i> ${UserObjective.name }</a> 
					
				<a href="logout" class="btn btn-primary"><i
					class="fas fa-sign-in-alt"></i> Logout </a>
			</div>
		</c:if>

		<c:if test="${empty UserObjective}">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"> <i
					class="fas fa-user-plus"></i> Login
				</a> <a href="register.jsp" class="btn btn-primary"><i
					class="fas fa-sign-in-alt"></i> Register </a>
			</div>
		</c:if>

	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">
					Home <span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item active"><a class="nav-link" href="all_recent_books.jsp"> <i
					class="fas fa-book-open"></i> Recent Book
			</a></li>

			<li class="nav-item active"><a class="nav-link" href="all_new_books.jsp"> <i
					class="fas fa-book-open"></i> New Book
			</a></li>

			<li class="nav-item active"><a class="nav-link" href="all_old_books.jsp"> <i
					class="fas fa-book-open"></i> Old Book
			</a></li>

		</ul>


		<form class="form-inline my-2 my-lg-0">
			<a href="settings.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i
					class="fas fa-cog"></i> Setting</a>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i
					class="fas fa-phone-square-alt"></i> Contact Us</button>
		</form>
		
	</div>
</nav>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<html lang="en">
<head>
<title>CosmoHub</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: red;
	color: white;
	text-align: left;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-static-top" role="navigation">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<!-- Brand -->
				<!--  <li><a class="navbar-brand" href="#">Cosmo Hub</a></li>-->
				<li><a href="home
                "><span
						class="glyphicon glyphicon-home">Home</span></a></li>

				<security:authorize access="isAnonymous()">

					<li><a href="registration"> <span
							class="glyphicon glyphicon-registration-mark">Registration</span></a></li>
					<li><a href="goTologin"><span
							class="glyphicon glyphicon-user"></span>Login</a></li>
				</security:authorize>

				<security:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="aadmin"><span
							class="glyphicon glyphicon-user"></span> Admin Adding</a></li>

					<li><a href="aadmin/getallpro"><span
							class="glyphicon glyphicon-user"></span>ProductDisplay</a></li>

				</security:authorize>


				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Category<span class="caret"></span></a>
					<ul class="dropdown-menu">

						<li><a href=" ">ALL</a></li>
						<c:forEach var="cat" items="${catlist}">
							<li><a
								href="${pageContext.request.contextPath}/productdetails?cid=${cat.cid}">${cat.cname}
							</a></<c:out value="${cat.cname}"></c:out></a></li>
						</c:forEach>

					</ul></li>
				<li><c:if
						test="${pageContext.request.userPrincipal.name != null}">
						<a href="goToCart">My Cart</a>


					</c:if></li>


				<div class="nav navbar-nav navbar right">

					<!--<c:if test="${pageContext.request.userPrincipal.name==null} ">
               <li><a href="${pageContext.request.contextPath}/registration">Register</a></li>
               <li><a href="${pageContext.request.contextPath}/goTologin">login</a></li>
               </c:if>
               <c:if test="${pageContext.request.userPrincipal.name!=null}">
               <li><a >Welcome: ${pageContext.request.userPrincipal.name}</a></li>
               <li>
               <a href="<c:url value="/logout"/>">logout</a></li>
               <li>
               <a href="${ pageContext.request.contextPath}/goToCart">My cart</a></li>
               </c:if>
               </ul>
               </div>-->
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<c:out
							value="${SecurityContextHolder.getContext().getAuthentication().getAuthorities().toString()}"></c:out>
						<h6 style="color: white;" align="right">
							Welcome : ${pageContext.request.userPrincipal.name} <a
								href="<c:url value="/logout" />">Logout</a>

						</h6>
					</c:if>


				</div>
	</nav>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Login page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  </head>
<body style="background-color: #FFE4C4;">
<jsp:include page="header.jsp"/>

 <div class="container">
 
 <div class="col-xs-12">
			<c:if test="${not empty msg}">
			<h4 class="alert alert-success">${msg}</h4>
			</c:if>
		</div>
		
  <h2>Welcome To Login Page!!!</h2>
  <c:url var="login" value="/login" />
  <form action="${login}" method="Post">
  <c:if test="$(not empty error)">
  <div class "error" style="color:#ff0000:">${error}</div>
  </c:if>
  <c:if test="$(not empty logout)">
  <div class "error" style="color:#ff0000:">${logout}</div>
  </c:if>
  
 <div class="form-group">
    <label><b>Email:</b></label><br>
    <input type="text" placeholder="Enter email-id" name="email" required></div>
<div class="form-group">
    <label><b>Password:</b></label><br>
    <input type="password" placeholder="Enter Password" name="pass" required></div>
<div class="form-group">
   <button type="Submit" name ="Submit" value="Login" class="btn btn-primary btn-md">Login</button>    
    <button type="Reset" name ="Reset" value="Reset" class="btn btn-primary btn-md">Reset</button>    
    </div>
    <div class="form-group">
      <input type="checkbox" checked="checked"> Remember me
      
    </div>
    </form>
  </div>


    </body>
    <jsp:include page="footer.jsp"/>
    
    </html>
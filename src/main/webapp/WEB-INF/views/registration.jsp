<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <title>Registration  Form</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  </head>
<body style="background-color: pink">
<jsp:include page="header.jsp"/>

<div class="container">
  <h2>Registration Form</h2>
  <form class="form-signin" action="<c:url value="/saveUser"/>" method="POST">
    <div class="form-group">
      <label for="Name">First Name:</label>
      <input type="text" class="form-control" id="fname" placeholder="Enter Name" name="fname">
    </div>
    <div class="form-group">
      <label for="last_name">Last Name:</label>
      <input type="text" class="form-control" id="lname" placeholder="Enter last Name" name="lname">
    </div>
    <div class="form-group">
      <label for="Contact No">DOB:</label>
      <input type="date" class="form-control" id="dob" placeholder="Enter date of birth" name="dob">
    </div>
    <div class="form-group">
      <label for="Contact No">Contact No:</label>
      <input type="text" class="form-control" id="contact" placeholder="Enter phone no." name="contact">
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <textarea class="form-control" rows="3" id="addr" name="addr"> </textarea>
    </div>
     <div class="form-group">
      <label for="Email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email">
    </div>
    
    <div class="form-group">
      <label for="psw">Password:</label>
      <input type="password" class="form-control" id="pass" placeholder="Enter password." name="pass"/>
    </div>
  
    <div class="form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" /> Remember me
      </label>
    </div>
    <div class="form-group">
    <input type="submit" class="btn btn-primary" value="Submit">
        </div>
    
 </form>
</div>
<br><br>
	<jsp:include page="footer.jsp" />
</body>

</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <title>Registration  Form</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

  </head>
<body style="background-color: #FFE4C4;">
<jsp:include page="header.jsp"/>

<div class="container">
  <h2>Registration Form</h2>
  
  <form class="form-horizontal" action="<c:url value="/Reguser"/>" method="POST">
  <fieldset>
    <div class="form-group">
  <label class="col-md-4 control-label" for="firstname">First Name</label>  
  <div class="col-md-4">
  <input id="fname" name="fname" type="text" placeholder="Enter your name" class="form-control input-md" required="">
  </div>
  </div>
    <div class="form-group">
  <label class="col-md-4 control-label" for="lastname">Last Name</label>  
  <div class="col-md-4">
  <input id="fname" name="lname" type="text" placeholder="Enter your last name" class="form-control input-md" required="">
  </div>
  </div>
   <div class="form-group">
  <label class="col-md-4 control-label" for="name">DOB</label>  
  <div class="col-md-4">
  <input id="dob" name="dob" type="date" placeholder="Enter your DOB" class="form-control input-md" required="">
  </div>
  </div>
    <div class="form-group">
  <label class="col-md-4 control-label" for="contact">Contact no.</label>  
  <div class="col-md-4">
  <input id="contact" name="contact" type="text" placeholder="Enter your contact no." class="form-control input-md" required=""> 
  </div>
</div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="contact">Address</label>  
      <div class="col-md-4">
      <textarea class="form-control" rows="3" id="addr" name="addr"  placeholder="Enter your address." class="form-control input-md" required=" "> </textarea>
    </div>
    </div>
    <div class="form-group">
  <label class="col-md-4 control-label" for="email">Email</label>  
  <div class="col-md-4">
  <input id="email" name="email" type="text" placeholder="Enter your email id" class="form-control input-md" required="">
  </div>
</div>
    
   <div class="form-group">
  <label class="col-md-4 control-label" for="password">Password</label>
  <div class="col-md-4">
    <input id="pass" name="pass" type="password" placeholder="Enter a password" class="form-control input-md" required="">
  </div>
</div>
  
    <div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-4">
    <button id="signup" name="submit" class="btn btn-success">Submit</button>
  </div>
</div>
    </fieldset>
 </form>
  <div>${loggStatus}</div>
</div>
<br><br>
	<jsp:include page="footer.jsp" />
</body>

</html>

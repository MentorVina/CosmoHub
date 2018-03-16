<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
h2{
padding-bottom: 10px;
}
</style>
</head>
<body style="background-color: #FFE4C4;">
<jsp:include page="header.jsp"/>
<div class="container">
<h2>Contact Us Form</h2>
  <form action="">
    <div class="form-group">
    <label>Username</label>
    <input type="text" placeholder="Enter Username" name="uname" required></div>

   <div class="form-group">
     <label>Last Name:</label>
    <input type="text" placeholder="Enter last name" name="last" required></div>
    </div>
      <div class="form-group">
    <label for="country">Country</label>
    <select id="country" name="country">
    <option value="australia">India</option>
      <option value="australia">Australia</option>
      <option value="canada">Canada</option>
      <option value="usa">USA</option>
    </select>
    </div>
    <div class="form-group">
    <label for="subject">Subject:</label>
    <textarea id="subject" name="subject" placeholder="Write something.." style="height:100px ;width:300px"></textarea></div>

    <input type="submit" value="Submit">
  </form>
</div>
</body>
<jsp:include page="footer.jsp"/>
</html>
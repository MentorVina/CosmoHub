<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product View</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: pink">
<%@ include file="header.jsp" %>
<h3><b>Details about the Product</b></h3>
<br><br>
<center><table>
<tr>

<td><img src="${contextRoot}/resources/images/${Product.imagname}" width = "200" height= "200" alt ="${Product.imagname}"/></td></tr>
<tr >
<td style="padding-top: 20px"><b>Product Name:</b></td><td style="padding-top: 20px">${Product.pname}</td>
</tr>
<tr>
<td><b>Description:</b></td><td>${Product.description}</td>
</tr>
<tr>
<td><b>Price:</b></td><td>${Product.price}</td>
</tr>
<tr>
<td><b>Stock:</b></td><td>${Product.stock}</td>
</tr>
</table>
<c:url value="/aadmin/getallpro" var="url1"></c:url>
<a href="${url1 }">Back to Product list</a><br>
<%@ include file="footer.jsp" %>
</center>
</body>
</html>




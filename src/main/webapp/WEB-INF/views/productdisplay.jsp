<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@page language="java" isELIgnored="false"%>
<%@page isELIgnored="false"  language="java"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Display</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
  
</head>
 <body style="background-color: pink"> 
 <jsp:include page="header.jsp" />
 <div class="container"> 
 <form action="addToCart" method="get"> 
 <table class="table"> 
     <tr> 
     <th>Product ID</th> 
     <td >${item.pid}</td> 
     </tr> 
     <tr> 
     <th>Product Image</th> 
     <td ><img src="${contextRoot}/resources/images/${item.imagname}" width = "100" height= "100" alt ="${item.imagname}"/></td> 
     </tr> 
       <tr> 
         <th>Product name</th> 
         <td >${item.pname}</td> 
        </tr>     
     
       <tr> 
         <th>Supplier ID</th> 
         <td >${sup.sname}</td> 
         
       </tr> 
       <tr> 
        <th>Price</th> 
        <td >${item.price}</td> 
       </tr> 
       <tr> 
      <th>Description</th> 
      <td><c>${item.description}</c></td> 
       </tr> 
      
       <tr> 
         <th>Stock</th> 
         <td>${item.stock}</td> 
        </tr> 
       
    
   </table> 
 <button type="submit" action="">Add to cart</button> 
 </form> 
 </div> 
 <jsp:include page="footer.jsp" />
 </body> 
 </html> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@page language="java" isELIgnored="false"%>
<%@page isELIgnored="false"  language="java"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your cart</title>
</head>
<body>
 <jsp:include page="header.jsp" />
<div class="container">            
  <table class="table">
    <thead>
      <tr>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Image</th>
        <th>Total</th>
        <th>Action</th>        
      </tr>
    </thead>
    <tbody>
      
     <c:forEach items="${carts}" var="cat">
     <tr>
        
        <td>${cat.cartProductName}</td>  
        <td>${cat.cartQuantity}</td>   
         <td>${cat.cartPrice}</td>    
           <td>${cat.cartImages}</td>   
             <td>${cat.cartPrice}*${cat.cartQuantity}</td>      
        <td><a href="deletePCart?pid=${cat.cartProductID}">Delete</a></td>
          </tr>
           </c:forEach> 
    </tbody>
  </table>  
  <a href="${pageContext.request.contextPath}/" class="btn btn-info" role="button">Continue Shopping</a>
 <a href="${pageContext.request.contextPath}/checkOut" class="btn btn-info" role="button">Check Out</a>

</div>
 <jsp:include page="footer.jsp" />
</body>
</html>
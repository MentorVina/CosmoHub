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
<body style="background-color: #FFE4C4;">
 <jsp:include page="header.jsp" />
<div class="container">  
	<div class="jumbotron"> 
<%-- 	 <c:if test="${not empty msg}">
Message:- ${msg}
</c:if>  --%>
<% String msg=request.getParameter("msg");
if(msg!=null){
out.println("<b> "+msg+"</b>");
}
%>        
  <table class="table">
    <thead>
    <tr>
   <td> <img src="${contextRoot}/resources/images/shoppingcart.png" width = "200" height= "200" alt ="cartimg"/style="float:left;"><br><br><br><br><p style="font-size: 20px;"><b>YOUR CART</b></p></td>
 
   </tr>
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
      <c:set var="tot" value="${0 }"/>
     <c:forEach items="${carts}" var="cat">
     <c:set var="tot" value="${tot+ cat.cartPrice * cat.cartQuantity}"/>
     <tr>
     
        <td>${cat.cartProductName}</td>  
        <td>${cat.cartQuantity}</td>   
         <td>${cat.cartPrice}</td>    
           <td><img src="${contextRoot}/resources/images/${cat.cartImages}" width = "40" height= "40" alt ="${p.imagname}"/></td>
             <td>${cat.cartPrice * cat.cartQuantity} </td>
        <td><a href="${pageContext.request.contextPath}/removecartitem?cartId=${cat.cartId}" class="btn btn-danger" ><span class="glyphicon glyphicon-trash" ></span></a></td>
         
          </tr>
    
           </c:forEach> 
          <tr><td><b>GRAND TOTAL : </b><c:out value="${tot}"/></td></tr>
       <input type= "hidden" id="tot" value="${tot}" name="tot"/>
    </tbody>
  </table>  
  <a href="${pageContext.request.contextPath}/" class="btn btn-warning" role="button">< Continue Shopping</a>
 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="${pageContext.request.contextPath}/checkout?tot=${tot}" class="btn btn-success" role="button">Checkout ></a>
</div>
</div>
 <jsp:include page="footer.jsp" />
</body>
</html>
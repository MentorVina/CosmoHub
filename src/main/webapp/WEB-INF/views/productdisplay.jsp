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
 <body style="background-color: #FFE4C4;"> 
 <jsp:include page="header.jsp" />

 <c:if test="${not empty msg}">
Message:- ${msg}
</c:if> 
 <div class="container"> 
 <form action="addToCart" method="POST"> 
 <table style="padding-top:20px"> 
   
     <tr>  
     <td ><img src="${contextRoot}/resources/images/${item.imagname}" width = "150" height= "150" alt ="${item.imagname}"/> <p><h4>Product Details</h4></td><br>
      
     <td> <div   style= "float:right ;font-size:12pt; font-weight:bold; "  class="col-xs-12 col-md-8" >
           
                
                     <c:out value="${item.pname }"></c:out><br>
                      <c:out value="${cat.cname }"></c:out><br>
                    Price - <c:out value="${item.price } Rs."></c:out><br>
                    Supplier - <c:out value="${sup.sname }"></c:out><br>
                    
                   <input type="text" id="qty" name ="qty" placeholder="Enter quantity here" width="38" height="38"/><br><br>
                  
                 <button type="submit" class="btn btn-primary  btn-md" name="add_cart">Add to cart</button>
                 

  </div>
  </td>

     </tr> 
     <tr>
     <td> ${item.description}</td><br></tr>
     	</table>
     	<input type= "hidden" id="pid" value="${item.pid}" name="pid"/>
<input type= "hidden" id="imagname" value="${item.imagname}" name="imagname"/>	
	</form>
	</div>			
     
     
   
  


  
    
 <jsp:include page="footer.jsp" />

 </body> 
 </html> 

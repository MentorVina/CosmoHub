 <%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/1.2.3/jquery.payment.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Invoice</title>
</head>
<body style="background-color: #FFE4C4;">
<jsp:include page="header.jsp"></jsp:include>
<div class="container">

 
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
         <form action="Thanks_page" method="get">
            <div class="row">
                <div class="col-xs-6  ">
           
                     <img src="resources/images/cosmo_logo.png"  alt ="cosmohub_logo"/>
                      <strong><abbr title="Phone">Contact us:</abbr> (0172) 484-6829</strong>
                      <strong>Warehouse Address: No.42/1</strong>
                     <strong> Bangalore,Karnataka,India-560067</strong>
                        	
                
                </div>
                
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p style="color: green;">
                       <%
         Date date = new Date();
         out.print(date.toString());
      %>
                    </p>
                    <p>
                        <b>Invoice No:#12356478</b><br>
                        
                    </p>
                </div>
            </div>
            <div class="row">
             	<table class="table table-hover"><tr><td>
                              <strong>Billing To:</strong><br> ${userdetails.addr}</td>
                             
                     
                         	
                                  <td><p style="padding-left: 250px"><strong>Shipping To:</strong><br> ${userdetails.addr}</p><br></td>
                                  </tr>
                                  </table>
                                  </div>
                   <div class="row">
                <table class="table table-hover">
                  
                 <thead>
                 <tr><td></td><td><p><h2>Invoice</h2></p></td></tr>
                        <tr>
                            <th> Name : <c:out value="${userdetails.fname} ${userdetails.lname}"></c:out></th>
                             
                              <th class="text-right">Email : <c:out value="${userdetails.email}"></c:out></th>
                              <th> </th> 
                               </tr>
                              </thead>
                              
                       <thead>
                       <tr>
                         <th>Items</th>
                             <th >Qty</th>
                            <th >Price</th>
                            <th>  </th>
                       </tr>
                       </thead>
                         <c:forEach items="${carts}" var="cat">
    
                         <tr>
    
                           <td>${cat.cartProductName}</td>  
                            <td >${cat.cartQuantity}</td>   
                             <td >${cat.cartPrice}</td>    
           <td>   </td>
         
                             </tr>
    
                    </c:forEach>      
                   
                        <tr>
                           
                            <td></td>
                          
                        
                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
                            <td class="  text-danger"><h4><strong>${total}</strong></h4></td>
                           <td> </td>
                        </tr>
                
                </table>
                </div>
                <button type="submit" class="btn btn-success btn-lg btn-block">
                OK <span class="glyphicon glyphicon-chevron-right"></span>
                </button>
                </form>
            </div>
        </div>
 
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
  
</head>
<body style="background-color: #FFE4C4;">
	<jsp:include page="header.jsp" />
<h3><b>List of Product</b></h3>
<div class ="container">
<table class="table table-bordered" >
<thead>
<tr><th>Product Id</th><th>Imagce</th><th>Product Name</th><th>Supplier</th><th>Category</th><th>Price</th><th>Description</th><th>Stock</th><th>Action</th></tr>
</thead>
<tbody>
<c:forEach items="${prodList}" var="p">
<c:url value="/aadmin/viewproduct/${p.pid}" var="viewUrl"></c:url>
<c:url value="/aadmin/geteditform/${p.pid}" var="editUrl"></c:url>
<c:url value="/aadmin/deleteproduct/${p.pid}" var="deleteUrl"></c:url>

<tr><td>${p.pid}</td>
<td><img src="${contextRoot}/resources/images/${p.imagname}" width = "40" height= "40" alt ="${p.imagname}"/></td>
<td>${p.pname}</td><td>${p.supplier.sid}</td><td>${p.category.cid}</td><td>${p.price}</td><td>${p.description}</td><td>${p.stock}</td>
<td><a href="${viewUrl}"> <span class="glyphicon glyphicon-info-sign"></span></a>
 <a href="${deleteUrl} "> <span class="glyphicon glyphicon-trash"></span></a>
 <a href=" ${editUrl}"> <span class="glyphicon glyphicon-pencil"></span></a>
</td></tr>
</c:forEach>
</tbody>
</table>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
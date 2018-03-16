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
  <title>Edit Form</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  </head>
<body style="background-color: #FFE4C4;">
<jsp:include page="header.jsp"/>

               <div class="container">
			<div class="container">
					<h2>Product Edit Form</h2>
				<sf:form action="${contextRoot}/aadmin/saveProd" modelAttribute="product" method="POST" enctype="multipart/form-data" >
					
					<div class="col-xs-4" class="form-group">
						<sf:label for="pid" path="pid">Product ID</sf:label> 
						<sf:input type="text" path= "pid" class="form-control" id="pid" value="${item.pid}"
							name="pid"></sf:input>
					</div>
					<br><br><br>
					<div class="col-xs-4" class="form-group">
						<sf:label for="pName" path="pname">Product Name</sf:label> 
						<sf:input type="text" path= "pname" class="form-control" id="pName" value="${item.pname}"
							name="pName"></sf:input>
					</div>
					<br><br><br>
					<div class="col-xs-4"  class="form-group">
						<sf:label for="pDesc" path="description">Product Description</sf:label>
						<sf:input type="text"  path="description"  class="form-control" id="pDesc" rows="3" value="${item.description}" name="desc"></sf:input>
					</div>
					<br><br><br>
					<div class="col-xs-4" class="form-group">
						<sf:label for="pPrice" path="price">Price</sf:label> 
						<sf:input type="text" path="price"
							class="form-control" id="pPrice"
							value=" ${item.price }" name="pPrice"/>
					</div><br><br><br>

					<div  class="col-xs-4" class="form-group">
						<sf:label for="pStock" path="stock">Stock</sf:label> 
						<sf:input type="text" path="stock" class="form-control" id="pStock" value="${item.stock }"
							name="pStock"/>
					</div><br><br><br>

					
					<div class="col-xs-4" class="form-group">
						<label for="sid">Supplier ID</label> 
						<sf:select class="form-control" path="supplier"
							name="supplier"
							items="${suplist}"
							itemLabel="sname"
							itemValue="sid"
						/>
					</div><br><br><br>
					
					<div class="col-xs-4" class="form-group">
						<label for="cid">Category ID</label> 
						<sf:select class="form-control" path="category"
							name="category"
							items="${clist}"
							itemLabel="cname"
							itemValue="cid"
						/>
					</div><br><br><br>


					<div class="col-xs-4" class="form-group">
						<sf:label for="file" path="pimage">Select Product Image</sf:label> 
						<sf:input type="file" class="form-control-file" id="pimage" path="pimage" name="pimage"></sf:input>
					</div><br>
					<input class="btn btn-primary" type="submit" value="Submit">
                     <input class="btn btn-primary" type="reset" value="Reset">
					
				
				<sf:hidden path="pid"/>
				<sf:hidden path="pname"/>
				<sf:hidden path="description"/>
				<sf:hidden path="price"/>
				<sf:hidden path="stock"/>
				</sf:form>
			</div>  
		</div>

</body>
<br><br><br><br>
<jsp:include page="footer.jsp" />
</html>
    
    

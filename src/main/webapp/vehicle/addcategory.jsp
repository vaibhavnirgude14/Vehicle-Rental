<%@page import="classfile.Mylib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VehicleRentalWebApp</title>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='menu.jsp' %>
<%

if(request.getParameter("btnsave")!=null){
	String cname=request.getParameter("txtname");
	Mylib l1=new Mylib();
	l1.dml("insert into tblcategory(cname)Values('"+cname+"')");
	%>
	<script>
	alert("Record Added Successfully");
	window.location.href="viewcategory.jsp";
	</script>
	<%
}

%>
<div class="row">
<div class="col-md-6">
<form method="post">
<table class="table">
<tr>
<Td>
Add Category
</Td>
<tD>
<input type="text" name="txtname" class="form-control">
</tD>
</tr>
<tr>
<td>
<input type="submit" name="btnsave" class="btn btn-success" value="Add Category">
</td>
</tr>
</table>
</form>
</div>
</div>
</body>
</html>
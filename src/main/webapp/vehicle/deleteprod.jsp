<%@page import="classfile.Mylib"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VehicleRentalWebApp</title>
</head>
<body>
<%@include file='head.jsp' %>
<%
Mylib l1=new Mylib();
l1.dml("delete from tblvehicle where veid="+request.getParameter("id"));


%>
<script>
window.location.href="viewvehicle.jsp";
</script>
</body>
</html>
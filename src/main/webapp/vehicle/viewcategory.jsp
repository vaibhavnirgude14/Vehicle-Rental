<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>  VehicleRentalWebApp</title>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='menu.jsp' %>
<%

Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from tblcategory");
%>
 <div class="container-fluid py-3">
        <div class="container pt-3">
<a href="addcategory.jsp"><input type="button" value="Add Category" class="btn btn-warning"></a>
<table class="table">
<Tr>
<td>
Category Name
</td>
</Tr>
<%
while(rs.next()){
%>

<tr>
<Td>
 <%
 out.println(rs.getString("cname"));
 %>
</Td>
<Td>
<a href="deletecat.jsp?id=<%out.println(rs.getString("cid"));%>"><input type="button" value="Delete" class="btn btn-danger"></a>
</Td>
</tr>

<%
}
%>
</table>
</div>
</div>
</body>
</html>
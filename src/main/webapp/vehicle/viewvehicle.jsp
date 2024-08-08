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
<title>VehicleRentalWebApp</title>
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
rs=stmt.executeQuery("select * from tblvehicle where vid='"+session.getAttribute("vid")+"'");
%>
 <div class="container-fluid py-3">
        <div class="container pt-3">
<a href="addvehicle.jsp"><input type="button" value="Add Vehicle" class="btn btn-warning"></a>
<table class="table">
<Tr>
<td>
 Name
</td>
<td>
 Price
</td>
<td>
 Discount Price
</td>
<td>
 Stock
</td>
</Tr>
<%
while(rs.next()){
%>

<tr>
<Td>
 <%
 out.println(rs.getString("vname"));
 %>
</Td>
<Td>
 <%
 out.println(rs.getString("vprice"));
 %>
</Td>
<Td>
 <%
 out.println(rs.getString("vdprice"));
 %>
</Td>
<Td>
 <%
 out.println(rs.getString("vstock"));
 %>
</Td>
<Td>
<a href="update.jsp?id=<%out.println(rs.getString("veid"));%>"><input type="button" value="Update" class="btn btn-warning"></a>
</Td>
<Td>
<a href="deleteprod.jsp?id=<%out.println(rs.getString("veid"));%>"><input type="button" value="Delete" class="btn btn-danger"></a>
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
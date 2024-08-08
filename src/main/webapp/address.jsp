<%@page import="classfile.Mylib"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<div class="container-fluid py-3">
        <div class="container pt-3">
<a href="addaddress.jsp">Add Address</a>
<table class="table">
<tr>
<TD>
Address
</TD>

</tr>

<%
try{
	Double totalamt=0.0;
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	Class.forName("org.postgresql.Driver");
	Mylib l1=new Mylib();
	con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from tbladdress where uid="+session.getAttribute("uid"));
	while(rs.next()){
		%>
		<tr>
		<tD><%out.println(rs.getString("area")+","+rs.getString("city")+","+rs.getString("nearme")+","+rs.getString("pin"));%></tD>
		<td><a href="bill.jsp?id=<%out.println(rs.getString("addid"));%>">Choose</a></td>
		</tr>
		
		<%
		
	}
	%>
	</table>
	<%

}
catch(Exception ex){
	
}

%>
</div>
</div>
<%@include file='footer.jsp' %>
</body>
</html>
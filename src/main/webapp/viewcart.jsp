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
<table class="table">
<tr>
<TD>
 Id
</TD>
<td>
 Name
</td>
<Td>
 Price
</Td>
<tD>
Days
</tD>
<td>
Total
</td>
</tr>

<%
try{
	Double totalamt=0.0;
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	Class.forName("org.postgresql.Driver");
	con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from tblcart,tblvehicle where tblcart.veid=tblvehicle.veid and tblcart.uid="+session.getAttribute("uid")+" and status='0'");
	while(rs.next()){
		%>
		<tr>
		<tD><%out.println(rs.getString("vid"));%></tD>
		<tD><%out.println(rs.getString("vname"));%></tD>
		<tD><%out.println(rs.getString("vdprice"));%></tD>
		<tD><%out.println(rs.getString("days"));%></tD>
		<td>
		<%
		Double d1=Double.parseDouble(rs.getString("vdprice"));
		Double d2=Double.parseDouble(rs.getString("days"));
		out.println(d1*d2);
		totalamt=totalamt+(d1*d2);
		%>
		</td>
		<td>
		<a href="delete.jsp?id=<%out.println(rs.getString("cartid"));%>">X</a>
		</td>
		</tr>
		
		<%
		
	}
	%>
	<tR>
	<tD>
	Total
	</tD>
	<td>
	<% out.println(totalamt+""); %>
	</td>
	</tR>
	<%

}
catch(Exception ex){
	
}

%>
<br>
<a href="address.jsp"><input type="button" class="btn btn-success" value="choose address"></a>
</table>
</div>
</div>
<%@include file='footer.jsp' %>
</body>
</html>
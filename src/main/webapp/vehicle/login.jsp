<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
<br>
<br>
<br>
<%
if(request.getParameter("btnlogin")!=null){
	
	String pass=request.getParameter("txtpass");
	String email=request.getParameter("txtemail");
	Mylib l1=new Mylib();
	if(l1.exists("select * from tblvendor where vemail='"+email+"' and vpass='"+pass+"'")){
		session.setAttribute("email",email);
		
Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from tblvendor where vemail='"+session.getAttribute("email")+"'");
while(rs.next()){
	session.setAttribute("vid",rs.getInt("vid"));
	session.setAttribute("vname",rs.getString("vname"));
	
}
rs.close();
stmt.close();
con.close();
%>

		<script>
			alert("Login Success");
			window.location.href="viewcategory.jsp";
		</script>
		<%
	}
	else{
		%>
		<script>
		alert("Invalid TRY");
		</script>
		<%
	}

}

%>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
<form method="post">
<table class="table">
<tr>
<td>
Email
</td>
<td>
<input type="text" name="txtemail"  pattern="^[a-z]*[0-9]*@[a-z]*[0-9]*\.[a-z]{2,3}$" required class="form-control">
</td>
</tr>
<tr>
<td>
Password
</td>
<td>
<input type="password" name="txtpass" required class="form-control">
</td>
</tr>


<tr>
<td colspan=2 align=center>
<input type="submit" name="btnlogin" value="Login" class="btn btn-success">
</td>
</tr>
<tr>
<td colspan=2 align=center>
<center>
<h6>Not a member?
<a href="register.jsp">sign up!</a></h6>

</center>
</td>
</tr>
</table>
</form>
</div>
<div class="col-md-3"></div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
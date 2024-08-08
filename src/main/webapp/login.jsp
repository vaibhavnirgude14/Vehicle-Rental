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
<%
if(request.getParameter("btnlogin")!=null){
	
	String pass=request.getParameter("txtpass");
	String email=request.getParameter("txtemail");
	Mylib l1=new Mylib();
	if(l1.exists("select * from tbluser where email='"+email+"' and upass='"+pass+"'")){
		session.setAttribute("email",email);
		
Statement stmt=null;
Connection con=null;
ResultSet rs=null;
Class.forName("org.postgresql.Driver");
con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/dbtemplate","postgres","postgres");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from tbluser where email='"+session.getAttribute("email")+"'");
while(rs.next()){
	session.setAttribute("uid",rs.getInt("uid"));
	session.setAttribute("uname",rs.getString("uname"));
	
}
rs.close();
stmt.close();
con.close();
%>

		<script>
			alert("Login Success");
			window.location.href="welcome.jsp";
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
 <div class="container-fluid p-3" style="margin-bottom: 10px;">
        <div id="header-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
 <div class="carousel-item active">
                    <img class="w-100" src="img/carousel-1.jpg" alt="Image">
                    <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                        <div class="p-1" style="max-width: 900px;">
              <form method="post">
<table class="table">
<tr>
<td>
<h6 style="color:white;">Email</h6>
</td>
<td>
<input type="text" name="txtemail" class="form-control">
</td>
</tr>
<tr>
<td>
<h6 style="color:white;">Password</h6>
</td>
<td>
<input type="password" name="txtpass" class="form-control">
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
<h6 style="color:white;">Not a member?
<a href="register.jsp">sign up!</a></h6>
</center>
</td>
</tr>
</table>
</form>
         </div>
       </div>
    </div>
  </div>
   </div>
    </div>
<%@include file='footer.jsp' %>
</body>
</html>
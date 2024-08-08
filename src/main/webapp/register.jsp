<%@page import="classfile.Mylib"%>
<html>
<head>
<%@include file='head.jsp' %>
</head>
<body>
<%@include file='menu.jsp' %>
<%
if(request.getParameter("btnsave2")!=null){
	String name=request.getParameter("txtname");
	String pass=request.getParameter("txtpass");
	String number=request.getParameter("txtnumber");
	String email=request.getParameter("txtemail");
	String gender=request.getParameter("rbgender");
	String dob=request.getParameter("txtdate");
	Mylib l1=new Mylib();
	l1.dml("insert into tbluser(uname,upass,phone,email,gender,dob)values('"+name+"','"+pass+"','"+number+"','"+email+"','"+gender+"','"+dob+"')");
	%>
	<script>
	alert("Registration Success");
	window.location.href="login.jsp";
	</script>
	<%
}

%>
   <div class="container-fluid ">
        <div class="container py-2">
            <div class="bg-banner py-10 px-5 text-center">
                <div class="py-5">
<h3 class="text-uppercase mb-4" style="color:white;">Registration</h3><br>
<form method="post">
<table class="table">
<tr>
<td>
<h6 style="color:white;">Name</h6>
</td>
<td>
<input type="text" pattern="[a-zA-Z]+(?: [a-zA-Z]+)*" name="txtname" class="form-control">
</td>
</tr>
<tr>
<td>
<h6 style="color:white;">E-mail</h6>
</td>
<td>
<input type="email" name="txtemail" class="form-control">
</td>
</tr>
<tr>
<td>
<h6 style="color:white;">Mobile no.</h6>
</td>
<td>
<input type="tel" name="txtnumber" class="form-control">
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
<td>
<h6 style="color:white;">DOB</h6>
</td>
<td>
<input type="date" name="txtdate" class="form-control">
</td>
</tr>
<tr>
<td>
<h6 style="color:white;">Gender</h6>
</td>
<td>
<h6 style="color:white;"><input type="radio" name="rbgender" value="male" checked="checked">Male&nbsp;
<input type="radio" name="rbgender" value="Female">Female&nbsp;
<input type="radio" name="rbgender" value="Transgender">Other&nbsp;</h6>
</td>
</tr>

<tr>
<td colspan=2 align=center><br>
<input type="reset" name="btnsave" value="Clear" class="btn-outline-secondary" data-mdb-ripple-init data-mdb-ripple-color="dark">&nbsp;&nbsp;
<input type="submit" name="btnsave2" value="Ceate Account" class="btn-success">
</td>
</tr>
</table>
</form>
 </div>
            </div>
            </div>
        </div>
    

<%@include file='footer.jsp' %>
</body>
</html>
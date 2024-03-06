<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>save data</title>
</head>
<body>

	<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	String cpass = request.getParameter("cpass");
	
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb", "postgres", "Postgre@123");
	
	if(pass.equals(cpass)){
		PreparedStatement ps=con.prepareStatement("insert into facebook(username,useremail,userPass,confirmPass)values('"+name+"','"+email+"','"+pass+"','"+cpass+"')");
		ps.executeUpdate();
		out.println("<script>");
		out.println("alert('Registration Successfull')");
		out.println("window.location.href='login.html'");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('Password does not match')");
		out.println("window.location.href='register.html'");
		out.println("</script>");
	}
	
	%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update data</title>
</head>
<body>
	<%
	String name = request.getParameter("name");
	String newpass = request.getParameter("newpass");
	String newcpass = request.getParameter("newcpass");

	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb", "postgres", "Postgre@123");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from facebook where username='" + name + "'");

	if (rs.next()) {
		if (newpass.equals(newcpass)) {
			PreparedStatement psmt = con.prepareStatement("update facebook set userPass='" + newpass + "', confirmPass='"
			+ newcpass + "'where username='" + name + "' ");

			psmt.executeUpdate();
			out.println("<script>");
			out.println("alert('Password updated ')");
			out.println("window.location.href='login.html'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('password does not match')");
			out.println("window.location.href='forgotPassword.jsp'");
			out.println("</script>");
		}
	}
	%>

</body>
</html>
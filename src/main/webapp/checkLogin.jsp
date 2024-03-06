<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	
	HttpSession ss = request.getSession();
	ss.setAttribute("username", name);
	
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb", "postgres", "Postgre@123");

	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM facebook WHERE username = '" + name + "' AND userPass = '" + pass + "'");
	if (rs.next()) {
		out.println("<script>");
		out.println("alert('Login Successfull')");
		out.println("window.location.href='dashboard.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('Login Failed')");
		out.println("window.location.href='login.html'");
		out.println("</script>");
	}
	%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>

	<%
	HttpSession ss = request.getSession(false);
	String name = (String) ss.getAttribute("username");
	if (name == null) {
		response.sendRedirect("login.html");
	} else {
	%>

	<ul>
		<li><a href="logout.jsp">Logout</a></li>
		<li>
			<%
			out.println("username: " + name);
			%>
		</li>

	</ul>

	<%
	}
	%>
</body>
</html>
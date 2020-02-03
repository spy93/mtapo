<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGBD</title>
    </head>
    <body>
        <% 
			if(request.getParameter("dbms").equals("mysql"))
			{
				response.sendRedirect("mysqlu.jsp");
			}
			else if(request.getParameter("dbms").equals("postgresql")){
				response.sendRedirect("postgresqlu.jsp");
			}
        %>
         
    </body> 
</html>

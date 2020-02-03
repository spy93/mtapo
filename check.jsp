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
			if(request.getParameter("user").equals("mada"))
			{
				response.sendRedirect("user.jsp");
			}
			else if(request.getParameter("user").equals("admin")){
				response.sendRedirect("admin.jsp");
			}
           
        %>
         
    </body>
</html>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="art/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SGBD</title>
    </head>
    <body>
    <sql:setDataSource var = "snapshot" driver = "com.postgresql.jdbc.Driver"
         url = "jdbc:postgresql://127.0.0.1/postgresdb"
         user = "mada"  password = "madaroot"/>
        
         <% 
            try {
			Connection con;
			// The JDBC Connector Class.
			String dbClassName = "com.postgresql.jdbc.Driver";
			String CONNECTION = "jdbc:postgresql://127.0.0.1/postgresdb";
			
			Class.forName(dbClassName).newInstance(); ;
			// Properties for user and password. Here the user and password are both 'paulr'
			Properties p = new Properties();
			p.put("user", "mada");
			p.put("password", "madaroot");
			// Now try to connect
			  con = DriverManager.getConnection(url, "postgres", "" );
              Statement st = con.createStatement();
              
              PreparedStatement stm = con.prepareStatement("SELECT * FROM angajat where username=? and password=?");
              stm.setString(1, request.getParameter("user"));
              stm.setString(2, request.getParameter("password"));
              
              ResultSet rs = st.executeQuery(stm);
              
              if(rs.next()){
                  session.setAttribute("errorMessage", "");
                  response.sendRedirect("main.jsp");
              }
              else{
                  session.setAttribute("errorMessage", "Datele introduse sunt incorecte");
                  response.sendRedirect("index.jsp");               
              }
              
            }
            catch(Exception e)
            {
				e.printStackTrace(new java.io.PrintWriter(out));
              out.println("Could not connect");
            }
        %>
         
        
    </body>
</html>
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
        <title>Amanet SI</title>
    </head>
    <body>
        <% 
        
        String id = request.getParameter("id");
        String nume = request.getParameter("nume");
        String prenume = request.getParameter("prenume");
        String an = request.getParameter("an");
        String cnp = request.getParameter("cnp");
        String grupa = request.getParameter("grupa");
            try {
			 Connection con;

			// The JDBC Connector Class.
			String dbClassName = "com.mysql.jdbc.Driver";
			String CONNECTION = "jdbc:mysql://127.0.0.1/studenti";
			
			Class.forName(dbClassName).newInstance(); ;
			Properties p = new Properties();
			p.put("user", "mada");
			p.put("password", "madaroot");

			// Now try to connect
			  con = DriverManager.getConnection(CONNECTION, p);
              Statement st = con.createStatement();
              
              PreparedStatement stm = con.prepareStatement("insert into STUDENTI(IdStudent, Nume, Prenume, AnNastere,CNP, IdGrupa) values(?,?,?,?,?,?); ");
              stm.setString(1, id);
              stm.setString(2, nume);
              stm.setString(3, prenume);
              stm.setString(4, an);
              stm.setString(5, cnp);
              stm.setString(6, grupa);
              
              ResultSet rs = stm.executeQuery();
              
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

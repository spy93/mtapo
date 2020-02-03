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
    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://127.0.0.1/studenti"
         user = "mada"  password = "madaroot"/>
         
         <div class="container">
				<div class="row">
                <div class="col-md-4 offset-md-4 loginform">
						
		<h3> Tabelele din acest database sunt:</h3>
						 
         <% 
            try {
			 Connection con;

			// The JDBC Connector Class.
			String dbClassName = "com.mysql.jdbc.Driver";
			String CONNECTION = "jdbc:mysql://127.0.0.1/studenti";
			
			Class.forName(dbClassName).newInstance(); ;
			Properties p = new Properties();
			p.put("user", "mada");
			p.put("password", "madaroot");

			  con = DriverManager.getConnection(CONNECTION, p);
              Statement st = con.createStatement();
              PreparedStatement stm = con.prepareStatement("SELECT table_name FROM information_schema.tables WHERE table_schema =?;");
			  stm.setString(1, request.getParameter("db"));
			  ResultSet rs = stm.executeQuery();
			  while (rs.next()) {
				String tblName = rs.getString("TABLE_NAME");
			  %>
				<h3><%=tblName%></h3>
				
				<%
			}
            }
            catch(Exception e)
            {
				e.printStackTrace(new java.io.PrintWriter(out));
              out.println("Could not connect");
            }
        %>
        <br>
						<form  action="addTableMysql.jsp" method="post" > 
							<th><input type="submit" value="Add" name="button" /></th> 
						</form> <br>
						<form  action="alterTableMysql.jsp" method="post"> 
							<th><input type="submit" value="Modify" name="button" /></th> 
						</form> <br>
						<form  action="dropTableMysql.jsp" method="post"> 
							<th><input type="submit" value="Delete" name="button" /></th> 
						</form> <br>
        </div>
            </div>
        </div>
    </body>
</html>

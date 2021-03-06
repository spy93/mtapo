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
        
        
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 loginform">
                    
                    <h1>Log In</h1><br>
                    <form action="check.jsp" method="POST">
                        <div class="form-group">
                            <label for="emailfield">User</label>
                            <input type="input" class="form-control" id="userfield" name="user">
                        </div>
                        
                        <div class="form-group">
                            <label for="passwordfield">Password</label>
                            <input type="password" class="form-control" id="passwordfield" name="password">
                        </div>
                        
                        <button type="submit" class="btn btn-secondary mb-2">Submit</button>
                        
                    </form>
                    
                    <b> ${sessionScope.errorMessage} </b>
                </div>
            </div>
        </div>
        
    </body>
</html>

<%-- 
    Document   : newjsp
    Created on : 27 Jun, 2019, 7:19:13 PM
    Author     : AzizStark
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pkga" scope="session" class="pkga.pkgalogin" />    
<jsp:setProperty name="pkga" property="*" />
<%@ page import="java.sql.*" %>
<%!
  public String emp_name = "";
  public String emp_pass = "";
%>  
<%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "SYSTEM", "148635Stark");
  try {
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM users");
    while (rs.next()) {
      emp_name = rs.getString(1);
      emp_pass = rs.getString(2);
      //out.print(emp_name + ": ");
      //out.print(emp_pass + "\n");
      //System.out.println("   RS: " + emp_sal);
    }

    if (emp_name.equals(pkga.getName()) && emp_pass.equals(pkga.getPass())){
        out.print(" <h1 style='text-align: center;color: white' class='display-1'>Login Successful </h1>");
        out.print("<meta http-equiv='refresh'content='2;url=next.jsp' />");
      }
      else{
        out.print(" <h1 class='display-1' style='text-align: center;color: white' >Login Failed </h1>");
     }
    con.close();
  } catch (Exception e) {
    out.print(e);
  }
%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Audiowide&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<title>JSP Page</title>-->
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
         <title>AzizStark Showroom</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="font-family: 'Audiowide', cursive;" background="https://api.thedrive.com/wp-content/uploads/2017/07/aventador-novitec.jpg?quality=85">
       <!-- <h1>Hello World!</h1>
        <a href="next.jsp"> Next </a> -->
    </body>
</html>

<%-- 
    Document   : next
    Created on : 27 Jun, 2019, 7:36:59 PM
    Author     : AzizStark
--%>
<jsp:useBean id="pkga" scope="session" class="pkga.pkgalogin" />   
<mvc:resources mapping="/template/**" location="/WEB-INF/template/"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%!
  public String emp_name = "";
%>  
<%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "SYSTEM", "148635Stark");
  //Blob image = null;
  //byte[] imgData = null;
  try {
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM image_cars");
    int i = 0;
    out.print("<h1 class='display-1' style='text-align:center;color: white;'>Aziz Automobiles</h1>");
    out.print(" <h1 class'display-1' style='color: white;'>Welcome Customer: " + pkga.getName() + " !</h1>");
    // response.setContentType("image/gif");
    //OutputStream o = response.getOutputStream();
    while (rs.next()) {
      i = i + 1;
      //image = rs.getBlob(2);
      //imgData = image.getBytes(1, (int) image.length());
      // out.println(" <form class="form-group" action="finals.jsp" method="POST"> <table class'table table-striped<tbody> <tr id="somerow"> <th>" + rs.getInt(1) + "</th> <th>" + rs.getString(3) + " </th> <th>" + rs.getString(4) + "<button type'button' class='btn btn-primary'  onclick='clicked(" + i + ")'>BUY</button></tr></table>");
      out.print("<table class='table table-dark' style='color: white;'><tbody><tr ><th scope='row' id='somerow'>" + rs.getInt(1) + "</th><td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td><button type'button' class='btn btn-primary'  onclick='clicked(" + i + ")' value='submit'>BUY</button></td></tr>");
      //o.write(imgData);
      // o.flush();
      //o.close();
    }
    //out.print("<table class='table'><thead><tr><th scope='col'>#</th><th scope='col'>First</th><th scope'col'>Last</th><th scope='col'>Handle</th></tr>");

    con.close();
  } catch (Exception e) {
    out.print(e);
  }
  // response.setContentType("image/gif");
%>


<script>function clicked(nr) {
        window.alert('Order Successful!');
        window.location = 'finals.jsp?value=' + nr;
    }</script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aziz Autombiles</title>
        <link href="https://fonts.googleapis.com/css?family=Audiowide&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>

    <body style="font-family: 'Audiowide', cursive;" background="https://api.thedrive.com/wp-content/uploads/2017/07/aventador-novitec.jpg?quality=85">
        <%-- Pass: <%=pkga.getPass()%><br />
        <p>Welcome, <%=pkga.getName()%></p>
        <% out.println("Apache");%>
        <%--<%= odata.getora()%>
        <%= emp_name%>--%>
    </body>
</html>

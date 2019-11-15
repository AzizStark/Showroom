<%-- 
    Document   : finals
    Created on : 28 Jun, 2019, 9:44:20 AM
    Author     : AzizStark
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="pkga" scope="session" class="pkga.pkgalogin" />    
<jsp:setProperty name="pkga" property="*" />
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%!
  public String emp_name = "";
  public String emp_pass = "";
  public String querri = "";
%>  
<%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL", "SYSTEM", "148635Stark");
  String a= request.getParameter("value");
  out.println(" <h1  style='color:white'>Congrats! You bought the car!</h1>");
  if ((a.toString()).equals("1")) {
      querri = "INSERT INTO ORDERS(ID,NAME,PRICE) VALUES (1,'Ferrari',25650000)";
  }else if((a.toString()).equals("2")){
      querri = "INSERT INTO ORDERS(ID,NAME,PRICE) VALUES (2,'Lamborgini',21685990)";
  }else if((a.toString()).equals("3")){
      querri = "INSERT INTO ORDERS(ID,NAME,PRICE) VALUES (3,'Aston Martin',13423212)";
  }else if((a.toString()).equals("4")){
      querri = "INSERT INTO ORDERS(ID,NAME,PRICE) VALUES (4,'Ford GT',19341342)";
  }
  
  try {
    String qry = querri;
    Statement s = con.createStatement();
    int i = s.executeUpdate(qry);
    out.println("<h4  style='color:white'>Garage:     List of cars that you bought recently</h4>");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM orders");
    while (rs.next()) {
      emp_name = rs.getString(1);
      emp_pass = rs.getString(2);
      
      out.print("<table class='table' style='color:white'><tbody><tr ><th scope='row' id='somerow'>" + "Model.No: "+rs.getInt(1) + "</th><td>" +"Car name: "+ rs.getString(2)  + "</td><td>" + rs.getString(3) + "</td><td></td></tr>");
      //System.out.println("   RS: " + emp_sal);
    }

    con.close();
  } catch (Exception e) {
    out.print(e);
  }
%>

<!DOCTYPE html>
<html>
    <head>
         <title>AzizStark Showroom</title>
        <link href="https://fonts.googleapis.com/css?family=Audiowide&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<title>JSP Page</title>-->
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body style="font-family: 'Audiowide', cursive;" background="https://www.larutadelsorigens.cat/wallpic/full/10-103971_audi-headlights-hd-cars-4k-wallpapers-images-backgrounds.jpg">
       

    </body>
</html>

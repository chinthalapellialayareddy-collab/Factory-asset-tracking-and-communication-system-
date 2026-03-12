<%@ page import="java.sql.*" %>

<html>
<head>

<title>Feedback Submitted</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
}

.box{
width:420px;
margin:150px auto;
background:white;
padding:30px;
border-radius:10px;
text-align:center;
box-shadow:0 0 15px rgba(0,0,0,0.2);
}

a{
text-decoration:none;
font-weight:bold;
}

</style>

</head>

<body>

<div class="box">

<%

String name=request.getParameter("name");
String email=request.getParameter("email");
String message=request.getParameter("message");

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:xe","alaya","123456");

PreparedStatement ps=con.prepareStatement(
"insert into feedback(name,email,message) values(?,?,?)");

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,message);

ps.executeUpdate();

out.println("<h2>Thank You! Feedback Submitted Successfully.</h2>");

con.close();

}

catch(Exception e){
out.println("Error: "+e);
}

%>

<br><br>
<a href="feedback.html">Back</a>

</div>

</body>
</html>
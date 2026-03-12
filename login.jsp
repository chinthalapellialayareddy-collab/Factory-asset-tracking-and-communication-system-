<%@ page import="java.sql.*" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

con = DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:xe","alaya","123456");

ps = con.prepareStatement(
"SELECT * FROM USERS WHERE EMAIL=? AND PASSWORD=?");

ps.setString(1,email);
ps.setString(2,password);

rs = ps.executeQuery();

if(rs.next()){
%>

<h2>Login Successful</h2>
Welcome <%=rs.getString("NAME")%>
<br><br>
<a href="index.html">Go to Home</a>

<%
}else{
%>

<h2>Invalid Email or Password</h2>
<a href="login.html">Try Again</a>

<%
}

}catch(Exception e){
out.println("Error: "+e);
}

%>
<%@ page import="java.sql.*" %>

<%
String sender=request.getParameter("sender");
String receiver=request.getParameter("receiver");
String message=request.getParameter("message");

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:xe","alaya","123456");

PreparedStatement ps=con.prepareStatement(
"insert into communication(sender,receiver,message) values(?,?,?)");

ps.setString(1,sender);
ps.setString(2,receiver);
ps.setString(3,message);

ps.executeUpdate();

out.println("<h2>Message Sent Successfully</h2>");

con.close();

}

catch(Exception e){
out.println("Error: "+e);
}
%>
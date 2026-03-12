<%@ page import="java.sql.*" %>

<%
String assetid=request.getParameter("assetid");
String problem=request.getParameter("problem");

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:xe","alaya","123456");

PreparedStatement ps=con.prepareStatement(
"insert into maintenance(asset_id,problem_desc,request_date) values(?,?,sysdate)");

ps.setInt(1,Integer.parseInt(assetid));
ps.setString(2,problem);

ps.executeUpdate();

out.println("<h2>Maintenance Request Submitted Successfully</h2>");

con.close();

}

catch(Exception e){
out.println("Error: "+e);
}

%>
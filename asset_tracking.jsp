<%@ page import="java.sql.*" %>

<%
String assetid=request.getParameter("assetid");
String status=request.getParameter("status");
String location=request.getParameter("location");

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:xe","alaya","123456");

PreparedStatement ps=con.prepareStatement(
"insert into asset_track(asset_id,status,location,updated_date) values(?,?,?,sysdate)");

ps.setInt(1,Integer.parseInt(assetid));
ps.setString(2,status);
ps.setString(3,location);

ps.executeUpdate();

out.println("<h2>Asset Tracking Updated Successfully</h2>");

con.close();

}
catch(Exception e){
out.println("Error: "+e);
}
%>
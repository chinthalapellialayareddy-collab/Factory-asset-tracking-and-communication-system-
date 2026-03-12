<%@ page import="java.sql.*" %>

<%
String assetid=request.getParameter("assetid");
String empid=request.getParameter("empid");
String adate=request.getParameter("assigndate");
String rdate=request.getParameter("returndate");

Connection con=null;

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

con=DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:xe",
"alaya",
"123456"
);

PreparedStatement ps=con.prepareStatement(
"insert into asset_assign(asset_id,emp_id,assign_date,return_date) values(?,?,?,?)");

ps.setInt(1,Integer.parseInt(assetid));
ps.setInt(2,Integer.parseInt(empid));
ps.setDate(3,java.sql.Date.valueOf(adate));
ps.setDate(4,java.sql.Date.valueOf(rdate));

int i=ps.executeUpdate();

if(i>0)
{
out.println("<h2>Asset Assigned Successfully</h2>");
}
else
{
out.println("<h2>Assignment Failed</h2>");
}

con.close();

}

catch(Exception e)
{
out.println("Error: "+e);
}
%>
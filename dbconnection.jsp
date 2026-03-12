<%@ page import="java.sql.*" %>
<%
Connection con = null;
try {
    Class.forName("oracle.jdbc.driver.OracleDriver"); // Load Oracle driver
    con = DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:xe", // Your DB URL
        "alaya",   // <-- Your DB username
        "123456"  // <-- Your DB password
    );
} catch(Exception e){
    out.println("<h3 style='color:red;text-align:center;'>DB Connection Error: "+e.getMessage()+"</h3>");
}
%>
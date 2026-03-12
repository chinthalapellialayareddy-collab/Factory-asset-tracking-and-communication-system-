<%@ page import="java.sql.*" %>

<%
Connection con = null;

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

con = DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:xe",
"alaya",
"123456"
);

String name=request.getParameter("empname");
String dept=request.getParameter("dept");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String pass=request.getParameter("password");

PreparedStatement ps=con.prepareStatement(
"insert into employee(emp_name,department,phone,email,password) values(?,?,?,?,?)"
);

ps.setString(1,name);
ps.setString(2,dept);
ps.setString(3,phone);
ps.setString(4,email);
ps.setString(5,pass);

ps.executeUpdate();

out.println("Employee Registered Successfully");

}
catch(Exception e){
out.println(e);
}

%>
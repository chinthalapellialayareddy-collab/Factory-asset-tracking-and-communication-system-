<%@ page import="java.sql.*" %>

<html>
<head>
<title>Asset Details</title>

<style>

body{
font-family: Arial;
background:#f4f6f9;
}

.tablebox{
width:500px;
margin:100px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 15px rgba(0,0,0,0.2);
}

h2{
text-align:center;
margin-bottom:20px;
}

table{
width:100%;
border-collapse:collapse;
}

td{
padding:10px;
border-bottom:1px solid #ddd;
}

</style>

</head>

<body>

<div class="tablebox">

<h2>Asset Information</h2>

<%

String id=request.getParameter("assetid");

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:xe","alaya","123456");

PreparedStatement ps=con.prepareStatement(
"select * from asset where asset_id=?");

ps.setString(1,id);

ResultSet rs=ps.executeQuery();

if(rs.next()){
%>

<table>

<tr>
<td><b>Asset ID</b></td>
<td><%=rs.getString("asset_id")%></td>
</tr>

<tr>
<td><b>Asset Name</b></td>
<td><%=rs.getString("asset_name")%></td>
</tr>

<tr>
<td><b>Asset Type</b></td>
<td><%=rs.getString("asset_type")%></td>
</tr>

<tr>
<td><b>Manufacturer</b></td>
<td><%=rs.getString("manufacturer")%></td>
</tr>

<tr>
<td><b>Purchase Date</b></td>
<td><%=rs.getString("purchase_date")%></td>
</tr>

<tr>
<td><b>Location</b></td>
<td><%=rs.getString("location")%></td>
</tr>

</table>

<%

}else{
out.println("<h3 style='text-align:center;color:red'>Asset Not Found</h3>");
}

con.close();

}catch(Exception e){
out.println("Error: "+e);
}

%>

</div>

</body>
</html>
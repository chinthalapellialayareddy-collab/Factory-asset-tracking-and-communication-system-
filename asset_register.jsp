<%@ page import="java.sql.*" %>
<%
Connection con = null;
try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection(
        "jdbc:oracle:thin:@localhost:1521:xe",
        "alaya",
        "123456"
    );

    String assetName = request.getParameter("asset_name");
    String assetType = request.getParameter("asset_type");
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    java.sql.Date date = java.sql.Date.valueOf(request.getParameter("date"));

    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO ASSET_REGISTER (ID, ASSET_NAME, ASSET_TYPE, QUANTITY, REGISTER_DATE) VALUES (ASSET_SEQ.NEXTVAL, ?, ?, ?, ?)"
    );
    ps.setString(1, assetName);
    ps.setString(2, assetType);
    ps.setInt(3, quantity);
    ps.setDate(4, date);
    ps.executeUpdate();

    out.println("<h3 style='color:green;'>Asset Registered Successfully!</h3>");

} catch(Exception e) {
    out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
}
%>
<%@page import="java.sql.*"%>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/email","vijay","vijay2003");
}
catch(Exception e)
{
    out.println(e.getMessage());
}
%>
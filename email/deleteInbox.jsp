<%@page import="java.sql.*"%>
<%=request.getParameter("ids")%>
<%
out.println(request.getParameter("ids"));
String id[]=request.getParameter("ids").split(",");
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware","vijay","vijay2003");
    for(String val:id)
    {
        int x=Integer.parseInt(val.trim());

        String sql = "UPDATE mails SET inbox = ? WHERE mid = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, 0); 
        ps.setInt(2, x); 
        ps.executeUpdate();
    }
}catch(Exception e){
    out.println(e);
}
response.sendRedirect("inbox1.jsp");


%>
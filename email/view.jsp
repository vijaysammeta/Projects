<%@page import="java.sql.*"%>
<head>
    <style>
        .table{
            margin: 80px auto;
            margin-left: 500pxpx ;
            background-color: red;
        }
    </style>
</head>
<body>
    

<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware","vijay","vijay2003");

    PreparedStatement ps=conn.prepareStatement("select * from mails where mid=?");
    ps.setString(1,request.getParameter("mid"));
    ResultSet rs=ps.executeQuery();

    String mfrom="",subject="",text="";

    if(rs.next())
    {
        mfrom=rs.getString("mfrom");
        subject=rs.getString("subject");
        text=rs.getString("mtext");
    }
    %>
    <center>
        <div class="table" style="text-align: center;">
            <table border="1"> 
                <tr>
                    <td>From: <input type="text" value="<%=mfrom%>"></td>
                </tr>
                <tr>
                    <td>Subject: <input type="text" value="<%=subject%>"></td>
                </tr>
                <tr>
                    <td>Text: <input type="text" value="<%=text%>"></td>
                </tr>
            </table>
        </div>
        <input type="button" value="delete" onclick="f1()">
    </center>
    <%


}catch(Exception e){
    out.println(e);
}
%>

<script>
    function f1(){
        window.location.href="deleteInbox.jsp?ids="+<%=request.getParameter("mid")%>
    }
</script>
</body>
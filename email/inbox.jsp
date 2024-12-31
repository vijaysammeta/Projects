<html>
  <head>
    <style>
      td a {
        color: aliceblue;
        text-decoration: none;
      }
      table {
        border-radius: 10px;
      }
    </style>
  </head>
  <body>
    <center>
      <table style="width: 100%; height: 30px; background-color: brown; ">
        <tr>
          <td align="right"><a href="inbox.jsp">Inbox</a></td>
          <td align="right"><a href="SentBox.jsp">SentBox</a></td>
          <td align="right"><a href="ComposeMail.jsp">ComposeMail</a></td>
          <td align="center"><a href="logout.jsp">Logout</a></td>
        </tr>
      </table>
    </center>
    <br />
    <!-- <table align=right><tr><td><a href="logout.jsp">Logout</a></td></tr></table> -->
    <% String emailid="";
     if(session.getAttribute("emailid")!=null){
    emailid=session.getAttribute("emailid").toString(); %>
    <center>
      <h1>
        <% out.println("Dear "+emailid+" <br />
        Your "); %> Inbox Reached
      </h1>
    </center>
    <% }
     else
     {
      response.sendRedirect("login.jsp");
      } %>
    <h1 style="text-align: center; background-color: rgb(163, 125, 76)">
      Your mails
    </h1>

    <%@page import="java.sql.*"%> 
    <% 
    try{
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware","vijay","vijay2003");
    PreparedStatement ps=conn.prepareStatement("select * from mails where mto=? and inbox=?"); 
    ps.setString(1,emailid); 
    ps.setInt(2,1); 
    ResultSet rs=ps.executeQuery();
     %>
    <table width="70%" border="1px" cellspacing="0" align="center">
      <tr>
        <th>From</th>
        <th>Subject</th>
        <th><input type="button" value="delete" onclick="dlt()" /></th>
      </tr>

      <% while(rs.next()) { %>
      <tr>
        <td style="text-align: center"><%=rs.getString("mfrom")%></td>
        <td style="text-align: center">
          <a href='<%="view.jsp?mid="%><%=rs.getString("mid")%>'>
            <font color="blur"><%=rs.getString("subject")%></font>
          </a>
        </td>
        <td style="text-align: center">
          <input
            type="checkbox"
            name="select"
            value='<%=rs.getString("mid")%>'
          />
        </td>
      </tr>
      <% } %>
    </table>
    <% }catch(Exception e){ } %>
  </body>
  <script>
    function dlt() {
      let selected = document.querySelectorAll("input[name=select]:checked");
      values = [];
      selected.forEach((e) => {
        values.push(e.value);
      });
      if (values.length > 0) {
        var url = "deleteInbox.jsp?ids=" + values.join(",");
        window.location.href = url;
      } else {
        alert("None are Selected");
      }
    }
  </script>
</html>

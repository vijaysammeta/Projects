<!DOCTYPE html>
<html>
<head>
  <style>
    td a {
      color: aliceblue;
      text-decoration: none;
    }
    table {
      border-radius: 10px;
      width: 100%;
      background-color: brown;
      color: aliceblue;
    }
    table.inbox {
      width: 70%;
      margin: 20px auto;
      border-collapse: collapse;
    }
    table.inbox th, table.inbox td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: center;
    }
  </style>
</head>
<body>
  <center>
    <table>
      <tr>
        <td align="right"><a href="inbox1.jsp">Inbox</a></td>
        <td align="right"><a href="SentBox.jsp">SentBox</a></td>
        <td align="right"><a href="ComposeMail.jsp">ComposeMail</a></td>
        <td align="center"><a href="logout.jsp">Logout</a></td>
      </tr>
    </table>
  </center>
  <br />
  <% String emailid = "";
  if (session.getAttribute("emailid") != null) {
      emailid = session.getAttribute("emailid").toString(); %>
      <center>
        <h1>
          <% out.println("Dear " + emailid + " <br /> Your Inbox Reached"); %>
        </h1>
      </center>
  <% } else {
      response.sendRedirect("login.jsp");
  } %>
  <h1 style="text-align: center; background-color: rgb(163, 125, 76)">Your mails</h1>
  
  <%@page import="java.sql.*"%> 
  <% 
  try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "vijay", "vijay2003");
      PreparedStatement ps = conn.prepareStatement("SELECT * FROM mails WHERE mto = ? AND inbox = ?");
      ps.setString(1, emailid);
      ps.setInt(2, 1);
      ResultSet rs = ps.executeQuery();
  %>
  <table class="inbox">
    <tr>
      <th>From</th>
      <th>Subject</th>
      <th><input type="button" value="delete" onclick="dlt()" /></th>
    </tr>
    <% while (rs.next()) { %>
    <tr>
      <td><%= rs.getString("mfrom") %></td>
      <td>
        <a href='view.jsp?mid=<%= rs.getString("mid") %>'><%= rs.getString("subject") %></a>
      </td>
      <td>
        <input type="checkbox" name="select" value='<%= rs.getString("mid") %>' />
      </td>
    </tr>
    <% } %>
  </table>
  <% 
  } catch (Exception e) { 
      e.printStackTrace(); 
  } 
  %>
  
  <script>
     

    function dlt() {
      let selected = document.querySelectorAll("input[name=select]:checked");
      let values = [];
      selected.forEach((e) => {
        values.push(e.value);
      });
      if (values.length > 0) {
        let url = "deleteInbox.jsp?ids=" + values.join(",");
        window.location.href = url;
      } else {
        alert("None are selected");
      }
    }
  </script>
</body>
</html>

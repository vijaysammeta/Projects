<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<center><h1>My SentBox</h1></center><br><br><br><br>
<table border="1" align="center" width="60%">
<tr>
<th>To</th>
<th>Subject</th>
<th><input type="button" value="delete" onclick="dlt()"></th>
</tr>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "emailsoftware";
String userid = "vijay";
String password = "vijay2003";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String user_id=session.getAttribute("emailid").toString();
String user_pwd=request.getParameter("pwd");
int flag=0;
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from mails where mfrom='"+user_id+"' and sentbox=1";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){%>
<tr>
    <%String temp=resultSet.getString("mid");%>
<td><%=resultSet.getString("mto") %></td>
<td>
<a href="viewSnt.jsp?mid=<%=temp%> "><%=resultSet.getString("subject") %></a></td>

<td align="center"><input type="checkbox" name="select" value='<%= resultSet.getString("mid") %>'></td>

</tr>
<%
}
%>
</table>
<%
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>

<script>
    function dlt() {
        var checkboxes = document.querySelectorAll('input[name="select"]:checked');
        var values = [];
        checkboxes.forEach(function(checkbox) {
            values.push(checkbox.value);
        });
        if (values.length > 0) {
            var url = 'deleteSnt.jsp?ids=' + values.join(',');
            window.location.href = url;
        } else {
            alert('Please select at least one checkbox.');
        }
    }
    </script>

<html>
<head><style>
.myTextBox{
font-size:32px;
}
.myButton{
font-size:32px;
}
</style></head>
<body>
<br><br><br><br><br><br><br><br>
<%
String str=request.getParameter("msg");
String emailid="";
if(session.getAttribute("emailid")!=null)
emailid=session.getAttribute("emailid").toString();
if(str!=null)
out.println("<font size=32 color=red>"+str+"</font>");
%>

<form name="f1" action="InsertMail.jsp">

<table align=center width=65% border=0>
<tr><td class="myTextBox">From:</td><td><input type=text class="myTextBox" name=mfrom id=mfrom value="<%=emailid%>" readonly></td></tr>
<tr><td class="myTextBox">To:</td><td><input type=text class="myTextBox" name=mto id=mto></td></tr>
<tr><td class="myTextBox">Subject:</td><td><input type=text class="myTextBox" name=subj id=subj></td></tr>
<tr><td class="myTextBox">Text:</td><td><textarea name="mtext" id="mtext" border=1 width=100 class="myTextBox"></textarea></td></tr>
<tr><td></td><td><br><br><br><br><input type=submit value="SendMail" class="myButton">&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value="Reset" class="myButton">&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="Back" class="myButton" onclick="window.location.href='inbox1.jsp'"></td></tr>
</table></form></body></html>


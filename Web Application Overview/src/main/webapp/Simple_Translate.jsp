<%--
  Created by IntelliJ IDEA.
  User: QT-247202
  Date: 25/01/2022
  Time: 8:44 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Vietnamese Dictionary</h2>
<form action="/Simple_Translate_Servlet" method="post">
    <label>
        <input type="text" name="txtSearch" placeholder="Enter your word: "/>
    </label>
    <input type = "submit" id = "submit" value = "Search"/>
</form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: QT-247202
  Date: 25/01/2022
  Time: 8:26 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Title</title>
</head>
<body>
<h2>Curency converter</h2>
<form action="/Currency_Servlet" method="post">
    <label>Rate: <br>
    <input type="text" name="rate" placeholder="RATE" value="22000"></label><br>
    <label>
        USD: <br>
        <input type="text" name="usd" placeholder="USD" value="0">
    </label><br>
    <input type="submit" id="submit" value="Converter">
</form>
</body>
</html>

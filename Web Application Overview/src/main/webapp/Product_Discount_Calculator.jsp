<%--
  Created by IntelliJ IDEA.
  User: QT-247202
  Date: 25/01/2022
  Time: 9:00 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="/DiscountServlet" method="post">
    <label>Product Name: <br>
        <input type="text" name="name" placeholder="Name" value=""></label><br>
    <label>
        List Price: <br>
        <input type="text" name="price" placeholder="Price" value="0">
    </label><br>
    <label>
        Discount Percent(%): <br>
        <input type="text" name="percent" placeholder="Percent" value="0">
    </label><br>
    <input type="submit" id="submit" value="Converter">
</form>
</body>
</html>

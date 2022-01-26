<%--
  Created by IntelliJ IDEA.
  User: QT-247202
  Date: 26/01/2022
  Time: 8:19 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="converter.jsp" method="post">
    <table>
        <tr>
            <td>Rate</td>
            <td>
                <label>
                    <input type="text" name="rate" placeholder="RATE" value="22000">
                </label>
            </td>
        </tr>
        <tr>
            <td>USD</td>
            <td>
                <label>
                    <input type="text" name="usd" placeholder="USD" value="0">
                </label>
            </td>
        </tr>
        <tr>
            <td colspan="2"><label><input type="submit" value="Converter"></label></td>
        </tr>
    </table>

</form>
</body>
</html>

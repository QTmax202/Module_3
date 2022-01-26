<%--
  Created by IntelliJ IDEA.
  User: QT-247202
  Date: 26/01/2022
  Time: 9:01 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Simple Calculator</h2>
<form action="Calculate.jsp" method="post">
    <table>
        <tr>
            <td>First operand</td>
            <td><label>
                <input type="text" name="first" value="0">
            </label></td>
        </tr>
        <tr>
            <td>Operator</td>
            <td>
                <label for="operator"></label>
                <select name="operator" id="operator">
                    <option value="plus">+</option>
                    <option value="minus">-</option>
                    <option value="multiply">x</option>
                    <option value="division sign">/</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second operand</td>
            <td><label>
                <input type="text" name="second" value="0">
            </label></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="Calculate" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>

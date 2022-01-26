<%--
  Created by IntelliJ IDEA.
  User: QT-247202
  Date: 25/01/2022
  Time: 9:58 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title><meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<h1>Edit student</h1>
<div>
    <form action="${pageContext.request.contextPath}/home?action=editPost" method="post">
        <table>
            <tr>
                <td>Name</td>
                <td>
                    <label>
                        <input type="text" name="name" value="${student.getName()}">
                    </label>
                </td>
            </tr>
            <tr>
                <td>Age</td>
                <td>
                    <label>
                        <input type="text" name="age" value="${student.getAge()}">
                    </label>
                </td>
            </tr>
            <tr>
                <td>Address</td>
                <td>
                    <label>
                        <input type="text" name="address" value="${student.getAddress()}">
                    </label>
                </td>
            </tr>
            <tr>
                <td>Avg</td>
                <td>
                    <label>
                        <input type="text" name="avg" value="${student.getAvg()}">
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn btn-warning">Edit</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: QT-247202
  Date: 26/01/2022
  Time: 2:56 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/city?action=editPost" method="post">
    <table class="table table-striped">
        <thead>
        <tr>
            Edit city
        </tr>
        </thead>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <td>--%>
<%--                <label>--%>
<%--                    <input type="text" name="id">--%>
<%--                </label>--%>
<%--            </td>--%>
<%--        </tr>--%>
        <tr>
            <th>Name</th>
            <td>
                <label>
                    <input type="text" name="name" value="${city.getName()}">
                </label>
            </td>
        </tr>
        <tr>
            <th>Area</th>
            <td>
                <label>
                    <input type="text" name="area" value="${city.getArea()}">
                </label>
            </td>
        </tr>
        <tr>
            <th>Population</th>
            <td>
                <label>
                    <input type="text" name="population" value="${city.getPopulation()}">
                </label>
            </td>
        </tr>
        <tr>
            <th>GDP</th>
            <td>
                <label>
                    <input type="text" name="gdp" value="${city.getGDP()}">
                </label>
            </td>
        </tr>
        <tr>
            <th>Country</th>
            <td>
                <label>
                    <select name="country" id="country">
                        <option value="${city.getCountry()}">VN</option>
                        <option value="${city.getCountry()}">ENG</option>
                        <option value="${city.getCountry()}">TQ</option>
                        <option value="${city.getCountry()}">JP</option>
                    </select>
                </label>
            </td>
        </tr>
        <tr>
            <th></th>
            <td>
                <button type="submit" class="btn btn-outline-warning">Edit</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>

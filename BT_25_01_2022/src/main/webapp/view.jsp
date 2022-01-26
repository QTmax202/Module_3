<%--
  Created by IntelliJ IDEA.
  User: QT-247202
  Date: 25/01/2022
  Time: 2:07 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h1>All Student</h1>
<%--<div>--%>
<%--    <h1><a href="${pageContext.request.contextPath}/home?action=delete&id=${student.getId()}">Delete</a>--%>
<%--        Student</h1>--%>
<%--    <label>--%>
<%--        <input type="text" value="Search" name="search">--%>
<%--    </label>--%>
<%--    <input type="submit" value="Search" name="search">--%>
<%--</div>--%>
<c:if test="students.isEmpty()">
    <p style="color: red">Không có sản phẩn nào</p>
</c:if>
<div>
<button type="button" class="btn btn-outline-primary"><a href="${pageContext.request.contextPath}/home?action=createGet">Create new product</a></button>
<button type="button" class="btn btn-outline-secondary"><a href="${pageContext.request.contextPath}/home?action=sort">SORT</a></button>
<button type="button" class="btn btn-outline-secondary"><a href="${pageContext.request.contextPath}/home?action=great">SV>=8</a></button>
        <form action="${pageContext.request.contextPath}/home?action=search" method="post">
            <label>
                <input type="text" name="search-name">
                <button type="submit" class="btn btn-outline-info">Search</button>
            </label>
        </form>
    </div>
<table class="table table-success">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Address</th>
        <th>Avg</th>
        <th colspan="2"></th>
    </tr>
    <c:forEach items="${students}" var="student">
        <tr>
            <td>${student.getId()}</td>
            <td>${student.getName()}</td>
            <td>${student.getAge()}</td>
            <td>${student.getAddress()}</td>
            <td>${student.getAvg()}</td>
            <td><button type="button" class="btn btn-danger"><a href="${pageContext.request.contextPath}/home?action=delete&id=${student.getId()}">Delete</a></button></td>
            <td><button type="button" class="btn btn-success"><a href="${pageContext.request.contextPath}/home?action=editGet&id=${student.getId()}">Edit</a></button></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>

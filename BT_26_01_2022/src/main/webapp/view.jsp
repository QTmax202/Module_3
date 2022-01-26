<%--
  Created by IntelliJ IDEA.
  User: QT-247202
  Date: 26/01/2022
  Time: 2:01 CH
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
<h1>ALL CITYS</h1>
<c:if test="citys.isEmpty()">
    <p style="color: red">Không có thành phố nào</p>
</c:if>
<div>
    <button type="button" class="btn btn-outline-primary">
        <a href="${pageContext.request.contextPath}/city?action=createGet">Create new product</a>
    </button>
    <br>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Area</th>
            <th>Population</th>
            <th>GDP</th>
            <th>Country</th>
            <th colspan="2"></th>
        </tr>
        </thead>
        <%--@elvariable id="citys" type="java.util.List"--%>
        <c:forEach items="${citys}" var="city">
            <c:choose>
                <c:when test="${city.getGDP()<10000 || city.getPopulation() > 1000000}">
                    <tr class="table-danger">
                    <td >${city.getId()}</td>
                    <td >${city.getName()}</td>
                    <td >${city.getArea()}</td>
                    <td >${city.getPopulation()}</td>
                    <td >${city.getGDP()}</td>
                    <td >${city.getCountry()}</td>
                    <td>
                        <button type="button" class="btn btn-outline-danger">
                            <a href="${pageContext.request.contextPath}/city?action=delete&id=${city.getId()}">Delete</a>
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-success">
                            <a href="${pageContext.request.contextPath}/city?action=editGet&id=${city.getId()}">Edit</a>
                        </button>
                    </td>
                    </tr>
                </c:when>
<%--                <c:when test="${city.getGDP()<10000}">--%>
<%--                </c:when>--%>
                <c:otherwise>
                    <tr>
                    <td>${city.getId()}</td>
                    <td>${city.getName()}</td>
                    <td>${city.getArea()}</td>
                    <td>${city.getPopulation()}</td>
                    <td>${city.getGDP()}</td>
                    <td>${city.getCountry()}</td>
                    <td>
                        <button type="button" class="btn btn-outline-danger">
                            <a href="${pageContext.request.contextPath}/city?action=delete&id=${city.getId()}">Delete</a>
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-success">
                            <a href="${pageContext.request.contextPath}/city?action=editGet&id=${city.getId()}">Edit</a>
                        </button>
                    </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </table>
</div>
</body>
</html>

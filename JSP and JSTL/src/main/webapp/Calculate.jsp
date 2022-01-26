<%--
  Created by IntelliJ IDEA.
  User: QT-247202
  Date: 26/01/2022
  Time: 9:23 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>RESULT</h2>
<%
    float first = Float.parseFloat(request.getParameter("first"));
    float second = Float.parseFloat(request.getParameter("second"));
    String operator = request.getParameter("operator");
    float result;
    switch (operator) {
        case "plus":
            result = first + second;
            out.println(first+" + "+second+" = "+result);
            break;
        case "minus":
            result = first - second;
            out.println(first+" - "+second+" = "+result);
            break;
        case "multiply":
            result = first * second;
            out.println(first+" x "+second+" = "+result);
            break;
        case "division sign":
            result = first / second;
            out.println(first+" / "+second+" = "+result);
            break;
    }
%>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>index.html</title>

    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=GBK">

    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

</head>

<body>

<h1>就业城市管理</h1>
<hr/>

<h4>城市信息展示:</h4>
<hr/>

<c:forEach items="${requestScope.cities}" var="city">
    <ul>
        <li>城市名:${city.name}</li>
    </ul>
    <hr/>
</c:forEach>

<input type="button" value="添加城市" onclick="location.href='${pageContext.request.contextPath}/back/city/add.jsp'"/>

</body>
</html>

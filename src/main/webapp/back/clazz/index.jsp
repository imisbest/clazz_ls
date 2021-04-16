<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>index.jsp</title>

    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=GBK">

    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
</head>

<body>

<h1>班级管理</h1>
<hr/>


<h4>班级信息展示:</h4>
<hr/>

<c:forEach items="${requestScope.clazzes}" var="clazz">
    <ul>
        <li>班级名称:${clazz.name}</li>
        <li>班级标签:${clazz.tag.name}</li>
        <li>班级人数:${clazz.studentcounts}</li>
    </ul>
    <hr/>
</c:forEach>


<input type="button" value="添加班级" onclick="location.href='${pageContext.request.contextPath}/back/clazz/add.jsp'"/>

</body>
</html>

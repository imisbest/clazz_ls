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

<h1>系统主菜单</h1>
<hr/>

<ul>
    <li><a href="${pageContext.request.contextPath}/student/findAllStudents">学生管理</a></li>
    <li><a href="${pageContext.request.contextPath}/clazz/findAllClazzs">班级管理</a></li>
    <li><a href="${pageContext.request.contextPath}/group/findAllGroups">小组管理</a></li>
    <li><a href="${pageContext.request.contextPath}/tag/findAllTags">标签管理</a></li>
    <li><a href="${pageContext.request.contextPath}/city/findAllCitys">就业城市管理</a></li>
</ul>

</body>
</html>

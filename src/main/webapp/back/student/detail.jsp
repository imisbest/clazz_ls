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
    <style type="text/css">
        body {
            /* text-align: center; */
        }

        select {
            width: 173px;
        }
    </style>
</head>

<body>

<h1>学生详细信息展示</h1>
<hr/>


<ul>
    <li>学生姓名:${student.name}</li>
    <li>学生年龄:${student.age}</li>
    <li>学生班级:${student.clazz.name}</li>
    <li>学生小组:${student.group.name}</li>
    <li>学生就业城市:${student.city.name}</li>
    <li>学生标签:
        <c:forEach items="${student.tags}" var="tag">
            ${tag.name},
        </c:forEach>
    </li>
    <li>学生备注:
        ${student.mark}
    </li>
</ul>
<hr/>


</body>
</html>

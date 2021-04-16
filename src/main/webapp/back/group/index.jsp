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

<h1>小组管理</h1>
<hr/>


<h4>小组展示:</h4>
<hr/>

<c:forEach items="${requestScope.groups}" var="group">
    <ul>
        <li>小组id:${group.id}</li>
        <li>小组名称:${group.name}</li>
        <li>创建时间:<fmt:formatDate value="${group.createDate}"/></li>
        <li>所属班级:${group.clazz.name}</li>
        <li>目前标签:
            <c:forEach items="${group.tagNames}" var="name">
                ${name}、
            </c:forEach>
        </li>
    </ul>
    <hr/>
</c:forEach>

<input type="button" value="添加小组" onclick="location.href='${pageContext.request.contextPath}/back/group/add.jsp'"/>
</body>

</html>

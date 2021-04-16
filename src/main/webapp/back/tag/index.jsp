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

<h1>标签管理</h1>
<hr/>

<h4>标签信息展示:</h4>
<hr/>


<c:forEach items="${requestScope.tags}" var="tag">
    <ul>
        <li>标签名:${tag.name}</li>
        <li>创建时间:<fmt:formatDate value="${tag.createDate}"/></li>
        <li>是否是班级标签:
            <c:if test="${tag.type == '班级'}">
                <font color="red">是</font>
            </c:if>
            <c:if test="${tag.type != '班级'}">
                <font color="green">否</font>
            </c:if>
        </li>
    </ul>
    <hr/>
</c:forEach>


<input type="button" value="添加标签" onclick="location.href='${pageContext.request.contextPath}/back/tag/add.jsp'"/>
</body>
</html>

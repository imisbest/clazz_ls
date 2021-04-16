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
        table {
            border-right: 1px solid black;
            border-bottom: 1px solid black;
        }

        table td {
            width: 200px;
            text-align: center;
            border-left: 1px solid black;
            border-top: 1px solid black;
        }
    </style>
    <script src="${pageContext.request.contextPath}/back/statics/js/jquery-1.8.3.min.js"></script>
    <script>
        $(function () {


            //根据上一次搜索key将select中某一个option选中
            $("option[value='${param.searchKey}']").attr("selected", "selected");

            //绑定下载事件
            $("#btn").click(function () {
                var key = "${param.searchKey}";
                var value = "${param.searchValue}";
                location.href = "${pageContext.request.contextPath}/student/downloadInfo?searchKey=" + key + "&searchValue=" + value;
            });

        });
    </script>
</head>

<body>

<h1>学生管理</h1>
<hr/>

<div style="margin: 0 auto; width:500px; height:30px">
    <form action="${pageContext.request.contextPath}/student/findAllStudents">
        <select name="searchKey">
            <option value="stuName">姓名</option>
            <option value="clazzName">班级</option>
            <option value="tagName">标签</option>
        </select>
        <input type="text" placeholder="请输入查询条件" value="${param.searchValue}" name="searchValue"/>
        <input type="submit" value="搜索"/>
    </form>
</div>
<hr/>
<table border="0" cellspacing="0" cellpadding="0">
    <thead>
    <td>姓名</td>
    <td>年龄</td>
    <td>生日</td>
    <td>QQ</td>
    <td>Phone</td>
    <td>班级</td>
    <td>小组</td>
    <td>城市</td>
    <td>标签</td>
    <td>操作</td>
    </thead>
    <c:forEach items="${requestScope.students}" var="student">
        <tr>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td><fmt:formatDate value="${student.bir}"/></td>
            <td>${student.qq}</td>
            <td>${student.phone}</td>
            <td>${student.clazz.name}</td>
            <td>${student.group.name}</td>
            <td>${student.city.name}</td>
            <td>
                <c:forEach items="${student.tags}" var="tag">
                    ${tag.name}、
                </c:forEach>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/student/findOneStudentDetail?studentId=${student.id}">查看详细</a>|<a
                    href="${pageContext.request.contextPath}/student/deleteStudent?sid=${student.id}">删除</a>|<a
                    href="${pageContext.request.contextPath}/student/findOneStudent?studentId=${student.id}">修改</a></td>
        </tr>
    </c:forEach>
</table>

<hr/>
<a href="javascript:;" id="btn">导出学生信息</a>
<a href="${pageContext.request.contextPath}/back/student/add.jsp">添加学生信息</a>
</body>
</html>

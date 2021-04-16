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
            text-align: center;
        }

        select {
            width: 173px;
        }
    </style>
</head>

<body>

<h1>标签添加</h1>
<hr/>


<form action="${pageContext.request.contextPath}/tag/saveTag" method="post">
    标签名称:<input type="text" name="name"/><br/>
    标签类型:
    <select name="type">
        <option value="班级">班级</option>
        <option value="学生">学生</option>
    </select><br/>
    <input type="submit" value="提交"/>
    <input type="button" value="返回上级" onclick="history.go(-1);"/>
</form>


</body>
</html>

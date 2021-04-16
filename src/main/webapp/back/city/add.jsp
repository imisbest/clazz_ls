<%@page contentType="text/html; UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
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
    </style>
</head>

<body>

<h1>就业城市添加</h1>
<hr/>


<form action="${pageContext.request.contextPath}/city/saveCity" method="post">
    城市名称:<input type="text" name="name"/>
    <input type="submit" value="提交"/>
    <input type="button" value="返回上级" onclick="history.go(-1);"/>
</form>


</body>
</html>

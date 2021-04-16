<%@page contentType="text/html;UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>index.html</title>

    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=GBK">

    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
</head>

<body style="text-align: center;">

<h1>用户登陆</h1>

<form action="${pageContext.request.contextPath}/user/login" method="post">

    用户名:<input type="text" name="username"><br/><br/>

    密&nbsp;&nbsp;码:<input type="text" name="password"><br/><br/>

    验证码:<input type="text" name="code"><img src="${pageContext.request.contextPath}/user/getImageCode"/><br/><br/>

    <input type="submit" value="提交"/>

    <input type="button" value="注册"/>
</form>


</body>
</html>

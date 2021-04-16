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

<frameset rows="15%,*" noresize="noresize" border="1" bordercolor="red">
    <frame src="${pageContext.request.contextPath}/back/main/head.jsp">
    <frameset cols="10%,*">
        <frame src="${pageContext.request.contextPath}/back/main/menu.jsp">
        <frame name="aaa">
    </frameset>
</frameset>

<%--<body>
 <noframes></noframes>

</body>--%>

</html>

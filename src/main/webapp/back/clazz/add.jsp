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

        select {
            width: 173px;
        }
    </style>
    <script src="${pageContext.request.contextPath}/back/statics/js/jquery-1.8.3.min.js"></script>
    <script>

        $(function () {

            //页面加载完成之后立即发送ajax请求查询所有班级类型标签
            $.post("${pageContext.request.contextPath}/tag/findByTagTypeJSON", {"type": "班级"}, function (result) {
                //遍历
                $.each(result, function (i, tag) {
                    //创建option
                    var option = $("<option/>").val(tag.id).text(tag.name);
                    //添加option
                    $("#tagSelect").append(option);
                });
            }, "JSON");

        });
    </script>
</head>

<body>

<h1>班级添加</h1>
<hr/>


<form action="${pageContext.request.contextPath}/clazz/saveClazz" method="post">
    班级名称:<input type="text" name="name"/><br/>
    选择标签:
    <select name="tag.id" id="tagSelect">

    </select><br/><br/>
    <input type="submit" value="提交"/>
    <input type="button" value="返回上级" onclick="history.go(-1);"/>
</form>


</body>
</html>

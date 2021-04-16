<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>add.html</title>

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


            //页面加载完成之后,查询所有班级
            $.post("${pageContext.request.contextPath}/clazz/findAllClazzsJSON", function (result) {
                //遍历所有班级
                $.each(result, function (i, clazz) {
                    //创建option 给 value  和  text赋值
                    var option = $("<option/>").text(clazz.name).val(clazz.id);
                    $("#clazzSelect").append(option);
                });
            });

        });
    </script>
</head>

<body>

<h1>添加小组</h1>
<hr/>


<form action="${pageContext.request.contextPath}/group/saveGroup" method="post">
    小组名称:<input type="text" name="name"/><br/>
    选择班级:
    <select name="clazz.id" id="clazzSelect">
    </select><br/><br/>
    <input type="submit" value="提交"/>
    <input type="button" value="返回上级" onclick="history.go(-1);"/>
</form>


</body>
</html>

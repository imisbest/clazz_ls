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
            text-align: center;
        }

        select {
            width: 173px;
        }


    </style>
    <script src="${pageContext.request.contextPath}/back/statics/js/jquery-1.8.3.min.js"></script>
    <script>
        $(function () {


            //查询所有学生标签
            $.post("${pageContext.request.contextPath}/tag/findByTagTypeJSON", {"type": "学生"}, function (result) {
                //遍历学生类型标签集合
                $.each(result, function (i, tag) {
                    //创建input   type属性为checkbox  value为当前遍历标签对象的.id   标签的name属性名为 tags
                    var input = $("<input/>").val(tag.id).attr({"type": "checkbox", "name": "tagss"});
                    //在标签对象后插入标签文本
                    input.after(tag.name);
                    $("#tagSpan").append(input);
                });
            }, "JSON");


            //查询所有就业城市
            $.post("${pageContext.request.contextPath}/city/findAllCitysJSON", function (result) {
                //遍历所有就业城市
                $.each(result, function (i, city) {
                    var option = $("<option/>").val(city.id).text(city.name);
                    $("#citySelect").append(option);
                });
            }, "JSON");

            //查询所有班级
            $.post("${pageContext.request.contextPath}/clazz/findAllClazzsJSON", function (result) {
                //遍历所有班级信息
                $.each(result, function (i, clazz) {
                    var option = $("<option/>").val(clazz.id).text(clazz.name + "---(人数: " + clazz.studentcounts + ")");
                    //添加到下拉列表中
                    $("#clazzSelect").append(option);
                });
                $("#clazzSelect").change();
            }, "JSON");

            //班级改变根据班级id查询小组
            $("#clazzSelect").change(function () {
                //获取当前选中班级id
                var clazzId = $(this).val();
                //清空上一次小组信息
                $("#groupSelect").empty();
                //根据班级id查询小组
                $.post("${pageContext.request.contextPath}/group/findGroupsByClazzIdJSON", {clazzId: clazzId}, function (result) {
                    //获取当前班级id对应小组集合遍历
                    $.each(result, function (i, group) {
                        var option = $("<option/>").val(group.id).text(group.name);
                        $("#groupSelect").append(option);
                    });
                }, "JSON");
            });

        });
    </script>
</head>

<body>

<h1>学生信息录入</h1>
<hr/>


<form action="${pageContext.request.contextPath}/student/saveStudent" method="post">
    学生名称:<input type="text" name="name"/><br/>
    学生年龄:<input type="text" name="age"/><br/>
    学生生日:<input type="text" name="bir"/><br/>
    学生QQ:<input type="text" name="qq"/><br/>
    学生电话:<input type="text" name="phone"/><br/>
    学生班级:
    <select name="clazz.id" id="clazzSelect">
    </select><br/>
    学生小组:
    <select name="group.id" id="groupSelect">
    </select><br/>
    学生就业城市:
    <select name="city.id" id="citySelect">
    </select><br/>
    学生标签:
    <span id="tagSpan">

    </span><br/><br/>
    学生备注:
    <textarea name="mark" cols="30" rows="10">
        <font color="red">

        </font>
    </textarea><br/><br/>
    <input type="submit" value="提交"/>
    <input type="button" value="返回上级" onclick="history.go(-1);"/>
</form>


</body>
</html>

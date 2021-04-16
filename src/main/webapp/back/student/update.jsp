<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                //遍历所有学生类型标签
                $.each(result, function (i, tag) {
                    //遍历一次创建一个checkbox选项
                    var input = $("<input/>").val(tag.id).attr({"type": "checkbox", "name": "tagss"});
                    //判断哪些checkbox选项为学生原始标签
                    <c:forEach items="${student.tags}" var="studentTag">
                    //如果当前遍历的标签的id 等于 当前遍历学生信息中标签的id 一致
                    if (tag.id == "${studentTag.id}") {
                        input.attr("checked", "checked"); //如果相等设置选中
                    }
                    </c:forEach>
                    input.after(tag.name);
                    $("#tagSpan").append(input);
                });
            }, "JSON");


            //查询所有就业城市
            $.post("${pageContext.request.contextPath}/city/findAllCitysJSON", function (result) {
                //遍历所有就业城市信息
                $.each(result, function (i, city) {
                    //创建一个城市选项
                    var option = $("<option/>").val(city.id).text(city.name);
                    //当前遍历城市id等于 当前根据ID查询的学生信息中城市id一致
                    if (city.id == "${student.city.id}") {
                        option.attr("selected", "selected");
                    }
                    //城市信息添加
                    $("#citySelect").append(option);
                });
            }, "JSON");


            //查询所有班级
            $.post("${pageContext.request.contextPath}/clazz/findAllClazzsJSON", function (result) {
                //遍历所有班级
                $.each(result, function (i, clazz) {
                    //创建一个班级option
                    var option = $("<option/>").val(clazz.id).text(clazz.name + "---(人数: " + clazz.studentcounts + ")");
                    //如果当前遍历班级id 等于   后台根据id查询一个学生中班级对象的id一致
                    if (clazz.id == "${student.clazz.id}") {
                        option.attr("selected", "selected");
                    }
                    //追加上面
                    $("#clazzSelect").append(option);
                });
                //触发班级改变事件
                $("#clazzSelect").change();
            }, "JSON");


            //班级改变根据班级id查询小组
            $("#clazzSelect").change(function () {
                //获取当前默认选中班级id
                var clazzId = $(this).val();
                //清空上一次数据
                $("#groupSelect").empty();
                //根据班级id查询所有组
                $.post("${pageContext.request.contextPath}/group/findGroupsByClazzIdJSON", {clazzId: clazzId}, function (result) {
                    //遍历当前这个班下所有组
                    $.each(result, function (i, group) {
                        //创建组
                        var option = $("<option/>").val(group.id).text(group.name);
                        //当遍历组id 等于  当前查询学生信息的所在组对象的id一致
                        if (group.id == "${student.group.id}") {
                            option.attr("selected", "selected");
                        }
                        $("#groupSelect").append(option);
                    });
                }, "JSON");
            });


        });
    </script>
</head>

<body>

<h1>学生信息修改</h1>
<hr/>


<form action="${pageContext.request.contextPath}/student/updateStudent" method="post">
    <%--隐藏域--%>
    <input type="hidden" name="id" value="${student.id}"/>
    姓名:<input type="text" name="name" value="${student.name}"/><br/>
    年龄:<input type="text" name="age" value="${student.age}"/><br/>
    生日:<input type="text" name="bir" value="<fmt:formatDate value='${student.bir}' pattern="yyyy/MM/dd"/>"/><br/>
    qq:<input type="text" name="qq" value="${student.qq}"/><br/>
    phone:<input type="text" name="phone" value="${student.phone}"/><br/>
    学生班级:
    <select id="clazzSelect" name="clazz.id">
    </select><br/>
    学生小组:
    <select id="groupSelect" name="group.id">
    </select><br/>
    学生就业城市:
    <select id="citySelect" name="city.id">
    </select><br/>
    学生标签:
    <span id="tagSpan">

		</span>
    <br/><br/>
    学生备注:
    <textarea name="mark" cols="30" rows="10">
        ${student.mark}
    </textarea><br/><br/>
    <input type="submit" value="提交"/>
</form>


</body>
</html>

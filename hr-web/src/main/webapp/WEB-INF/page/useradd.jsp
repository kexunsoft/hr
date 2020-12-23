<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户添加</title>
    <link href="${pageContext.request.contextPath}/static/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all"/>
</head>

<body>
<form id="form1" action="javascript:save()" class="form-horizontal">


    <div class="col-lg-6">
        <div class="form-group">
            <label class="col-lg-4 control-label">用户名称<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" required type="text" name="uName"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">真实姓名<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" required type="text" name="trueName">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">用户密码<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" required type="text" name="uPassword">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">用户身份<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" required name="roleId">
                    <option value="">请选择</option>
                    <c:forEach items="${roles}" var="r">
                        <option value="${r.roleId}">${r.roleName}</option>
                    </c:forEach>
                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="col-lg-offset-5">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
            <button class="btn btn-success" type="submit">保存</button>
        </div>
    </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/static/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer_v2.1/layer/layer.js"></script>
<script>

    function save() {

        var formData = $("#form1").serialize();
        var i;
        $.ajax({
            url: "${pageContext.request.contextPath}/user/useradd",
            data: formData,
            type: "post",
            beforeSend: function () {
                //						layer.load()
                i = layer.msg('请稍后...', {
                    icon: 16,
                    shade: [0.5, '#f5f5f5'],
                    scrollbar: false,
                    offset: 'auto',
                    time: 10000
                });
            },
            success: function (data) {
                layer.close(i);
                if (data.code == 200) {
                    layer.msg(data.message, {
                            icon: 1,
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            window.location.href = "${pageContext.request.contextPath}/user/users";
                        }
                    )
                } else {
                    layer.msg(data.message, {
                            icon: 2,
                            time: 3000 //2秒关闭（如果不配置，默认是3秒）
                        }
                    )
                }


            }


        })


    }


</script>
</body>

</html>
<%@ page import="com.kexun.hr.model.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>薪酬标准登记</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/bootstrap/css/bootstrap.min.css"/>
</head>

<body>

<p></p>
<form id="form" action="javascript:save()" class="form-horizontal">

    <div class="col-lg-6">

        <c:if test="${s.size()==0}">
            <p>没有可设置的薪酬项目,你可以<a href="${pageContext.request.contextPath}/Salarystandarddetails/salarystandarddetailsadd">添加</a></p>
        </c:if>
        <p align="center">薪酬项目</p>

        <c:forEach items="${s}" var="s">
            <div class="form-group">
                <label class="col-lg-4 control-label">${s.itemname}<span
                        style="color: red;">&nbsp;</span></label>
                <div class="col-lg-5">
                    <input class="form-control" onkeyup="onlyNumber(this)" type="text" name="project" data="${s.itemid}"
                           value="0.0">
                </div>
            </div>
        </c:forEach>

    </div>
</form>
<form id="form1" action="javascript:save()" class="form-horizontal">
    <div class="col-lg-6">


        <div class="form-group">
            <label class="col-lg-4 control-label">薪酬总额<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" id="sum" value="0.0" readonly="readonly">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">薪酬标准名称<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" required="required" name="standardname">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">制定人<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" required="required" name="designer"
                       value="<%=((Users)session.getAttribute("user"))!=null?((Users)session.getAttribute("user")).getTrueName():"为登录"%>">
            </div>
        </div>


        <div class="form-group">
            <label class="col-lg-4 control-label">备注<span
                    style="color: red;">&nbsp;*</span></label></label>
            <div class="col-lg-5">
                <textarea class="form-control" name="remark" required></textarea>
            </div>
        </div>


        <div class="col-lg-offset-5">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
            <button class="btn btn-success" type="submit">保存</button>
        </div>

    </div>

    <br> <br>
</form>
<script src="${pageContext.request.contextPath}/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/layer_v2.1/layer/layer.js"></script>
<script>

    $(function () {
        var project = $("[name='project']");


        $.each(project, function (index, item) {

            $(item).keyup(function () {
                var sum = 0;
                $.each(project, function (index, i) {
                    if ($(i).val().length <= 0) {
                        sum += 0;
                    } else {
                        sum += parseFloat($(i).val());
                    }
                })
                $("#sum").val(sum);

            });
        });
    })

    function save() {

        var data = "";

        var project = $("[name='project']");

        data += "["


        for (var i = 0; i < project.length; i++) {
            var item = project[i];

            var input = $(item);

            var value = input.val().length > 0 ? input.val() : 0;

            var key = input.attr("data");


            data += '{"itemId":' + key + ',"salary":' + value + '}';

            if (i < project.length - 1) {

                data += ",";
            }

        }


        data += "]"

        var formData = $("#form1").serialize() + "&project=" + data;


        var i;
        $.ajax({
            url: "${pageContext.request.contextPath}/salarystandardController/registerSalary",
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
                            window.location.href = "${pageContext.request.contextPath}/salarystandardController/findNoChange";
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
        });
    }


    //限制输入数字

    function onlyNumber(obj) {
        var t = obj.value.charAt(0);
        obj.value = obj.value.replace(/[^\d\.]/g, '');
        obj.value = obj.value.replace(/^0\d[0-9]*/g, '');
        obj.value = obj.value.replace(/^\./g, '');
        obj.value = obj.value.replace(/\.{2,}/g, '.');
        obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
    }

</script>


</body>

</html>
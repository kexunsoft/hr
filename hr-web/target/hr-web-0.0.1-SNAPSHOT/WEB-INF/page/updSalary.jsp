<%@ page import="com.kexun.hr.model.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>薪酬复核</title>
    <script src="/hr/static/js/bootstrap/js/bootstrap.min.js"></script>
    <link href="/hr/static/js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>

<body>

<p></p>
<form id="form" action="javascript:save()" class="form-horizontal">

    <div class="col-lg-6">


        <c:forEach items="${s}" var="s">
            <div class="form-group">
                <label class="col-lg-4 control-label">${s.itemname}<span
                        style="color: red;">&nbsp;*</span></label>
                <div class="col-lg-5">
                    <input class="form-control" onkeyup="onlyNumber(this)" type="text" name="project" data="${s.itemid}"
                           value="${s.salary}">
                </div>
            </div>
        </c:forEach>

    </div>
</form>
<form id="form1" action="javascript:save()" class="form-horizontal">
    <div class="col-lg-6">
        <input type="hidden" value="${standard.standardid}" name="standardid">

        <div class="form-group">
            <label class="col-lg-4 control-label">薪酬总额<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" id="sum" value="${standard.salarysum}" readonly="readonly">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">薪酬标准名称<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" required="required" value="${standard.standardname}"
                       name="standardname">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">制定人<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" required="required" name="designer"
                       value="${standard.register}">
            </div>
        </div>


        <div class="form-group">
            <label class="col-lg-4 control-label">备注<span
                    style="color: red;">&nbsp;*</span></label></label>
            <div class="col-lg-5">
                <textarea class="form-control" name="remark" required>${standard.remark}</textarea>
            </div>
        </div>


        <div class="col-lg-offset-5">
            <button class="btn btn-default" type="button" onclick="history.back()">返回</button>
            <button class="btn btn-success" type="submit">提交</button>
        </div>

    </div>

    <br> <br>
</form>
</body>

<script src="/hr/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
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

            var value = input.val();

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
            url: "/hr/salarystandardController/updSalary",
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
                            window.location.href = "/hr/salarystandardController/findAllSalary";
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

        //得到第一个字符是否为负号
        var t = obj.value.charAt(0);
        //先把非数字的都替换掉，除了数字和.和-号
        obj.value = obj.value.replace(/[^\d\.]/g, '');
        //前两位不能是0加数字
        obj.value = obj.value.replace(/^0\d[0-9]*/g, '');
        //必须保证第一个为数字而不是.
        obj.value = obj.value.replace(/^\./g, '');
        //保证只有出现一个.而没有多个.
        obj.value = obj.value.replace(/\.{2,}/g, '.');
        //保证.只出现一次，而不能出现两次以上
        obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
        //如果第一位是负号，则允许添加
        // obj.value = obj.value.replace(/-/, '');
        // if (t == '-') {
        //     return;
        // }


    }

</script>


</html>
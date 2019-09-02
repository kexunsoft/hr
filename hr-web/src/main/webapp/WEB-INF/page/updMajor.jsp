<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset=utf-8"/>
    <title>职位发布登记</title>
    <link href="/hr/static/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="/hr/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="/hr/static/js/jquery/jQuery-2.2.0.min.js"></script>


</head>

<body>
<form action="javascript:update()" class="form-horizontal" id="form1">
    <input type="hidden" value="${major.mreId}" name="mreid">
    <div class="col-lg-6">
        <div class="form-group">
            <label class="col-lg-4 control-label">I级机构<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" readonly>
                    <option>${major.firstKindName}</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">II级机构<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" readonly>
                    <option>${major.secondKindName}</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">III级机构<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" readonly>
                    <option>${major.thirdKindName}</option>

                </select> <span class="help-block"></span>

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">招聘类型 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" name="engagetype">
                    <option value="">请选择</option>
                    <c:forEach items="${zps}" var="i">
                        <option value="${i.attributename}" ${i.attributename==major.engageType?"selected":""}>${i.attributename}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">职位分类<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" readonly>
                    <option>${major.majorKindName}</option>
                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">职位名称 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" readonly>
                    <option>${major.majorName}</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">招聘人数<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" value="${major.humanAmount}" name="humanamount" required="required"
                       pattern="^[0-9]*$">
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-4 control-label">截止日期<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input type="date" style="border: none" name="deadline" value="${major.deadline}" required="required">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">职位描述<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <textarea required="required" class="form-control"
                          name="majordescribe">${major.majorDescribe}</textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">招聘要求<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <textarea class="form-control" name="engagerequired">${major.engageRequired}</textarea>
            </div>
        </div>
        <div class="col-lg-offset-5">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
            <button class="btn btn-success" type="submit">保存</button>
        </div>
    </div>

    <!--<div class="col-lg-6">


    </div>-->

    <br> <br>
</form>

<script type="text/javascript" src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
<script>
    function update() {

        var formData = $("#form1").serialize();
        console.log(formData)

        var i;
        $.ajax({
            url: "/hr/engageMajorRelease/updMajor",
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
                            window.location.href = "/hr/engageMajorRelease/positions";
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
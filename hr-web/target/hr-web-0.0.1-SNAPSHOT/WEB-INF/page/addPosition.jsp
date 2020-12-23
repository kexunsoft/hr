<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset=utf-8"/>
    <title>职位发布登记</title>
    <link href="${pageContext.request.contextPath}/static/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery/jQuery-2.2.0.min.js"></script>

    <script>

        $(function () {
            /*发送查询一级机构请求*/
            $.get('${pageContext.request.contextPath}/Configfilefirstkind/findConfigfilefirstkind', function (data) {
                $.each(data, function (index, item) {
                    $("#oneji").append("<option value=" + item.firstkindid + ">" + item.firstkindname + "</option>")
                });
            });
            /*当一级机构发生选择改变时*/
            $("#oneji").change(function () {
                $("#twoji option:gt(0)").remove();
                $("#threeji option:gt(0)").remove();
                var oneid = $(this).val();
                $.get('${pageContext.request.contextPath}/Configfilesecondkind/findByFirstKindId', {'firstKindId': oneid}, function (data) {
                    $.each(data, function (index, item) {
                        $("#twoji").append("<option value=" + item.secondkindid + ">" + item.secondkindname + "</option>")
                    });

                })
            });
            /*当二级机构发生选择改变时*/
            $("#twoji").change(function () {
                $("#threeji option:gt(0)").remove();
                var twoid = $(this).val();
                $.get('${pageContext.request.contextPath}/Configfilethirdkind/findBysecondKindIdConfigfilethirdkind', {'secondkindid': twoid}, function (data) {
                    $.each(data, function (index, item) {
                        $("#threeji").append("<option value=" + item.thirdkindid + ">" + item.thirdkindname + "</option>")
                    });
                })
            })
            /*发送查询职位分类请求*/
            $.get('${pageContext.request.contextPath}/Configmajorkind/findConfigmajorkind', function (data) {
                $.each(data, function (index, item) {
                    $("#zwfl").append("<option value=" + item.majorkindid + ">" + item.majorKindName + "</option>")
                });
            })
            /*当职位选择发生改变时*/
            $("#zwfl").change(function () {
                $("#zwname option:gt(0)").remove();
                var flid = $(this).val();
                $.get('${pageContext.request.contextPath}/Configmajor/findByidMajorKindIdConfigmajor', {'majorKindId': flid}, function (data) {
                    $.each(data, function (index, item) {
                        $("#zwname").append("<option value=" + item.majorid + ">" + item.majorname + "</option>")
                    });
                })
            })
            /*查询招聘类型*/
            /*发送查询所有爱好的请求*/
            $.get('${pageContext.request.contextPath}/Configpublicchar/findConfigpubliccharXueli', {'attributekind': '招聘类型'}, function (data) {
                $.each(data, function (index, item) {
                    $("#ruitmenttype").append("<option value=" + item.attributename + ">" + item.attributename + "</option>")
                });
            })

        });

    </script>

</head>

<body>
<form id="form1" action="javascript:save()" class="form-horizontal">

    <div class="col-lg-6">
        <div class="form-group">
            <label class="col-lg-4 control-label">I级机构<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="oneji" required="required">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">II级机构<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="twoji" required="required">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">III级机构<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="threeji" required="required" name="thirdkindid">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">招聘类型 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="ruitmenttype" name="engagetype">
                    <option>请选择</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">职位分类<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="zwfl" required="required" >
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">职位名称 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="zwname" required name="majorid">
                    <option>请选择</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">招聘人数<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanamount" required="required" pattern="^[0-9]*$">
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-4 control-label">截止日期<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input type="date" style="border: none" name="deadline" required="required">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">职位要求<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <textarea class="form-control" required name="majordescribe"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">招聘要求<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <textarea class="form-control" required name="engagerequired"></textarea>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer_v2.1/layer/layer.js"></script>
<script>
    function save() {

        var formData = $("#form1").serialize();
        console.log(formData)

        var i;
        $.ajax({
            url: "${pageContext.request.contextPath}/engageMajorRelease/addPosition",
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
                            window.location.href = "${pageContext.request.contextPath}/engageMajorRelease/positions";
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
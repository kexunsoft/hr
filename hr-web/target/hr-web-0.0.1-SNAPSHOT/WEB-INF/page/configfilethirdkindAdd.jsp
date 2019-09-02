<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>III级机构添加</title>
    <link rel="stylesheet" href="/hr/static/layui/css/layui.css"/>
    <link href="/hr/static/js/bstable/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <link href="/hr/static/js/bstable/css/bootstrap-table.css"
          rel="stylesheet" type="text/css">
    <link href="/hr/static/css/table.css" rel="stylesheet" type="text/css"/>
    <script src="/hr/static/js/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
    <script type="text/javascript">

        $(function () {
            // /发送查询一级机构请求/
            $.get('/hr/Configfilefirstkind/findConfigfilefirstkind', function (data) {
                $.each(data, function (index, item) {
                    $("#oneji").append(
                        "<option value=" + item.firstkindid + ">"
                        + item.firstkindname + "</option>")
                });
            });
            // /当一级机构发生选择改变时/
            $("#oneji").change(function () {
                $("#twoji option:gt(0)").remove();
                $("#threeji option:gt(0)").remove();
                var oneid = $(this).val();
                $.get('/hr/Configfilesecondkind/findByFirstKindId', {
                    'firstKindId': oneid
                }, function (data) {
                    $.each(data, function (index, item) {
                        $("#twoji").append(
                            "<option value=" + item.secondkindid + ">"
                            + item.secondkindname
                            + "</option>")
                    });

                })
            });

        })

    </script>


</head>

<body>

<p></p>
<form id="form1" action="javascript:save()" class="form-horizontal">

    <div class="col-lg-8">

        <div class="form-group">
            <label class="col-lg-4 control-label">I级机构<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="oneji" required
                        name="firstkindid">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">II级机构<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="twoji" name="secondkindid" required>
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>


        <div class="form-group">
            <label class="col-lg-4 control-label">III级机构名称<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" value=""
                       name="thirdkindname" required>
            </div>
        </div>


        <div class="form-group">
            <label class="col-lg-4 control-label">销售责任人编号<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
					<textarea placeholder="多个编号之间请用'半角逗号'加'一个空格'隔开，如', '"
                              class="form-control" name="thirdkindsaleid" required></textarea>
            </div>
        </div>


        <div class="form-group">
            <label class="col-lg-4 control-label">是否为零售店<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5" style="line-height: 34px;">
                <input type="radio" value="是" checked ${configfilethird.thirdKindIsRetail=="是"?"checked":"" }
                       name="thirdkindisretail" class="radio-inline">是<input type="radio"
                                                                             value="否" ${configfilethird.thirdKindIsRetail=="否"?"checked":"" }
                                                                             name="thirdkindisretail"
                                                                             class="radio-inline">否
            </div>
        </div>


        <div class="col-lg-offset-5">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
            <button class="btn btn-success" type="submit">新增</button>
        </div>

    </div>


    <br> <br>
</form>
<script src="/hr/static/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
<script>
    function save() {

        var formData = $("#form1").serialize();
        var i;
        $
            .ajax({
                url: "/hr/Configfilethirdkind/configfilethirdkindadd",
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
                        layer
                            .msg(
                                data.message,
                                {
                                    icon: 1,
                                    time: 1000
                                    //2秒关闭（如果不配置，默认是3秒）
                                },
                                function () {
                                    window.location.href = "/hr/Configfilethirdkind/configfilethirdkindQueryAll";
                                })
                    } else {
                        layer.msg(data.message, {
                            icon: 2,
                            time: 3000
                            //2秒关闭（如果不配置，默认是3秒）
                        })
                    }

                }

            })

    }
</script>
</body>

</html>
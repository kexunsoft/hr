<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My JSP 'interview-resume.jsp' starting page</title>
    <link href="/hr/static/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="/hr/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/hr/static/layui/css/layui.css" media="all"/>

    <script src="js/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/bstable/js/jquery-2.2.0.min.js"></script>

    <script type="text/javascript">
        function search() {

            document.location.href = "interview-list.html";
        }
    </script>


</head>

<body>

<p></p>
<form id="form1" action="javascript:save()" class="form-horizontal">
    <input type="hidden" value="${cstCustomer.custNo }" name="cstCustomer.custNo">

    <div class="col-lg-8">

        <div class="form-group">
            <label class="col-lg-4 control-label">I级机构名称<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-3">
                <select class="form-control" name="" required="required">
                    <option value="">请选择I级机构名称</option>

                    <c:forEach items="${roles2}" var="cf">
                        <option value="firstkindid">
                                ${cf.firstkindname}
                        </option>

                    </c:forEach>

                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">II级机构名称<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" value="" required name="secondkindname">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">薪酬发放责任人编号<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <textarea placeholder="多个编号之间请用'半角逗号'加'一个空格'隔开，如', '" class="form-control" required
                          name="secondsalaryid"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">销售责任人编号<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <textarea placeholder="多个编号之间请用'半角逗号'加'一个空格'隔开，如', '" class="form-control" required
                          name="secondsaleid"></textarea>
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
        $.ajax({
            url: "/hr/Configfilesecondkind/configfilesecondkindadd",
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
                            window.location.href = "/hr/Configfilesecondkind/findByFirstKindQueryAll";
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
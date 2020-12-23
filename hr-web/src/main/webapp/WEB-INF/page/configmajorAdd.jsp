<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>职位新增</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"/>
    <link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap-table.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/table.css" rel="stylesheet"
          type="text/css"/>
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
            <label class="col-lg-4 control-label">职位分类<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">

                <select class="form-control" name="majorkindid" required="required" >
                    <option value="">请选择</option>

                    <c:forEach items="${roles}" var="ck">
                        <option value="${ck.majorkindid}">
                                ${ck.majorKindName}
                        </option>

                    </c:forEach>

                </select>
            </div>
        </div>


        <div class="form-group">
            <label class="col-lg-4 control-label">职位名称<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" required="required" value="" name="majorname">
            </div>
        </div>


        <div class="col-lg-offset-5">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
            <button class="btn btn-success" type="submit">新增</button>
        </div>

    </div>


    <br> <br>
</form>
<script src="${pageContext.request.contextPath}/static/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/js/layer_v2.1/layer/layer.js"></script>
<script>
    function save() {

        var formData = $("#form1").serialize();
        var i;
        $
            .ajax({
                url: "${pageContext.request.contextPath}/Configmajor/configmajorAdd",
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
                                    window.location.href = "${pageContext.request.contextPath}/Configmajor/configmajorQueryAll";
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
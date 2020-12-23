<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8"/>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css"/>
    <link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/table.css" rel="stylesheet" type="text/css"/>
    <style>
        .notice_nav a:nth-child(3) {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0
        }

        .notice_nav a:nth-child(4) {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px
        }
    </style>
</head>

<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="notice_main">
    <div class="notice_check">

        <div class="btn-group r_right">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/role/addRole">添加角色</a>
        </div>
        <div class="clear"></div>
    </div>
    <table id="table" class="table table-condensed table-bordered" style="margin: 0 auto">
        <tr>
            <th>
                角色编号
            </th>
            <th>
                角色名称
            </th>
            <th>
                角色说明
            </th>
            <th width="15%">
                操作
            </th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="r">
            <tr>
                <td>
                        ${r.roleId}
                </td>
                <td>
                        ${r.roleName}
                </td>
                <td>
                        ${r.roleDesc}
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/role/updRole?roleId= ${r.roleId}">修改</a>
                    <a href="javascript:del(${r.roleId})">删除</a>
                    <a href="${pageContext.request.contextPath}/role/allocationRight?roleId=${r.roleId}">分配权限</a>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>

<script src="${pageContext.request.contextPath}/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/layer_v2.1/layer/layer.js"></script>
<script type="text/javascript">

    function del(id) {
        layer.confirm('确定要删除这个角色吗?', {icon: 3, title: '提示'}, function (index) {

            var i;
            $.ajax({
                url: "${pageContext.request.contextPath}/role/delRole",
                data: {"roleId": id},
                type: "get",
                beforeSend: function () {
                    i = layer.msg('请稍后...', {
                        icon: 16,
                        shade: [0.5, '#f5f5f5'],
                        scrollbar: false,
                        offset: 'auto',
                        time: 10000
                    });
                },
                success: function (data) {
                    layer.close(i)
                    if (data.code == 200) {
                        layer.msg(data.message, {
                                icon: 1,
                                time: 1000 //2秒关闭（如果不配置，默认是3秒）
                            }, function () {
                                window.location.href = "${pageContext.request.contextPath}/role/roles";
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
            layer.close(index);
        });
    }
</script>
</body>

</html>
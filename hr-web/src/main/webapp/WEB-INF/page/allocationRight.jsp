<%--
  Created by IntelliJ IDEA.
  User: KEXUN
  Date: 2019/7/31
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/js/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-2.2.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer_v2.1/layer/layer.js"></script>
    <script>

        /*查询拥有的权限*/
        $(function () {
            $('#tt').tree({
                url: '${pageContext.request.contextPath}/right/findHaveRights?roleId=${roleId}'
            });
        })


        function sub() {

            var rightIds = "";

            var nodes = $('#tt').tree('getChecked');
            for (var i = 0; i < nodes.length; i++) {
                rightIds += nodes[i].id + "," + nodes[i].attributes.pId;
                if (i < nodes.length - 1) {
                    rightIds += ",";
                }
            }


            console.log(rightIds);
            var i;
            $.ajax({
                url: "${pageContext.request.contextPath}/role/allocationRight",
                data: {"rightIds": rightIds, "roleId": ${roleId}},
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

        }

    </script>
</head>
<body>
<button type="button" onclick="sub()">提交</button>

<ul id="tt" class="easyui-tree"
    data-options="checkbox:true"></ul>

</body>
</html>

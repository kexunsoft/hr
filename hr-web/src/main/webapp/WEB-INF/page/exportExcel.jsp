<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8"/>
    <title></title>
    <link href="/hr/static/js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/hr/static/css/table.css" rel="stylesheet" type="text/css"/>
    <script src="/hr/static/js/jquery/jQuery-2.2.0.min.js"></script>
    <script type="text/javascript" src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
    <link rel="stylesheet" href="/hr/static/layui/css/layui.css" media="all"/>
    <style>
        .notice_nav a:nth-child(3) {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0
        }

        .notice_nav a:nth-child(4) {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px
        }

        .t {
            background-color: whitesmoke;
        }

        td {
            text-align: left;
        }
    </style>

    <script>
        function change(obj) {
            window.location.href = "?tableName=" + obj.value;
        }

        var sign = true;

        function selectAll(obj) {
            var checkbox = $(":checkbox");

            if (sign) {
                checkbox.prop("checked", true);
                $(obj).text("取消");

            } else {
                checkbox.prop("checked", false);
                $(obj).text("全选")
            }

            sign = !sign;
        }

        function sub() {
            //获取选中的

            if ($("#f1 :checked").length == 0) {
                layer.msg("请选择要导出的字段");
            } else {
                $("#f1").submit();
            }


        }

    </script>
</head>

<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">

<div class="notice_main">
    <div class="notice_check">
        <div class="l_left">
            <form class="form-inline">

                <div class="form-group form-group-sm">
                    <label>数据表 </label>
                    <select class="form-control" name="tableName" onchange="change(this)">
                        <option value="">请选择</option>
                        <c:forEach items="${tables}" var="t">
                            <option value="${t.table_name}">${t.table_name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group form-group-sm">
                    <button class="btn btn-default btn-sm" type="button" onclick="selectAll(this)">
                        全选
                    </button>
                </div>
                <button class="btn btn-primary btn-sm" type="button" onclick="sub()"><span
                        class="glyphicon glyphicon-search"></span>
                    导出
                </button>
            </form>

        </div>
        <div class="btn-group r_right">
            <button class="btn btn-sm btn-default">返回</button>
        </div>
        <div class="clear"></div>
    </div>

    <form action="/hr/statement/executeExportExcel" method="post" id="f1">
        <input type="hidden" name="tableName" value="${tableName}">
        <table id="table" class="table table-condensed " style="margin: 0 auto">
            <tbody id="fields">
            <tr>
                <c:forEach items="${columns}" var="c" varStatus="i">
                <c:if test="${i.index%4==0&&i.index!=0}">
            </tr>
            <tr>
                </c:if>

                <td>
                    <input type="checkbox" value="${c.columnName}"
                           name="title"> ${c.columnComment==""?c.columnName:c.columnComment}
                </td>

                </c:forEach>
            </tbody>
        </table>
    </form>

</div>


</body>

</html>
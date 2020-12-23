<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8"/>
    <title></title>
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

        .t {
            background-color: whitesmoke;
            width: 20%;
        }

        td {
            color: black !important;
        }
    </style>
</head>

<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">

<div class="notice_main">
    <div class="notice_check">
        <div class="l_left">
            <p>发放薪酬 </p>
        </div>
        <div class="btn-group r_right">
            <a class="btn btn-sm btn-success">发放</a>
            <a class="btn btn-sm btn-default" href="javascript:history.back()">返回</a>
        </div>
        <div class="clear"></div>
    </div>
    <table class="table table-bordered table-condensed">

        <tr>
            <td class="t">员工档案编号</td>
            <td >${humanfile.humanId}</td>
        </tr>
        <tr>
            <td class="t">员工姓名</td>
            <td >${humanfile.humanName}</td>
        </tr>
        <tr class="t">

            <td>
                薪酬项目名称
            </td>
            <td  class="TD_STYLE1">
                金额
            </td>
        </tr>
        <c:forEach items="${salarystandarddetails}" var="s">

            <tr>
                <td class="t">
                        ${s.itemname}
                </td>
                <td colspan="4">
                        ${s.salary}
                </td>
            </tr>

        </c:forEach>
        <tr>
            <td class="t">奖励金额</td>
            <td colspan="3"><input type="text" width="100%" height="100%"></td>
        </tr>
        <tr>
            <td class="t">销售绩效总额</td>
            <td colspan="3"><input type="text" width="100%" height="100%"></td>
        </tr>
        <tr>
            <td class="t">应扣金额</td>
            <td colspan="3"><input type="text" width="100%" height="100%"></td>
        </tr>
        <tr>
            <td class="t">实发金额</td>
            <td colspan="3">1000.0</td>
        </tr>


    </table>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bstable/js/bootstrap.min.js"></script>
<script>

</script>
</body>

</html>
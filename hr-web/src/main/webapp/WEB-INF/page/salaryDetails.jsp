<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            <p>调动信息 </p>
        </div>
        <div class="btn-group r_right">
            <a class="btn btn-sm btn-success">打印</a>
            <a class="btn btn-sm btn-default" href="javascript:history.back()">返回</a>
        </div>
        <div class="clear"></div>
    </div>
    <table class="table table-bordered table-condensed">

        <tbody>
        <tr>
            <td class="t" width="12%">
                薪酬编号
            </td>
            <td width="15%">
                ${standard.standardid}
            </td>
            <td class="t" width="12%">
                薪酬标准名称
            </td>
            <td width="11%">
                ${standard.standardname}
            </td>
            <td class="t" width="11%">
                薪酬总额
            </td>
            <td width="17%">
                ${standard.salarysum}
            </td>
            <td class="t" width="12%">
                &nbsp;
            </td>
            <td width="10%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="t">
                制定人
            </td>
            <td>
                ${standard.register}
            </td>
            <td class="t">
                复核人
            </td>
            <td>
                ${standard.checker}
            </td>
            <td class="t">
                复核时间
            </td>
            <td>
                <fmt:formatDate value="${standard.checktime}" pattern="yyyy年MM月dd日"/>
            </td>
            <td class="t">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="t">
                备注
            </td>
            <td colspan="7" height="68">
                ${standard.remark}
            </td>
        </tr>
        <tr>
            <td class="t">
                序号
            </td>
            <td colspan="3" class="t">
                薪酬项目名称
            </td>
            <td colspan="4" class="t">
                金额
            </td>
        </tr>
        <c:forEach items="${s}" var="s">
            <tr>
                <td align="center">
                        ${s.itemid}
                </td>
                <td colspan="3">
                        ${s.itemname}
                </td>
                <td colspan="4">
                        ${s.salary}
                </td>
            </tr>
        </c:forEach>


        </tbody>


    </table>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bstable/js/bootstrap.min.js"></script>

</body>

</html>
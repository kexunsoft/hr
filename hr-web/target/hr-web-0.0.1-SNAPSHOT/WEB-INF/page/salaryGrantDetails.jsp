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
    </style>
</head>

<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="notice_main">
    <div class="notice_check">
        <div class="l_left">
            <p>薪酬单编号：${salaryGrantId} </p>
            <p>本机构总人数:${humanAmount} ，基本薪酬总数:${salaryStandardSum} </p>
        </div>
        <div class="btn-group r_right">
            <a class="btn btn-sm btn-success" href="javascript:save()">发放</a>
            <a class="btn btn-sm btn-default" href="javascript:history.back()">返回</a>
        </div>
        <div class="clear"></div>
    </div>


    <table id="table" class="table table-condensed table-bordered" style="margin: 0 auto">
        <tr>
            <th>序号</th>
            <th>档案编号</th>
            <th>姓名</th>
            <th>薪酬标准</th>
            <th>奖励金额</th>
            <th>销售绩效总额</th>
            <th>应扣金额</th>
            <th>实发金额</th>
        </tr>

        <c:forEach items="${salaryGrantDetails}" var="h" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${h.humanId}</td>
                <td>${h.humanName}</td>
                <td>${h.standardName}</td>
                <td>${h.bounsSum}</td>
                <td>${h.saleSum}</td>
                <td>${h.deductSum}</td>
                <td>${h.salaryPaidSum}</td>
            </tr>
        </c:forEach>

    </table>
</div>

<script src="${pageContext.request.contextPath}/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bstable/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer_v2.1/layer/layer.js"></script>
</body>
</html>
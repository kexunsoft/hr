<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8"/>
    <title></title>
    <link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/static/css/table.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/news.css" rel="stylesheet" type="text/css"/>
</head>

<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="news_main">
    <div class="l_left news_left">
        <h6>薪酬发放方式 </h6>
        <ul class="log_nav">
            <li  ${organization==1?"class='log_active'":""}><a href="?organization=1">一级机构发放方式</a></li>
            <li ${organization==2?"class='log_active'":""}><a href="?organization=2">二级机构发放方式</a></li>
            <li ${organization==3?"class='log_active'":""}><a href="?organization=3">三级机构发放方式</a></li>
        </ul>
    </div>
    <div class="l_left news_right">
        <h6>负责人控制</h6>
        <table id="table" class="table table-condensed table-bordered" style="margin: 0 auto">
            <tr>
                <th class="th_STYLE1" width="10%">
                    <span>序号</span>
                </th>
                <th class="th_STYLE1" width="40%">
                    <span>I级机构名称</span>
                </th>
                <th class="th_STYLE1" width="10%">
                    <span>人数</span>
                </th>
                <th class="th_STYLE1" width="10%">
                    基本薪酬总额(元)
                </th>
                <th class="th_STYLE1" width="10%">
                    登记
                </th>
            </tr>
            <c:forEach items="${list}" var="p" varStatus="i">
                <tr>
                    <td>
                            ${i.index+1}
                    </td>

                    <td>${p.organization}</td>

                    <td>
                            ${p.count}
                    </td>
                    <td>
                            ${p.salary}
                    </td>
                    <td>
                            <%--pid机构id p.organization机构名称 rank:级别--%>
                        <a href="${pageContext.request.contextPath}/salaryGrant/register?pid=${p.id}&organization=${p.organization}&count=${p.count}&salary=${p.salary}&rank=${organization}">登
                            记</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="clear"></div>

</div>
<script src="${pageContext.request.contextPath}/static/js/jquery/jQuery-2.2.0.min.js"></script>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8">
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
<script src="${pageContext.request.contextPath}/static/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/layer_v2.1/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        /*发送查询一级机构请求*/
        $.get('${pageContext.request.contextPath}/Configfilefirstkind/findConfigfilefirstkind',
            function (data) {
                $.each(data, function (index, item) {
                    $("#oneji").append(
                        "<option value=" + item.firstkindid + ">"
                        + item.firstkindname + "</option>")
                });
            });
        /*当一级机构发生选择改变时*/
        $("#oneji").change(
            function () {
                $("#twoji option:gt(0)").remove();
                $("#threeji option:gt(0)").remove();
                var oneid = $(this).val();
                $.get('${pageContext.request.contextPath}/Configfilesecondkind/findByFirstKindId', {
                    'firstKindId': oneid
                }, function (data) {
                    $.each(data, function (index, item) {
                        $("#twoji")
                            .append(
                                "<option value=" + item.secondkindid + ">"
                                + item.secondkindname
                                + "</option>")
                    });

                })
            });
        /*当二级机构发生选择改变时*/
        $("#twoji").change(
            function () {
                $("#threeji option:gt(0)").remove();
                var twoid = $(this).val();
                $
                    .get(
                        '${pageContext.request.contextPath}/Configfilethirdkind/findBysecondKindIdConfigfilethirdkind',
                        {
                            'secondkindid': twoid
                        },
                        function (data) {
                            $
                                .each(
                                    data,
                                    function (index,
                                              item) {
                                        $(
                                            "#threeji")
                                            .append(
                                                "<option value=" + item.thirdkindid + ">"
                                                + item.thirdkindname
                                                + "</option>")
                                    });
                        })
            })
    })


</script>
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="notice_main">
    <div class="notice_check">
        <div class="l_left">
            <form class="form-inline" action="">

                <div class="form-group form-group-sm">
                    <label>I级机构 </label>
                    <select class="form-control" id="oneji" name="firstKindId">
                        <option value="">请选择</option>
                    </select>
                </div>

                <div class="form-group form-group-sm">
                    <label>II级机构 </label>
                    <select class="form-control" id="twoji" name="secondKindId">
                        <option value="">请选择</option>
                    </select>
                </div>

                <div class="form-group form-group-sm">
                    <label>III级机构 </label>
                    <select class="form-control" id="threeji" name="thirdKindId">
                        <option value="">请选择</option>
                    </select>
                </div>

                <div class="form-group form-group-sm">
                    <label>建档时间 </label>
                    <input type="date" style="border-style: none" placeholder="起始时间" name="registTime"> -
                    <input type="date" style="border-style: none" placeholder="终止时间" name="registTimetwo">
                </div>

                <button class="btn btn-success btn-sm" type="submit"><span class="glyphicon glyphicon-search"></span>
                    查询
                </button>
            </form>
        </div>

        <!--<div class="notice_nav r_right">
            <a class="btn btn-default" onclick="addRole()"><span class="glyphicon glyphicon-plus"></span>新增</a>
            <a class="btn btn-default"><span class="glyphicon glyphicon-remove"></span>删除</a>
            <a class="btn btn-default" onclick="addRole()"><span class="glyphicon glyphicon-pencil"></span>编辑</a>
            <a class="btn btn-default" onclick="warrant()"><span class="glyphicon glyphicon-tag"></span>角色授权</a>
        </div>-->
        <div class="clear"></div>
    </div>
    <table id="table" class="table table-condensed table-bordered" style="margin: 0 auto">
        <tr height="21">
            <td width="19%">
                I级机构
            </td>
            <td width="19%">
                II级机构
            </td>
            <td width="19%">
                Ⅲ级机构
            </td>
            <td width="19%">
                薪酬标准
            </td>
            <td width="19%">
                名字
            </td>
            <td width="5%">
                调动
            </td>
        </tr>
        <c:forEach items="${pageinfo.list}" var="fth">
            <tr>
                <td>${fth.firstKindName }</td>
                <td>${fth.secondKindName }</td>
                <td>${fth.thirdKindName }</td>
                <td>${fth.standardName }</td>
                <td>${fth.humanName }</td>
                <td>
                    <a href="${pageContext.request.contextPath}/MajorChangeController/selectByPrimaryKeyMoreTable_diaodong?humanid=${fth.humanId }">调动</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="fixed-table-pagination" style="display: block;">
    <div class="pull-left pagination-detail">
			<span class="pagination-info">显示第 ${pageinfo.startRow } 到第
				${pageinfo.endRow }条记录，总共 ${pageinfo.total } 条记录</span><span
            class="page-list">每页显示 <span class="btn-group dropup"><button
            type="button" class="btn btn-default  dropdown-toggle"
            data-toggle="dropdown">
						<span class="page-size">${pageinfo.pageSize }</span> <span
            class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li class="active"><a href="javascript:void(0)">10</a></li>
						<li><a href="javascript:void(0)">25</a></li>
					</ul> </span> 条记录
			</span>
    </div>
    <div class="pull-right pagination">
        <ul class="pagination">


            <c:if test="${pageinfo.hasPreviousPage }">
                <li class="page-pre">
                    <a href="?page=${pageinfo.pageNum-1}"><</a>
                </li>
            </c:if>
            <c:if test="${!pageinfo.hasPreviousPage }">
                <li class="page-pre disabled">
                    <a href="?page=${pageinfo.pageNum}"><</a>
                </li>
            </c:if>

            <c:forEach items="${pageinfo.navigatepageNums }" var="vn">
                <c:if test="${vn==pageinfo.pageNum }">
                    <li class="page-number active"><a href="?page=${vn}">${vn }</a>
                    </li>
                </c:if>
                <c:if test="${vn!=pageinfo.pageNum }">
                    <li class="page-number"><a href="?page=${vn}">${vn }</a>
                    </li>
                </c:if>
            </c:forEach>

            <c:if test="${pageinfo.hasNextPage }">
                <li class="page-pre">
                    <a href="?page=${pageinfo.pageNum+1}">></a>
                </li>
            </c:if>
            <c:if test="${!pageinfo.hasNextPage }">
                <li class="page-pre disabled">
                    <a href="?page=${pageinfo.pageNum}">></a>
                </li>
            </c:if>
        </ul>
    </div>
</div>

</body>

</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8"/>
    <title>有效列表</title>
    <link href="/hr/static/js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/hr/static/js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="/hr/static/css/table.css" rel="stylesheet" type="text/css"/>
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
            <form class="form-inline" action="/hr/engageResume/effectiveResumeList">
                <div class="form-group form-group-sm">
                    <label>职位分类</label>
                    <select class="form-control" id="zwfl" name="majorKindId">
                        <option value="0">全部</option>
                    </select>
                    <select class="form-control" id="zwname" name="majorId">
                        <option value="0">全部</option>
                    </select>
                </div>
                <div class="form-group form-group-sm">
                    <label>关键字</label>
                    <input type="text" class="form-control" placeholder="关键字" name="keyword">
                </div>
                <div class="form-group form-group-sm">
                    <label>登记时间</label>
                    <input type="date" style="border: none;" placeholder="起始时间" name="startDate"> -
                    <input type="date" style="border: none;" placeholder="终止时间" name="endDate">
                </div>

                <button class="btn btn-success btn-sm" type="submit"><span
                        class="glyphicon glyphicon-search"></span>
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
        <tr>
            <th width="15%">
                档案编号
            </th>
            <th width="10%">
                姓名
            </th>
            <th width="10%">
                性别
            </th>
            <th width="15%">
                职位分类
            </th>
            <th width="10%">
                职位名称
            </th>
            <th width="10%">
                电话号码
            </th>
            <th width="10%">
                复核状态
            </th>
            <th width="10%">
                面试状态
            </th>
            <th width="10%">查看详情</th>
        </tr>
        <c:forEach items="${pageInfo.list}" var="r">
            <tr>
                <td>
                        ${r.resId}
                </td>
                <td>
                        ${r.humanName}
                </td>
                <td>
                        ${r.humanSex}
                </td>
                <td>
                        ${r.majorKindName}
                </td>
                <td>
                        ${r.majorName}
                </td>
                <td>
                        ${r.humanMobilephone}
                </td>
                <td>
                        ${r.checkStatus==0?"待复核":"通过"}
                </td>
                <td>
                        ${r.interviewStatus==0?"待面试":"推荐面试"}
                </td>
                <td><a href="/hr/engageResume/resumeInfo?resumeId=${r.resId}">查看详情</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="fixed-table-pagination" style="display: block;">
    <div class="pull-left pagination-detail">
			<span class="pagination-info">显示第 ${pageInfo.startRow } 到第
				${pageInfo.endRow }条记录，总共 ${pageInfo.total } 条记录</span><span
            class="page-list">每页显示 <span class="btn-group dropup"><button
            type="button" class="btn btn-default  dropdown-toggle"
            data-toggle="dropdown">
						<span class="page-size">${pageInfo.pageSize }</span> <span
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


            <c:if test="${pageInfo.hasPreviousPage }">
                <li class="page-pre">
                    <a href="?page=${pageInfo.pageNum-1}"><</a>
                </li>
            </c:if>
            <c:if test="${!pageInfo.hasPreviousPage }">
                <li class="page-pre disabled">
                    <a href="?page=${pageInfo.pageNum}"><</a>
                </li>
            </c:if>

            <c:forEach items="${pageInfo.navigatepageNums }" var="vn">
                <c:if test="${vn==pageInfo.pageNum }">
                    <li class="page-number active"><a href="?page=${vn}">${vn }</a>
                    </li>
                </c:if>
                <c:if test="${vn!=pageInfo.pageNum }">
                    <li class="page-number"><a href="?page=${vn}">${vn }</a>
                    </li>
                </c:if>
            </c:forEach>

            <c:if test="${pageInfo.hasNextPage }">
                <li class="page-pre">
                    <a href="?page=${pageInfo.pageNum+1}">></a>
                </li>
            </c:if>
            <c:if test="${!pageInfo.hasNextPage }">
                <li class="page-pre disabled">
                    <a href="?page=${pageInfo.pageNum}">></a>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<script src="/hr/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="/hr/static/js/bstable/js/bootstrap.min.js"></script>
<script>
    $(function () {
        /*发送查询职位分类请求*/
        $.get('/hr/Configmajorkind/findConfigmajorkind', function (data) {
            $.each(data, function (index, item) {
                $("#zwfl").append("<option value=" + item.majorkindid + ">" + item.majorKindName + "</option>")
            });
        })
        /*当职位选择发生改变时*/
        $("#zwfl").change(function () {
            $("#zwname option:gt(0)").remove();
            var flid = $(this).val();
            $.get('/hr/Configmajor/findByidMajorKindIdConfigmajor', {'majorKindId': flid}, function (data) {
                $.each(data, function (index, item) {
                    $("#zwname").append("<option value=" + item.majorid + ">" + item.majorname + "</option>")
                });
            })
        })

    })

</script>
</body>

</html>
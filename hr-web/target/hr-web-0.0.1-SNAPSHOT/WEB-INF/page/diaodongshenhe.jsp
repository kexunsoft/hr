<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
	<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html" ; charset="utf-8" />
		<title></title>
		<link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/static/css/table.css" rel="stylesheet" type="text/css" />
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

	<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
		<div class="notice_main">
			<div class="notice_check">
				<div class="l_left">
					<p>当前待复核的调动人数:1 例 </p>
				</div>
				<div class="clear"></div>
			</div>

			<table id="table" class="table table-condensed table-bordered" style="margin: 0 auto">
				<tr height="21">
					<th width="19%">
						I级机构
					</th>
					<th width="19%">
						II级机构
					</th>
					<th width="19%">
						Ⅲ级机构
					</th>
					<th width="19%">
						薪酬标准
					</th>
					<th width="19%">
						名字
					</th>
					<th width="5%">
						审核
					</th>
				</tr>
				<c:forEach items="${pageinfo.list }" var="ft">
					<tr>
						<td>${ft.firstKindName }</td>
						<td>${ft.secondKindName }</td>
						<td>${ft.thirdKindName }</td>
						<td>${ft.standardName }</td>
						<td>${ft.humanName }</td>
						<td><a href="${pageContext.request.contextPath}/MajorChangeController/selectByKeyMajorChangeck?mchId=${ft.mchId }">审核</a></td>
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
						<li class="page-pre" >
							<a href="?page=${pageinfo.pageNum-1}" ><</a>
						</li>
					</c:if>
					<c:if test="${!pageinfo.hasPreviousPage }">
						<li class="page-pre disabled" >
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
						<li class="page-pre" >
							<a href="?page=${pageinfo.pageNum+1}" >></a>
						</li>
					</c:if>
					<c:if test="${!pageinfo.hasNextPage }">
						<li class="page-pre disabled" >
							<a href="?page=${pageinfo.pageNum}">></a>
						</li>
					</c:if>
			</ul>
		</div>
	</div>
		
	</body>

</html>
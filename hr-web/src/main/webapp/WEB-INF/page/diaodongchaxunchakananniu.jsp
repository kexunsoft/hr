<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html" ; charset="utf-8" />
		<title></title>
		<link href="${pageContext.request.contextPath}/static/js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="/ht/static/js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">
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
			
			.t {
				background-color: whitesmoke;
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
					<a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
				</div>
				<div class="clear"></div>
			</div>

			<table id="table" class="table table-condensed table-bordered" style="margin: 0 auto">
				<tbody>
					<tr height="21">
						<td width="8%" class="t">
							档案编号
						</td>
						<td width="10%">
							${More.humanId }
						</td>
						<td width="8%" class="t">
							姓名
						</td>
						<td width="10%">
							${More.humanName }
						</td>
						<td width="8%">
						</td>
						<td width="10%">
						</td>
						<td width="8%">
						</td>
						<td width="10%">
						</td>
					</tr>
					<tr>
						<td width="8%" class="t">
							原一级机构
						</td>
						<td>
							${More.firstKindName }
						</td>
						<td width="8%" class="t">
							原二级机构
						</td>
						<td width="10%">
							${More.secondKindName }
						</td>
						<td width="8%" class="t">
							原三级机构
						</td>
						<td width="10%">
							${More.thirdKindName }
						</td>
						<td width="8%">
						</td>
						<td width="10%">
						</td>
					</tr>

					<tr>
						<td class="t">
							原职位分类
						</td>
						<td>
							${More.majorKindName }
						</td>
						<td width="12%" class="t">
							原职位名称
						</td>
						<td>
							${More.majorName }
						</td>
						<td class="t" class="t">
							原薪酬标准
						</td>
						<td>
							${More.standardName }
						</td>
						<td class="t">
							原薪酬总额
						</td>
						<td>
							${More.salarySum }
						</td>
					</tr>
					<tr>
						<td class="t">
							新一级机构名称
						</td>
						<td>
							${More.newfirstKindName }

						</td>
						<td width="12%" class="t">
							新二级机构名称
						</td>
						<td>
							${More.newsecondKindName }
						</td>
						<td width="12%" class="t">
							新三级机构名称
						</td>
						<td>
							${More.newthirdKindName }
						</td>
						<td width="8%">
						</td>
						<td width="10%">
						</td>
					</tr>
					<tr>
						<td class="t">
							新职位分类
						</td>
						<td>
							${More.newmajorKindName }
						</td>
						<td width="12%" class="t">
							新职位名称
						</td>
						<td>
							${More.newmajorName }
						</td>
						<td class="t">
							新薪酬标准
						</td>
						<td>
							${More.newstandardName }
						</td>
						<td class="t">
							新薪酬总额
						</td>
						<td>
							${More.newSalarySum }
						</td>
					</tr>

					<tr>
						<td class="t">
							登记人
						</td>
						<td>
							${More.register }
						</td>
						<td class="t">
							登记时间
						</td>
						<td>
							${More.registTime }
						</td>
						<td class="t">
							复核人
						</td>
						<td>
							${More.checker }
						</td class="t">
						<td>
							复核时间
						</td>
						<td>
							${More.checkTimes }
						</td>
					</tr>
					<tr>
						<td class="t">
							调动原因
						</td>
						<td colspan="7">
							${More.changeReason }
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>

</html>
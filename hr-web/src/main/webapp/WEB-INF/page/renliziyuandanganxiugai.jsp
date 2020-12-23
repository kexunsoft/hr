<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>人力资源档案登记</title>
<link href="${pageContext.request.contextPath}/static/css/index.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
</head>
<script src="${pageContext.request.contextPath}/static/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/layer_v2.1/layer/layer.js"></script>

<script>
	function update() {
		var formData = new FormData($("#formHumanfile")[0]);
		var i;
		$.ajax({
			url : '${pageContext.request.contextPath}/HumanFile/updateHumanfile',
			data : formData,
			contentType : false,
			processData : false,
			type : 'post',
			beforeSend : function() {
				i = layer.msg('请稍后....', {
					icon : 16,
					shade : [ 0.5, '#f5f5f5' ],
					scrollbar : false,
					offset : 'auto',
					time : 10000
				});
			},
			success : function(data) {
				layer.close(i);
				if (data.code == 200) {
					layer.msg(data.message, {
						icon : 1,
						time : 1000
					//2秒关闭（如果不配置，默认是3秒）
					}, function() {
						window.location.href="${pageContext.request.contextPath}/HumanFile/findMoreTableHumanfile"
					})
				} else {
					layer.msg(data.message, {
						icon : 2,
						time : 3000
					//2秒关闭（如果不配置，默认是3秒）
					})
				}
			}
		})
	}
</script>
<body>
	<form action="javascript:update()" id="formHumanfile"
		class="form-horizontal">

		<div class="col-lg-6">
			<input type="hidden" name="humanid" value="${hupdate.humanId }">
			<div class="form-group">
				<label class="col-lg-4 control-label">I级机构<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<input class="form-control" type="text" value="${hupdate.firstKindName }"
						name="firstkindid" disabled="disabled"> <span
						class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">II级机构<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<input class="form-control" type="text" value="${hupdate.secondKindName }"
						name="secondkindid" disabled="disabled"> <span
						class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">III级机构<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<input class="form-control" type="text" value="${hupdate.thirdKindName }"
						name="thirdkindid" disabled="disabled"> <span
						class="help-block"></span>

				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">职位分类<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<input type="text" class="form-control" disabled="disabled" value="${hupdate.majorKindName } ">
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">职位名称<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<input class="form-control" type="text" value="${hupdate.majorName }"
						name="humanmajorid" disabled="disabled"> <span
						class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">职称<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<select name="humanprodesignation" required="required" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${zc}" var="z">
							<option value="${z.attributename }" ${z.attributename ==hupdate.humanProDesignation?"selected":""}>${z.attributename }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">姓名<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<input class="form-control" type="text" required="required"
						value="${hupdate.humanName }" name="humanname">

				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">性别<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<select name="humansex" required="required" class="form-control">
						<option value="">请选择</option>
						<option value="男" ${hupdate.humanSex=="男"?"selected":"" }>男</option>
						<option value="女" ${hupdate.humanSex=="女"?"selected":"" }>女</option>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">EMAIL</label>
				<div class="col-lg-5">
					<input class="form-control" type="email"
						value="${hupdate.humanEmail }" name="humanemail">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">电话<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<input class="form-control" type="text" required="required"
						name="humantelephone"
						pattern="^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$"
						value="${hupdate.humanTelephone }">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">社会保障号码</label>
				<div class="col-lg-5">
					<input class="form-control" type="text"
						name="humansocietysecurityid"
						value="${hupdate.humanSocietySecurityId }">

				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">学历<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<select name="humaneducateddegree" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${xl}" var="z">
							<option value="${z.attributename }"
								${z.attributename ==hupdate.humanEducatedDegree?"selected":""}>${z.attributename }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">学历专业</label>
				<div class="col-lg-5">
					<select name="humaneducatedmajor" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${xlzy}" var="z">
							<option value="${z.attributename }"
								${z.attributename ==hupdate.humanEducatedMajor?"selected":""}>${z.attributename }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">开户银行</label>
				<div class="col-lg-5">
					<input class="form-control" type="text" name="humanbank"
						 value="${hupdate.humanBank }">

				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">特长</label>
				<div class="col-lg-5">
					<select name="humanspecility" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${tc}" var="z">
							<option value="${z.attributename }"
								${z.attributename ==hupdate.humanSpecility?"selected":""}>${z.attributename }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">个人履历<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<textarea class="form-control" rows="3" name="humanhistroyrecords"
						required="required">${hupdate.humanHistroyRecords }</textarea>

				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">备注</label>
				<div class="col-lg-5">
					<textarea class="form-control" rows="3" name="remark">${hupdate.remark }</textarea>

				</div>
			</div>

		</div>

		<div class="col-lg-6">

			<div class="form-group">
				<label class="col-lg-4 control-label">QQ</label>
				<div class="col-lg-5">
					<input class="form-control" type="text" name="humanqq"
						value="${hupdate.humanQq }">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">手机</label>
				<div class="col-lg-5">
					<input class="form-control" type="text" name="humanmobilephone"
						pattern="^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$" value="${hupdate.humanMobilephone }">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">住址</label>
				<div class="col-lg-5">
					<input class="form-control" type="text" name="humanaddress"
						value="${hupdate.humanAddress }">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">邮编</label>
				<div class="col-lg-5">
					<input class="form-control" type="text" name="humanpostcode"
						value="${hupdate.humanPostcode }">
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">国籍<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<select name="humannationality" required="required" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${gj}" var="z">
							<option value="${z.attributename }"
								${z.attributename ==hupdate.humanNationality?"selected":""}>${z.attributename }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">出生地</label>
				<div class="col-lg-5">
					<input class="form-control" type="text" name="humanbirthplace"
						value="${hupdate.humanBirthplace }">

				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">生日</label>
				<div class="col-lg-5">
					<input class="form-control" type="date" name="humanbirthday"
						value="${hupdate.humanBirthday }">

				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">民族</label>
				<div class="col-lg-5">
					<select name="humanrace" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${mz}" var="z">
							<option value="${z.attributename }"
								${z.attributename ==hupdate.humanRace?"selected":""}>${z.attributename }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">宗教信仰</label>
				<div class="col-lg-5">
					<select name="humanreligion" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${zjxy}" var="z">
							<option value="${z.attributename }"
								${z.attributename ==hupdate.humanReligion?"selected":""}>${z.attributename }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">政治面貌</label>
				<div class="col-lg-5">
					<select name="humanparty" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${zzmm}" var="z">
							<option value="${z.attributename }"
								${z.attributename ==hupdate.humanParty?"selected":""}>${z.attributename }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">身份证号码</label>
				<div class="col-lg-5">
					<input class="form-control" type="text" name="humanidcard"
						pattern="^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$" value="${hupdate.humanIdcard }">

				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">年龄<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<input class="form-control" type="text" name="humanage"
						required="required" value="${hupdate.humanAge }">

				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">教育年限<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<select name="humaneducatedyears" required="required" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${jynx}" var="z">
							<option value="${z.attributename }"
								${z.attributename ==hupdate.humanEducatedYears?"selected":""}>${z.attributename }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">薪酬标准<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<select name="itemname" required="required" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${xcname}" var="z">
							<option value="${z.itemid }"
								${z.itemid ==hupdate.salaryStandardId?"selected":""}>${z.itemname }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">银行账号</label>
				<div class="col-lg-5">
					<input class="form-control"  type="text"
						name="humanaccount" value="${hupdate.humanAccount }">

				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">爱好</label>
				<div class="col-lg-5">
					<select name="humanhobby" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${ah}" var="z">
							<option value="${z.attributename }"
								${z.attributename ==hupdate.humanHobby?"selected":""}>${z.attributename }</option>
						</c:forEach>
					</select>
					<span class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">家庭关系信息</label>
				<div class="col-lg-5">
					<textarea class="form-control" rows="3"
						name="humanfamilymembership">${hupdate.humanFamilyMembership }</textarea>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">照片<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-5">
					<img alt="" src="${hupdate.humanPicture }" width="200px" height="150px"> <input
						type="file" name="file" value="${hupdate.humanPicture }">
				</div>
			</div>

			<div class="col-lg-offset-5">
				<a class="btn btn-default" href="javascript:history.go(-1)">返回</a> <input
					class="btn btn-success" type="submit" value="修改"></input>
			</div>

		</div>

		</form>
</body>

</html>
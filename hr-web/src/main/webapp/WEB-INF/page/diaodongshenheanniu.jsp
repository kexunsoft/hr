<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">

	<head>
	<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="/hr/static/css/index.css" rel="stylesheet" type="text/css" />
		<link href="/hr/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="/hr/static/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
	</head>
<script src="/hr/static/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
<script>
    $(function() {
    	 /*发送查询一级机构请求*/
        $.get('/hr/Configfilefirstkind/findConfigfilefirstkind',
            function (data) {
                $.each(data, function (index, item) {
                	//绑定一级机构
                	if(item.firstkindid==${mc.firstKindId}){
                		$("#oneji").append("<option selected value=" + item.firstkindid + ">"+ item.firstkindname + "</option>")
                	}else{
                		$("#oneji").append("<option value=" + item.firstkindid + ">"+ item.firstkindname + "</option>")
                	}
                	
                });
            });
    	
    	//自动绑定二级机构
        $.get('/hr/Configfilesecondkind/findByFirstKindId', {
            'firstKindId': ${mc.firstKindId} 
        }, function (data) {
            $.each(data, function (index, item) {
            	if(item.secondkindid==${mc.secondKindId}){
            		$("#twoji").append("<option selected value=" + item.secondkindid + ">"+ item.secondkindname + "</option>")
            	}else{
            		$("#twoji").append("<option value=" + item.secondkindid + ">"+ item.secondkindname + "</option>")
            	}
            });

        })
        
        //自动绑定三级机构
        $.get('/hr/Configfilethirdkind/findBysecondKindIdConfigfilethirdkind',{ 'secondkindid': ${mc.secondKindId}},
             function (data) {
                 $.each(data,function (index,item) {
                	 if(item.thirdkindid==${mc.newThirdKindId}){
                		 $("#threeji").append("<option selected value=" + item.thirdkindid + ">" + item.thirdkindname + "</option>")
                	 }else{
                		 $("#threeji").append("<option value=" + item.thirdkindid + ">" + item.thirdkindname + "</option>")
                	 }
                      
                 });
             })
    	 
         
        /*当一级机构发生选择改变时*/
        $("#oneji").change(
            function () {
                $("#twoji option:gt(0)").remove();
                $("#threeji option:gt(0)").remove();
                var oneid = $(this).val();
                $.get('/hr/Configfilesecondkind/findByFirstKindId', {
                    'firstKindId': oneid
                }, function (data) {
                    $.each(data, function (index, item) {
                    	$("#twoji").append("<option value=" + item.secondkindid + ">"+ item.secondkindname + "</option>")
                    });

                })
            });
        /*当二级机构发生选择改变时*/
        $("#twoji")
            .change(
                function () {
                    $("#threeji option:gt(0)").remove();
                    var twoid = $(this).val();
                    $.get(
                            '/hr/Configfilethirdkind/findBysecondKindIdConfigfilethirdkind',
                            {
                                'secondkindid': twoid
                            },
                            function (data) {
                                $.each(data,function (index,item) {
		                             $("#threeji").append("<option selected value=" + item.thirdkindid + ">" + item.thirdkindname + "</option>")
                                 });
                            })
                })
        /*发送查询职位分类请求*/
        $.get('/hr/Configmajorkind/findConfigmajorkind', function (data) {
            $.each(data, function (index, item) {
            	//绑定职位分类参数
              	if(item.majorkindid==${mc.majorKindId}){
              		 $("#zwfl").append("<option selected value=" + item.majorkindid + ">"+ item.majorKindName + "</option>")
              	}else{
              		 $("#zwfl").append("<option value=" + item.majorkindid + ">"+ item.majorKindName + "</option>")
              	}
            });
        })
        
        //自动绑定职位名称
    	 $.get('/hr/Configmajor/findByidMajorKindIdConfigmajor', {
                    'majorKindId': ${mc.majorKindId}
                }, function (data) {
                    $.each(data, function (index, item) {
                    	if(item.majorid==${mc.newMajorId}){
                    		$("#zwname").append( "<option selected value=" + item.majorid + ">"+ item.majorname + "</option>")
                    	}else{
                    		$("#zwname").append( "<option value=" + item.majorid + ">"+ item.majorname + "</option>")
                    	}
                    });
           })
        
        /*当职位选择发生改变时查询对应的职位名称*/
        $("#zwfl").change(
            function () {
                $("#zwname option:gt(0)").remove();
                var flid = $(this).val();
                $.get('/hr/Configmajor/findByidMajorKindIdConfigmajor', {
                    'majorKindId': flid
                }, function (data) {
                    $.each(data, function (index, item) {
                    		$("#zwname").append( "<option value=" + item.majorid + ">"+ item.majorname + "</option>")
                    });
                })
            })
         
         //当薪酬标准发生选择变化改变薪酬总额
         $("#xcbz").change(function(){
        	 var standardId=$(this).val();
        	 if(standardId==""){
        		 $("#a").val(0)
        	 }else{
        		 $.get('/hr/MajorChangeController/selectByStandardIdsalarySum',{'standardId':standardId},function(data){
            		 $("#a").val(data)
            	 })
        	 }
         })
         
          //当薪酬标准发生选择变化改变薪酬总额
         $("#xcbz").change(function(){
        	 var standardId=$(this).val();
        	 if(standardId==""){
        		 $("#a").val(0)
        	 }else{
        		 $.get('/hr/MajorChangeController/selectByStandardIdsalarySum',{'standardId':standardId},function(data){
            		 $("#a").val(data)
            	 })
        	 }
         })
	})
</script>
<script>

    function sub() {

        var formData = $("#form1").serialize();
        var i;
        $.ajax({
            url: "/hr/MajorChangeController/updateByKeyMajorChangeck",
            data: formData,
            type: "post",
            beforeSend: function () {
                //						layer.load()
                i = layer.msg('请稍后...', {
                    icon: 16,
                    shade: [0.5, '#f5f5f5'],
                    scrollbar: false,
                    offset: 'auto',
                    time: 10000
                });
            },
            success: function (data) {
                layer.close(i);
                if (data.code == 200) {
                    layer.msg(data.message, {
                            icon: 1,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            window.location.href = "/hr/MajorChangeController/findByMajorChangeCheckStatusNo";
                        }
                    )
                } else {
                    layer.msg(data.message, {
                            icon: 2,
                            time: 3000 //2秒关闭（如果不配置，默认是3秒）
                        }
                    )
                }


            }


        })
    }
</script>
	<body>
		<form id="form1" action="javascript:sub()" class="form-horizontal">
			<!-- 调动表主键 -->
			<input type="hidden" value="${mc.mchId }" name="mchid">
			<!-- 人力资源id -->
			<input type="hidden" value="${mc.humanId }" name="humanid">
			<div class="col-lg-6">

				<div class="form-group">
					<label class="col-lg-4 control-label">档案编号  <span
									style="color: red;">&nbsp;*</span></label>
					<div class="col-lg-5">
						<p class="form-control-static">${mc.humanId }</p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-4 control-label">姓名   <span
									style="color: red;">&nbsp;*</span></label>
					<div class="col-lg-5">
						<p class="form-control-static">${mc.humanName }</p>
					</div>
				</div>

				<div class="form-group">
				<label class="col-lg-4 control-label">一级机构 <span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-3">
					<select class="form-control" id="oneji" required="required" name="firstkindid">
						<option value="">请选择</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-4 control-label">二级机构 <span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-3">
					<select class="form-control" required="required" id="twoji" name="secondkindid">
						<option value="">请选择</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">三级机构 <span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-3">
					<select class="form-control" id="threeji" required="required" name="newthirdkindid">
						<option value="">请选择</option>
					</select>
				</div>
			</div>

				<div class="form-group">
					<label class="col-lg-4 control-label">复合通过意见  <span
									style="color: red;">&nbsp;*</span></label>
					<div class="col-lg-5">
						<textarea class="form-control" name="checkreason"></textarea>
					</div>
				</div>

				<div class="col-lg-offset-5">
					<a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
					<button class="btn btn-success" type="submit" onclick="sub()">通过</button>
					<button class="btn btn-danger" type="button" onclick="sub()">不通过</button>
				</div>

			</div>

			<div class="col-lg-6">

				<div class="form-group">
				<label class="col-lg-4 control-label">职位分类 <span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-3">
					<select class="form-control" id="zwfl" required="required">
						<option value="">请选择</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-4 control-label">职位名称 <span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-3">
					<select class="form-control" id="zwname" required="required" name="newmajorid">
						<option value="">请选择</option>
					</select>
				</div>
			</div>

				<div class="form-group">
				<label class="col-lg-4 control-label">薪酬标准<span
					style="color: red;">&nbsp;*</span></label>
				<div class="col-lg-3">
					<select class="form-control" required="required" id="xcbz" name="newsalarystandardid">
						<option value="">请选择</option>
						<c:forEach items="${xcxm }" var="x">
							<option value="${x.standardid }" ${mc.newSalaryStandardId==x.standardid?"selected":"" }>${x.standardname }</option>
						</c:forEach>
					</select>
				</div>
			</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">薪酬总额 <span
									style="color: red;">&nbsp;*</span></label>
					<div class="col-lg-5">
						<p class="form-control-static">
							<input type="text" name="newsalarysum" value="${mc.newSalarySum }" readonly="readonly" id="a" style="border-style: none">
						</p>
					</div>
				</div>

				<div class="form-group">
					<label class="col-lg-4 control-label">调动原因 <span
									style="color: red;">&nbsp;*</span></label>
					<div class="col-lg-5">
						<textarea class="form-control" name="changereason" readonly="readonly">${mc.changeReason }</textarea>
					</div>
				</div>

			</div>

			<br> <br>
		</form>
	</body>
	

</html>
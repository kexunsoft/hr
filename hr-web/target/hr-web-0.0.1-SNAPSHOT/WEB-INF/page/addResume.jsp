<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset=utf-8"/>
    <title>简历登记</title>
    <link href="/hr/static/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="/hr/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="/hr/static/js/jquery/jQuery-2.2.0.min.js"></script>
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
            /*查询招聘类型*/
            $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {'attributekind': '招聘类型'}, function (data) {
                $.each(data, function (index, item) {
                    $("#ruitmenttype").append("<option value=" + item.attributename + ">" + item.attributename + "</option>")
                });
            })
        })
    </script>
</head>

<body>
<form id="form1" action="javascript:save()" class="form-horizontal">

    <div class="col-lg-6">
        <div class="form-group">
            <label class="col-lg-4 control-label">职位分类<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="zwfl" required="required">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">职位名称 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="zwname" required name="humanmajorid">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">招聘类型 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="ruitmenttype" name="engagetype">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">姓名<span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanname" required="required">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">性别 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <label class="radio-inline">
                    <input type="radio" name="humansex" checked value="男"> 男
                </label>
                <label class="radio-inline">
                    <input type="radio" name="humansex" value="女"> 女
                </label>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">EMAIL <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="email" name="humanemail">
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-4 control-label">电话 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" name="humantelephone" type="text">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">家庭电话 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" name="humanhomephone" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-4 control-label">手机 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanmobilephone"
                       pattern="^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$" required="required">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">住址 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanaddress">
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-4 control-label">邮编 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" name="humanpostcode" type="text">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">国籍 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" name="humannationality">
                    <option value="">请选择</option>
                    <c:forEach items="${gj}" var="g">
                        <option value="${g.attributename}">${g.attributename}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">出生地 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" name="humanbirthplace" type="text">
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-4 control-label">生日 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input style="border: none;" name="humanbirthday" type="date">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">民族 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-3">
                <select class="form-control" name="humanrace">
                    <option value="">请选择</option>
                    <c:forEach items="${mz}" var="m">
                        <option value="${m.attributename}">${m.attributename}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

    </div>

    <div class="col-lg-6">

        <div class="form-group">
            <label class="col-lg-4 control-label">宗教信仰 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" name="humanreligion">
                    <option value="">请选择</option>
                    <c:forEach items="${zjxy}" var="z">
                        <option value="${z.attributename}">${z.attributename}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-4 control-label">政治面貌 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" name="humanparty">
                    <option value="">请选择</option>
                    <c:forEach items="${zjmm}" var="m">
                        <option value="${m.attributename}">${m.attributename}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">身份证号码 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" name="humanidcard" type="text" required
                       pattern="^[0-9]*$">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">年龄 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanage" required="required" pattern="^[0-9]*$">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">毕业院校 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" name="humancollege" type="text">
            </div>
        </div>


        <div class="form-group">
            <label class="col-lg-4 control-label">教育年限 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" required name="humaneducatedyears">
                    <option value="">请选择</option>
                    <c:forEach items="${jynx}" var="j">
                        <option value="${j.attributename}">${j.attributename}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">学历专业 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <select class="form-control" required name="humaneducatedmajor">
                    <option value="">请选择</option>
                    <c:forEach items="${xl}" var="x">
                        <option value="${x.attributename}">${x.attributename}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">薪酬要求 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="demandsalarystandard"
                       pattern="^[0-9]*$" required>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">照片 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <img src="" id="img" style="width: 100px;height: 100px"/>
                <input type="file" name="file" id="file" accept="image/*" required>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">个人履历 <span
                    style="color: red;">&nbsp;*</span></label>
            <div class="col-lg-5">
                <textarea class="form-control" required name="humanhistoryrecords"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">备注 <span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <textarea class="form-control" name="remark"></textarea>
            </div>
        </div>
        <div class="col-lg-5 col-lg-offset-4">
            <button class="btn btn-success btn-block" type="submit">保存</button>
        </div>

    </div>

    <br> <br>
</form>
</body>
<script src="/hr/static/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
<script>
    $("#file").change(function () {

        var objurl = getObjectURL(this.files[0]);

        function getObjectURL(file) {
            var url = "";
            if (window.createObjectURL != undefined) {
                url = window.createObjectURL(file);
            } else if (window.URL != undefined) {
                url = window.URL.createObjectURL(file);
            } else if (window.webkitURL != undefined) {
                url = window.webkitURL.createObjectURL(file);
            }
            return url;
        }

        $("#img").attr("src", objurl);
    });

</script>

<script>

    function save() {
        var formData = new FormData($("#form1")[0]);
        var i;
        $
            .ajax({
                url: '/hr/engageResume/register',
                data: formData,
                contentType: false,
                processData: false,
                type: 'post',
                beforeSend: function () {
                    i = layer.msg('请稍后....', {
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
                        layer
                            .msg(
                                data.message,
                                {
                                    icon: 1,
                                    time: 1000
                                    //2秒关闭（如果不配置，默认是3秒）
                                },
                                function () {
                                    window.location.href = "/hr/engageResume/resumeFilterList"
                                })
                    } else {
                        layer.msg(data.message, {
                            icon: 2,
                            time: 3000
                            //2秒关闭（如果不配置，默认是3秒）
                        })
                    }
                }
            })
    }

</script>

</html>
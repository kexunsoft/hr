<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>人力资源档案登记</title>
    <link href="/hr/static/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="/hr/static/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"/>
</head>
<script src="/hr/static/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
<script>
    $(function () {
        // /发送查询一级机构请求/
        $.get('/hr/Configfilefirstkind/findConfigfilefirstkind',
            function (data) {
                $.each(data, function (index, item) {
                    $("#oneji").append(
                        "<option value=" + item.firstkindid + ">"
                        + item.firstkindname + "</option>")
                });
            });
        // /当一级机构发生选择改变时/
        $("#oneji").change(
            function () {
                $("#twoji option:gt(0)").remove();
                $("#threeji option:gt(0)").remove();
                var oneid = $(this).val();
                $.get('/hr/Configfilesecondkind/findByFirstKindId', {
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
        // /当二级机构发生选择改变时/
        $("#twoji")
            .change(
                function () {
                    $("#threeji option:gt(0)").remove();
                    var twoid = $(this).val();
                    $
                        .get(
                            '/hr/Configfilethirdkind/findBysecondKindIdConfigfilethirdkind',
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
        // / 发送查询职位分类请求 /
        $.get('/hr/Configmajorkind/findConfigmajorkind', function (data) {
            $.each(data, function (index, item) {
                $("#zwfl").append(
                    "<option value=" + item.majorkindid + ">"
                    + item.majorKindName + "</option>")
            });
        })
        // / 当职位选择发生改变时查询对应的职位名称 /
        $("#zwfl").change(
            function () {
                $("#zwname option:gt(0)").remove();
                var flid = $(this).val();
                $.get('/hr/Configmajor/findByidMajorKindIdConfigmajor', {
                    'majorKindId': flid
                }, function (data) {
                    $.each(data, function (index, item) {
                        $("#zwname").append(
                            "<option value=" + item.majorid + ">"
                            + item.majorname + "</option>")
                    });
                })
            })
        // / 发送查询所有职称请求 /
        $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {
            'attributekind': '职称'
        }, function (data) {
            $.each(data, function (index, item) {
                $("#zc").append(
                    "<option value=" + item.attributename + ">"
                    + item.attributename + "</option>")
            });
        })
        // / 发送查询所有学历的请求 /
        $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {
            'attributekind': '学历'
        }, function (data) {
            $.each(data, function (index, item) {
                $("#xl").append(
                    "<option value=" + item.attributename + ">"
                    + item.attributename + "</option>")
            });
        })
        // / 发送查询所有专业的请求 /
        $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {
            'attributekind': '学历专业'
        }, function (data) {
            $.each(data, function (index, item) {
                $("#xlzy").append(
                    "<option value=" + item.attributename + ">"
                    + item.attributename + "</option>")
            });
        })
        // / 发送查询所有特长的请求 /
        $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {
            'attributekind': '特长'
        }, function (data) {
            $.each(data, function (index, item) {
                $("#tc").append(
                    "<option value=" + item.attributename + ">"
                    + item.attributename + "</option>")
            });
        })
        // / 发送查询所有国籍的请求 /
        $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {
            'attributekind': '国籍'
        }, function (data) {
            $.each(data, function (index, item) {
                $("#guoji").append(
                    "<option value=" + item.attributename + ">"
                    + item.attributename + "</option>")
            });
        })
        // / 发送查询所有民族的请求 /
        $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {
            'attributekind': '民族'
        }, function (data) {
            $.each(data, function (index, item) {
                if (item.attributename == "汉族") {
                    $("#minzu").append("<option value=" + item.attributename + " selected>" + item.attributename + "</option>")
                } else {
                    $("#minzu").append("<option value=" + item.attributename + ">" + item.attributename + "</option>")
                }
            });
        })
        // / 发送查询所有宗教信仰的请求 /
        $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {
            'attributekind': '宗教信仰'
        }, function (data) {
            $.each(data, function (index, item) {
                if (item.attributename == "无") {
                    $("#zjxy").append("<option value=" + item.attributename + " selected>" + item.attributename + "</option>")
                } else {
                    $("#zjxy").append("<option value=" + item.attributename + ">" + item.attributename + "</option>")
                }

            });
        })
        // / 发送查询所有政治面貌的请求 /
        $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {
            'attributekind': '政治面貌'
        }, function (data) {
            $.each(data, function (index, item) {
                if (item.attributename == "群众") {
                    $("#zzmm").append("<option value=" + item.attributename + " selected>" + item.attributename + "</option>")
                } else {
                    $("#zzmm").append("<option value=" + item.attributename + ">" + item.attributename + "</option>")
                }
            });
        })
        // / 发送查询所有爱好的请求 /
        $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {
            'attributekind': '爱好'
        }, function (data) {
            $.each(data, function (index, item) {
                $("#like").append(
                    "<option value=" + item.attributename + ">" + item.attributename
                    + "</option>")
            });
        })
        // / 发送查询所有薪酬项目名的请求 /
        $.get('/hr/salarystandardController/findByCheckStatus', function (
            data) {
            $.each(data, function (index, item) {
                $("#xcname").append(
                    "<option value=" + item.standardid + ">" + item.standardname
                    + "</option>")
            });
        })

        // / 发送查询所有教育年限的请求 /
        $.get('/hr/Configpublicchar/findConfigpubliccharXueli', {
            'attributekind': '教育年限'
        }, function (data) {
            $.each(data, function (index, item) {
                $("#jynx").append(
                    "<option value=" + item.attributename + ">"
                    + item.attributename + "</option>")
            });
        })
    })
</script>

<script>
    function save() {
        var formData = new FormData($("#formHumanfile")[0]);
        var i;
        $.ajax({
            url: '/hr/HumanFile/insertHumanFile',
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
                                window.location.href = "/hr/HumanFile/findMoreTableHumanfile"
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
<body>
<form action="javascript:save()" id="formHumanfile"
      class="form-horizontal">

    <div class="col-lg-6">

        <div class="form-group">
            <label class="col-lg-4 control-label">I级机构<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="oneji"
                        name="firstkindid">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">II级机构<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="twoji" name="secondkindid">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">III级机构<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="threeji" name="thirdkindid">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">职位分类<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="zwfl">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">职位名称<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="zwname" name="humanmajorid">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">职称<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="zc"
                        name="humanprodesignation">
                    <option value="">请选择</option>
                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">姓名<span
                    style="color: red;">*&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text"
                       name="humanname" required>

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">性别<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <label class="radio-inline">
                    <input type="radio" checked name="humansex" value="男"> 男
                </label>
                <label class="radio-inline">
                    <input type="radio" name="humansex" value="女"> 女
                </label>

                <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">EMAIL</label>
            <div class="col-lg-5">
                <input class="form-control" type="email" name="humanemail">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">电话<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humantelephone"
                       pattern="^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">社会保障号码</label>
            <div class="col-lg-5">
                <input class="form-control" type="text"
                       name="humansocietysecurityid">

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">学历<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="xl"
                        name="humaneducateddegree">
                    <option value="">请选择</option>
                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">学历专业<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="xlzy"
                        name="humaneducatedmajor">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">开户银行<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanbank">

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">特长<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="tc"
                        name="humanspecility">
                    <option value="0">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">个人履历<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <textarea class="form-control" rows="3" name="humanhistroyrecords"></textarea>

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">备注</label>
            <div class="col-lg-5">
                <textarea class="form-control" rows="3" name="remark"></textarea>

            </div>
        </div>

    </div>

    <div class="col-lg-6">

        <div class="form-group">
            <label class="col-lg-4 control-label">QQ</label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanqq">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">手机<span
                    style="color: red;">*&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanmobilephone"
                       pattern="^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$" required>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">住址</label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanaddress">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">邮编</label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanpostcode">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">国籍<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="guoji"
                        name="humannationality">
                    <option value="0">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">出生地</label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanbirthplace">

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">生日</label>
            <div class="col-lg-5">
                <input class="form-control" type="date" name="humanbirthday">

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">民族<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="minzu"
                        name="humanrace">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">宗教信仰<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="zjxy"
                        name="humanreligion">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">政治面貌<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="zzmm"
                        name="humanparty">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">身份证号码<span
                    style="color: red;">*&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanidcard"
                       pattern="^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$"
                       required>

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">年龄<span
                    style="color: red;">*&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" pattern="^((1[0-5])|[1-9])?\d$" required name="humanage">
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">教育年限<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" name="humaneducatedyears" id="jynx">
                    <option value="">请选择</option>
                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">薪酬标准<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <select class="form-control" id="xcname"
                        name="salarystandardid">
                    <option value="">请选择</option>
                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">银行账号<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input class="form-control" type="text" name="humanaccount">

            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">爱好</label>
            <div class="col-lg-5">
                <select class="form-control" id="like"
                        name="humanhobby">
                    <option value="">请选择</option>

                </select> <span class="help-block"></span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">家庭关系信息</label>
            <div class="col-lg-5">
					<textarea class="form-control" rows="3"
                              name="humanfamilymembership"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-4 control-label">照片<span
                    style="color: red;">&nbsp;</span></label>
            <div class="col-lg-5">
                <input type="file" name="file" required>
            </div>
        </div>

        <div class="col-lg-offset-5">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a> <input
                class="btn btn-success" type="submit" value="提交"></input>
        </div>

    </div>

</form>
</body>

</html>
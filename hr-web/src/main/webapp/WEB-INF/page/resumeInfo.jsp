<%--
  Created by IntelliJ IDEA.
  User: KEXUN
  Date: 2019/8/5
  Time: 3:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="utf-8"/>
    <title></title>
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

        .t {
            background-color: whitesmoke;
        }

        td {
            color: black !important;
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
            <a class="btn btn-sm btn-success"
               href="javascript:execute(${resume.resId})">推荐面试</a>
            <a class="btn btn-sm btn-default" href="javascript:history.back()">返回</a>
        </div>
        <div class="clear"></div>
    </div>
    <table class="table table-bordered table-condensed">

        <tbody>
        <tr>
            <td class="t">
                职位分类
            </td>
            <td>
                ${resume.majorKindName}
            </td>
            <td class="t">
                职位名称
            </td>
            <td width="20%">
                ${resume.majorName}
            </td>
            <td class="t" width="11%">
                招聘类型
            </td>
            <td colspan="2">
                ${resume.engageType}
            </td>
            <td rowspan="6">
                <img src="${resume.humanPicture}" width="120px" height="180px">
            </td>
        </tr>
        <tr>
            <td class="t">
                姓名
            </td>
            <td>
                ${resume.humanName}
            </td>
            <td class="t">
                性别
            </td>
            <td>
                ${resume.humanSex}
            </td>
            <td class="t">
                EMAIL
            </td>
            <td colspan="2">
                ${resume.humanEmail}
            </td>
        </tr>
        <tr>
            <td class="t">
                电话
            </td>
            <td>
                ${resume.humanTelephone}
            </td>
            <td class="t">
                家庭电话
            </td>
            <td>
                ${resume.humanHomephone}
            </td>
            <td class="t">
                手机
            </td>
            <td colspan="2">
                ${resume.humanMobilephone}
            </td>
        </tr>
        <tr>
            <td class="t">
                住址
            </td>
            <td colspan="3">
                ${resume.humanAddress}
            </td>

            <td class="t">
                邮编
            </td>
            <td colspan="2">
                ${resume.humanPostcode}
            </td>
        </tr>

        <tr>
            <td class="t">
                国籍
            </td>
            <td>
                ${resume.humanNationality}
            </td>
            <td class="t">
                出生地
            </td>
            <td>
                ${resume.humanBirthplace}
            </td>
            <td class="t">
                生日
            </td>
            <td colspan="2" width="13%">
                ${resume.humanBirthday}
            </td>

        </tr>
        <tr>
            <td class="t" width="11%">
                民族
            </td>
            <td width="14%">
                ${resume.humanRace}
            </td>
            <td class="t">
                宗教信仰
            </td>
            <td>
                ${resume.humanReligion}
            </td>
            <td class="t">
                政治面貌
            </td>
            <td colspan="2">
                ${resume.humanParty}
            </td>


        </tr>
        <tr>
            <td class="t">
                身份证号码
            </td>
            <td>
                ${resume.humanIdcard}
            </td>
            <td class="t">
                年龄
            </td>
            <td>
                ${resume.humanAge}
            </td>
            <td class="t">
                毕业院校
            </td>
            <td>
                ${resume.humanCollege}
            </td>

            <td class="t">
                学历
            </td>
            <td>
                ${resume.humanEducatedDegree}
            </td>

        </tr>
        <tr>
            <td class="t">
                教育年限
            </td>
            <td>
                ${resume.humanEducatedYears}
            </td>
            <td class="t">
                学历专业
            </td>
            <td>
                ${resume.humanEducatedMajor}
            </td>

            <td class="t">
                薪酬要求
            </td>
            <td>
                ${resume.demandSalaryStandard}
            </td>
            <td class="t">
                注册时间
            </td>
            <td>
                ${resume.registTime}
            </td>

        </tr>

        <tr>
            <td class="t">
                个人履历
            </td>
            <td colspan="7">
                ${resume.humanHistoryRecords}
            </td>
        </tr>

        <tr>
            <td class="t">
                备注
            </td>
            <td colspan="7">
                ${resume.remark}
            </td>
        </tr>
        </tbody>

    </table>
</div>
<script src="/hr/static/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
<script>

    function execute(resId) {
        var i;
        $.ajax({
            url: '/hr/engageResume/recommendTheInterview',
            data: {"resid": resId},
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
                                window.location.href = "/hr/engageInterview/recommendedInterviewList";
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
</body>

</html>
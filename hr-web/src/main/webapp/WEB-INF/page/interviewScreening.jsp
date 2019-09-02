<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
               href="javascript:save()">建议录用</a>
            <a class="btn btn-sm btn-danger"
               href="javascript:del()">不录用</a>
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
                ${interview.majorKindName}
            </td>
            <td class="t">
                职位名称
            </td>
            <td width="20%">
                ${interview.majorName}
            </td>
            <td class="t" width="11%">
                招聘类型
            </td>
            <td colspan="2">
                ${interview.engageType}
            </td>
            <td rowspan="6">
                <img src="${interview.humanPicture}" width="120px" height="180px">
            </td>
        </tr>
        <tr>
            <td class="t">
                姓名
            </td>
            <td>
                ${interview.humanName}
            </td>
            <td class="t">
                性别
            </td>
            <td>
                ${interview.humanSex}
            </td>
            <td class="t">
                EMAIL
            </td>
            <td colspan="2">
                ${interview.humanEmail}
            </td>
        </tr>
        <tr>
            <td class="t">
                电话
            </td>
            <td>
                ${interview.humanTelephone}
            </td>
            <td class="t">
                家庭电话
            </td>
            <td>
                ${interview.humanHomephone}
            </td>
            <td class="t">
                手机
            </td>
            <td colspan="2">
                ${interview.humanMobilephone}
            </td>
        </tr>
        <tr>
            <td class="t">
                住址
            </td>
            <td colspan="3">
                ${interview.humanAddress}
            </td>

            <td class="t">
                邮编
            </td>
            <td colspan="2">
                ${interview.humanPostcode}
            </td>
        </tr>

        <tr>
            <td class="t">
                国籍
            </td>
            <td>
                ${interview.humanNationality}
            </td>
            <td class="t">
                出生地
            </td>
            <td>
                ${interview.humanBirthplace}
            </td>
            <td class="t">
                生日
            </td>
            <td colspan="2" width="13%">
                ${interview.humanBirthday}
            </td>

        </tr>
        <tr>
            <td class="t" width="11%">
                民族
            </td>
            <td width="14%">
                ${interview.humanRace}
            </td>
            <td class="t">
                宗教信仰
            </td>
            <td>
                ${interview.humanReligion}
            </td>
            <td class="t">
                政治面貌
            </td>
            <td colspan="2">
                ${interview.humanParty}
            </td>


        </tr>
        <tr>
            <td class="t">
                身份证号码
            </td>
            <td>
                ${interview.humanIdcard}
            </td>
            <td class="t">
                年龄
            </td>
            <td>
                ${interview.humanAge}
            </td>
            <td class="t">
                毕业院校
            </td>
            <td>
                ${interview.humanCollege}
            </td>

            <td class="t">
                学历
            </td>
            <td>
                ${interview.humanEducatedDegree}
            </td>

        </tr>
        <tr>
            <td class="t">
                教育年限
            </td>
            <td>
                ${interview.humanEducatedYears}
            </td>
            <td class="t">
                学历专业
            </td>
            <td>
                ${interview.humanEducatedMajor}
            </td>

            <td class="t">
                薪酬要求
            </td>
            <td>
                ${interview.demandSalaryStandard}
            </td>
            <td class="t">
                注册时间
            </td>
            <td>
                ${interview.registTime}
            </td>

        </tr>

        <tr>
            <td class="t">
                个人履历
            </td>
            <td colspan="7">
                ${interview.humanHistoryRecords}
            </td>
        </tr>

        <tr>
            <td class="t">
                备注
            </td>
            <td colspan="7">
                ${interview.remark}
            </td>
        </tr>
        <tr>

            <td colspan="8">面试登记</td>
        </tr>
        <form action="javascript:save()" id="form1">

            <tr>
                <td class="t">
                    面试次数
                </td>
                <td>
                    ${interview.interviewAmount}
                </td>
                <td class="t">
                    形象评价
                </td>
                <td>
                    ${interview.imageDegree}
                </td>
                <td class="t">
                    口才评价
                </td>
                <td>
                    ${interview.nativeLanguageDegree}
                </td>
                <td class="t">
                    外语口语能力
                </td>
                <td class="t">
                    ${interview.foreignLanguageDegree}
                </td>
            </tr>

            <tr>
                <td class="t">
                    应变能力
                </td>
                <td>
                    ${interview.responseSpeedDegree}
                </td>
                <td class="t">
                    EQ
                </td>
                <td>
                    ${interview.EQDegree}
                </td>
                <td class="t">
                    IQ
                </td>
                <td>
                    ${interview.IQDegree}
                </td>
                <td class="t">
                    综合素质
                </td>
                <td class="t">
                    ${interview.multiQualityDegree}
                </td>
            </tr>

            <tr>
                <td class="t">
                    面试评价
                </td>
                <td colspan="7">
                    ${interview.interviewComment}
            </tr>
        </form>
        </tr>
        </tbody>

    </table>
</div>
<script src="/hr/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
<script>
    function del() {

        layer.confirm('执行不录用,此简历将会被删除,确定要继续操作吗?', {icon: 3, title: '提示'}, function (index) {

            var i;
            $.ajax({
                url: "/hr/engageInterview/interviewResult?state=0&resumeId=${interview.resumeId}&einId=${interview.einId}",
                type: "get",
                beforeSend: function () {
                    i = layer.msg('请稍后...', {
                        icon: 16,
                        shade: [0.5, '#f5f5f5'],
                        scrollbar: false,
                        offset: 'auto',
                        time: 10000
                    });
                },
                success: function (data) {
                    layer.close(i)
                    if (data.code == 200) {
                        layer.msg(data.message, {
                                icon: 1,
                                time: 1000 //2秒关闭（如果不配置，默认是3秒）
                            }, function () {
                                window.location.href = "/hr/engageInterview/interviewScreeningList";
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
            layer.close(index);
        });
    }

    function save() {
        var i;
        $.ajax({
            url: "/hr/engageInterview/interviewResult?state=1&resumeId=${interview.resumeId}&einId=${interview.einId}",
            type: "get",
            beforeSend: function () {
                i = layer.msg('请稍后...', {
                    icon: 16,
                    shade: [0.5, '#f5f5f5'],
                    scrollbar: false,
                    offset: 'auto',
                    time: 10000
                });
            },
            success: function (data) {
                layer.close(i)
                if (data.code == 200) {
                    layer.msg(data.message, {
                            icon: 1,
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            window.location.href = "/hr/engageInterview/interviewScreeningList";
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
        layer.close(index);
    }

</script>
</body>

</html>
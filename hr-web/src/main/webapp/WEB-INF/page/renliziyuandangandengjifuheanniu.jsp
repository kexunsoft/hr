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
<script src="/hr/static/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
<script type="text/javascript">
    function update() {
        var i;
        $.ajax({
            url: '/hr/HumanFile/updateByPrimaryKeySelective?humanid=${h.humanId}',
            type: 'get',
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
                                window.location.href = '/hr/HumanFile/findMoreTableHumanfile';
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
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">

<div class="notice_main">
    <div class="notice_check">
        <div class="l_left">
            <p>调动信息 </p>
        </div>
        <div class="btn-group r_right">
            <c:if test="${xq=='yes' }">
                <a class="btn btn-sm btn-success" href="javascript:update()">确认复核</a>
            </c:if>
            <a class="btn btn-sm btn-default" href="javascript:history.back()">返回</a>
        </div>
        <div class="clear"></div>
    </div>
    <table width="100%" border="1" cellpadding=3 cellspacing=1
           bordercolorlight=#848284 bordercolordark=#eeeeee
           class="table table-bordered table-condensed">
        <tr>
            <td class="t" width="10%">
                档案编号
            </td>
            <td colspan="6" class="t">
                ${h.humanId }
            </td>
            <td rowspan="6" width="13%" style="text-align: center;">
                <img src="${h.humanPicture }" style="width:120px;height:150px;"/>
            </td>
        </tr>
        <tr>
            <td class="t" width="10%">
                I级机构
            </td>
            <td width="13%" class="">
                ${h.firstKindName }
            </td>
            <td width="10%" class="t">
                II级机构
            </td>
            <td width="13%" class="">
                ${h.secondKindName }
            </td>
            <td width="10%" class="t">
                III级机构
            </td>
            <td class="" colspan="2" width="2%">
                ${h.thirdKindName }
            </td>
        </tr>
        <tr>
            <td class="t">
                职位分类
            </td>
            <td class="">
                ${h.majorKindName }
            </td>
            <td class="t">
                职位名称
            </td>
            <td class="">
                ${h.majorName }
            </td>
            <td class="t">
                职称
            </td>
            <td colspan="2" class="">
                ${h.humanProDesignation }
            </td>
        </tr>
        <tr>
            <td class="t">
                姓名
            </td>
            <td class="">
                ${h.humanName }
            </td>
            <td class="t">
                性别
            </td>
            <td class="">
                ${h.humanSex }
            </td>
            <td class="t">
                EMAIL
            </td>
            <td colspan="2" class="">
                ${h.humanEmail }
            </td>
        </tr>
        <tr>
            <td class="t">
                电话
            </td>
            <td class="">
                ${h.humanTelephone }
            </td>
            <td class="t">
                QQ
            </td>
            <td class="">
                ${h.humanQq }
            </td>
            <td class="t">
                手机
            </td>
            <td colspan="2" class="">
                ${h.humanMobilephone }
            </td>
        </tr>
        <tr>
            <td class="t">
                住址
            </td>
            <td colspan="3" class="">
                ${h.humanAddress }
            </td>
            <td class="t">
                邮编
            </td>
            <td colspan="2" class="">
                ${h.humanPostcode }
            </td>
        </tr>
        <tr>
            <td class="t">
                国籍
            </td>
            <td class="">
                ${h.humanNationality }
            </td>
            <td class="t">
                出生地
            </td>
            <td class="">
                ${h.humanBirthplace }
            </td>
            <td class="t">
                生日
            </td>
            <td width="13%" class="">
                ${h.humanBirthday }
            </td>
            <td width="10%" class="t">
                民族
            </td>
            <td class="">
                ${h.humanRace }
            </td>
        </tr>
        <tr>
            <td class="t">
                宗教信仰
            </td>
            <td class="">
                ${h.humanReligion }
            </td>
            <td class="t">
                政治面貌
            </td>
            <td class="">
                ${h.humanParty }
            </td>
            <td class="t">
                身份证号码
            </td>
            <td class="">
                ${h.humanIdcard }
            </td>
            <td class="t">
                社会保障号码
            </td>
            <td class="">
                ${h.humanSocietySecurityId }
            </td>
        </tr>
        <tr>
            <td class="t">
                年龄
            </td>
            <td class="">
                ${h.humanAge }
            </td>
            <td class="t">
                学历
            </td>
            <td class="">
                ${h.humanEducatedDegree }
            </td>
            <td class="t">
                教育年限
            </td>
            <td class="">
                ${h.humanEducatedYears }
            </td>
            <td class="t">
                学历专业
            </td>
            <td class="">
                ${h.humanEducatedMajor }
            </td>
        </tr>
        <tr>
            <td class="t">
                薪酬标准
            </td>
            <td class="">
                ${h.standardName }
            </td>
            <td class="t">
                开户银行
            </td>
            <td class="">
                ${h.humanBank }
            </td>
            <td class="t">
                银行卡号
            </td>
            <td class="">
                ${h.humanAccount }
            </td>

        </tr>
        <tr>
            <td class="t">
                特长
            </td>
            <td class="">
                ${h.humanSpecility }
            </td>
            <td class="t">
                爱好
            </td>
            <td class="">
                ${h.humanHobby }
            </td>
            <td class="t">
                &nbsp;
            </td>
            <td class="t">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="t">
                档案附件
            </td>
            <td colspan="7" class="">
                ${h.attachmentName }
            </td>
        </tr>
        <tr>
            <td class="t">
                个人履历
            </td>
            <td colspan="7" class="">
                ${h.humanHistroyRecords }
            </td>
        </tr>
        <tr>
            <td class="t">
                家庭关系信息
            </td>
            <td colspan="7" class="">
                ${h.humanFamilyMembership }
            </td>
        </tr>
        <tr>
            <td class="t">
                备注
            </td>
            <td colspan="7" class="">
                ${h.remark }
            </td>
        </tr>
    </table>
</div>
<script src="/hr/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="/hr/static/js/bstable/js/bootstrap.min.js"></script>
<script>

</script>
</body>

</html>
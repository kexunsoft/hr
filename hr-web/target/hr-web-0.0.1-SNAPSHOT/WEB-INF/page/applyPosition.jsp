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
               href="/hr/engageMajorRelease/register?engageType=${major.engageType}&majorKindId=${major.majorKindId}&majorKindName=${major.majorKindName}&majorId=${major.majorId}&majorName=${major.majorName}">确认申请</a>
            <a class="btn btn-sm btn-default" href="javascript:history.back()">返回</a>
        </div>
        <div class="clear"></div>
    </div>
    <table class="table table-bordered table-condensed">

        <tbody>
        <tr>
            <td class="t" width="11%">
                I级机构
            </td>
            <td width="14%">
                ${major.firstKindName}
            </td>
            <td class="t" width="11%">
                II级机构
            </td>
            <td width="14%">
                ${major.secondKindName}
            </td>
            <td class="t" width="11%">
                III级机构
            </td>
            <td>
                ${major.thirdKindName}
            </td>
            <td class="t" width="11%">
                招聘类型
            </td>
            <td colspan="2">
                ${major.engageType}
            </td>
        </tr>
        <tr>
            <td class="t">
                职位分类
            </td>
            <td>
                ${major.majorKindName}
            </td>
            <td class="t">
                职位名称
            </td>
            <td>
                ${major.majorName}
            </td>
            <td class="t">
                招聘人数
            </td>
            <td>
                ${major.humanAmount}

            </td>
            <td class="t">
                截止日期
            </td>
            <td>
                ${major.deadline}
            </td>
        </tr>
        <tr>
            <td class="t">
                登记人
            </td>
            <td>
                ${major.register}
            </td>
            <td class="t">
                登记时间
            </td>
            <td>
                ${major.registTime}
            </td>

            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>

        </tr>
        <tr>
            <td class="t">
                职位描述
            </td>
            <td colspan="8">
                ${major.majorDescribe}
            </td>

        </tr>
        <tr>
            <td class="t">
                招聘要求
            </td>
            <td colspan="8">
                ${major.engageRequired}
            </td>

        </tr>
        </tbody>


    </table>
</div>
<script src="/hr/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="/hr/static/js/bstable/js/bootstrap.min.js"></script>
<script>

</script>
</body>

</html>
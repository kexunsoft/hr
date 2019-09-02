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
    </style>
</head>

<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="notice_main">
    <div class="notice_check">
        <div class="l_left">
            <p>薪酬单编号：${salaryGrantId} </p>
            <p>机构： ${organization} </p>
            <p>本机构总人数:${count} ，基本薪酬总数:${salary} </p>
        </div>
        <div class="btn-group r_right">
            <a class="btn btn-sm btn-success" href="javascript:save()">发放</a>
            <a class="btn btn-sm btn-default" href="javascript:history.back()">返回</a>
        </div>
        <div class="clear"></div>
    </div>


    <table id="table" class="table table-condensed table-bordered" style="margin: 0 auto">
        <tr>
            <th>序号</th>
            <th>档案编号</th>
            <th>姓名</th>
            <th>薪酬标准</th>
            <th>奖励金额</th>
            <th>销售绩效总额</th>
            <th>应扣金额</th>
            <th>实发金额</th>
        </tr>

        <c:forEach items="${humanfile}" var="h" varStatus="i">
            <tr name="salaryData">
                <td name="index">${i.index+1}</td>
                <td>${h.humanId}</td>
                <td>${h.humanName}</td>
                <td data="${h.standardId}" salarySum="${h.salarySum}" id="s${h.humanId}">${h.standardName}</td>
                <td><input type="text" width="100%" id="j${h.humanId}" onkeyup="math(${h.humanId},this)"></td>
                <td><input type="text" width="100%" id="x${h.humanId}" onkeyup="math(${h.humanId},this)"></td>
                <td><input type="text" width="100%" id="k${h.humanId}" onkeyup="math(${h.humanId},this)"></td>
                <td id="h${h.humanId}">${h.salarySum}</td>
            </tr>
        </c:forEach>

    </table>
</div>

<script src="/hr/static/js/jquery/jQuery-2.2.0.min.js"></script>
<script src="/hr/static/js/bstable/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/hr/static/js/layer_v2.1/layer/layer.js"></script>
</body>

<script>


    function math(id, obj) {

        onlyNumber(obj);

        //计算
        var sum = 0;
        //得到当前的薪酬项目总额
        var s = parseFloat($("#s" + id).attr("salarySum").length == 0 ? 0 : $("#s" + id).attr("salarySum"));

        //得到奖励
        var j = parseFloat($("#j" + id).val().length == 0 ? 0 : $("#j" + id).val());

        //销售绩效总额
        var x = parseFloat($("#x" + id).val().length == 0 ? 0 : $("#x" + id).val());

        //应扣金额
        var k = parseFloat($("#k" + id).val().length == 0 ? 0 : $("#k" + id).val());


        sum = s + j + x - k;

        $("#h" + id).text(sum);

    }

    function onlyNumber(obj) {
        var t = obj.value.charAt(0);
        obj.value = obj.value.replace(/[^\d\.]/g, '');
        obj.value = obj.value.replace(/^0\d[0-9]*/g, '');
        obj.value = obj.value.replace(/^\./g, '');
        obj.value = obj.value.replace(/\.{2,}/g, '.');
        obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
    }


    function save() {
        var tr = $("[name='salaryData']");

        var json = "";
        json += "[";
        $.each(tr, function () {

            //员工编号
            var humanId = $($(this).children("td").get(1)).text();
            //薪酬标准编号
            var standardId = $($(this).children("td").get(3)).attr("data");

            //薪酬项目
            var salarySum = $($(this).children("td").get(3)).attr("salarySum");

            //奖励
            var award = $($($(this).children("td").get(4)).children("input").get(0)).val().length == 0 ? 0 : $($($(this).children("td").get(4)).children("input").get(0)).val();
            //销售绩效
            var performance = $($($(this).children("td").get(5)).children("input").get(0)).val().length == 0 ? 0 : $($($(this).children("td").get(5)).children("input").get(0)).val();

            var deduct = $($($(this).children("td").get(6)).children("input").get(0)).val().length == 0 ? 0 : $($($(this).children("td").get(6)).children("input").get(0)).val();

            json += '{"humanId":' + humanId + ',"salaryGrantId":"${salaryGrantId}","salaryStandardSum":' + salarySum + ',"bounsSum":' + award + ',"saleSum":' + performance + ',"deductSum":' + deduct + '},';

        })
        json += "]";


        var firstkindId = 0;

        var secoundkindId = 0;

        var thirdkindId = 0;

        var rank =${rank};
        if (rank == 1) {
            firstkindId =${organizationId};
        }
        if (rank == 2) {
            secoundkindId =${organizationId};
        }
        if (rank == 3) {
            thirdkindId =${organizationId};
        }


        var salaryGrant = '{"salaryGrantId":"${salaryGrantId}","humanAmount":"${count}" ,"salaryStandardSum":${salary},"firstkindId":' + firstkindId + ',"secondkindid":' + secoundkindId + ',"thirdkindId":' + thirdkindId + '}';


        var i;
        $.ajax({
            url: "/hr/salaryGrant/payoff",
            data: {"salaryGrant": salaryGrant, "salaryGrantDetails": json},
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
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            window.location.href = "/hr/salaryGrant/noCheck";
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

</html>
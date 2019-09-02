/**
 * Created by Administrator on 2017/6/12.
 */
var currentID;
function goodsLoad(){
    $('#table').bootstrapTable({
        method: "get",
        url: "url",
        striped: true,
        singleSelect: false,
        dataType: "json",
        pagination: true, //分页
        pageSize: 10,
        pageNumber: 1,
        search: false, //显示搜索框
        contentType: "application/x-www-form-urlencoded",
        queryParams: queryParams,
        sidePagination: "server", //服务端请求
        columns: [

            {
                checkbox: "true",
                field: 'ID',
                align: 'center',
                valign: 'middle'
            },
            {
                title: "编号",
                field: 'Id',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '消息标题',
                field: 'Title',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '发布人',
                field: 'SendPeople',
                align: 'center'
            },
            {
                title: '发送时间',
                field: 'SendTime',
                align: 'center',
                formatter: function (value, row) {
                    return formatDateTime(value);
                }
            },
            {
                title: '推送对象',
                field: 'TargetPeoplesUI',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '是否自动推送',
                field: 'IsAutoUI',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '推送内容',
                field: 'SendContent',
                align: 'center'
            },
            {
                title: '操作',
                field: '',
                align: 'center',
                formatter: function (value, row) {
                    var e = '<button button="#" mce_href="#" onclick="del(\'' + row.Id + '\')">删除</button> '
                    var d = '<button button="#" mce_href="#" onclick="edit(\'' + row.Id + '\')">查看详情</button> ';
                    return e + d;
                }
            }
        ]
    });
}

function queryParams(params) {
    return {
        page: params.pageNumber,
        rows: params.limit,//页码大小
        order: params.order,
        sort: params.sort,
        SendPeople: $("#person").val(),
        Title: $("#tit").val(),
        BeginSendTime: $("#beginSendTime").val(),
        EndSendTime: $("#endSendTime").val()
    };
}

//数据的查询
function checkPersonData() {
    $("#table").bootstrapTable('refresh');
}

//数据的删除
function del(id){
    if(confirm("你确定要删除吗？")){
        var personId = id;
        $.ajax({
            url: '/OAMessagePush/Delete?Ids=' + personId,
            type: 'post',
            dataType: 'json',
            success: function (result) {
                var result = handleError(result);
                if (result.IsError) {
                    return;
                }
                else {
                    checkPersonData();
                }
            }
        })
    }

}


//批量数据的删除
function delAll(){
    var idArray = $('#table').bootstrapTable('getSelections');
    if(idArray == null || idArray.length ==0){
        alert("请选择你要删除的类容!");
        return false;
    }else {
        var personID = [];
        for(var i=0;i<idArray.length;i++){
            personID.push(idArray[i].id);
        }
        //$.each(idArray, function (index, row) {
        //    personID.push(row.Id);
        //});
        if(confirm("删除将无法恢复，你确定删除吗？")){
            $.ajax({
                url: '/OAMessagePush/Delete?Ids=' + personID.join(","),
                type: 'post',
                dataType: 'json',
                success: function (result) {
                    var result = handleError(result);
                    if (result.IsError) {
                        return;
                    }
                    else {
                        checkPersonData();
                    }
                }
            })
        }
    }


}


function add() {
    openlayer();
    currentID = "";
}
//编辑操作
function edit(id) {
    currentID = id;
    openlayer01()
}

function openlayer() {
    layer.open({
        type: 2,
        title: '添加信息',
        shade: 0.5,
        skin: 'layui-layer-rim',
        area: ['98%', '90%'],
        shadeClose: true,
        closeBtn: 1,
        content: 'OAMessagePushTail'
    });
}
function openlayer01() {
    layer.open({
        type: 2,
        title: '添加信息',
        shade: 0.5,
        skin: 'layui-layer-rim',
        area: ['98%', '90%'],
        shadeClose: true,
        closeBtn: 1,
        content: 'OAMessagePushTail01'
    });
}

//取消操作
function cancel() {
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}





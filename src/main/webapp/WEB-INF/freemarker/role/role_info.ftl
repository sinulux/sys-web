<div class="table-responsive" style="margin: 15px auto">
    ${ctx}${springMacroRequestContext.getRequestUri()}
    <div id="toolBtn" style="margin-bottom: 5px">
        <button type="button" class="btn btn-default" onclick="save()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
        </button>
        <button type="button" class="btn btn-danger" onclick="batchDel()">
            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
        </button>
        <button type="button" class="btn btn-default" style="float: right" onclick="$('#key').val('');loadList()">
            <span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>显示全部
        </button>
        <button type="button" class="btn btn-default" style="float: right" onclick="loadList()">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
        </button>
        <input style="width:300px;float: right" type="text" class="form-control" id="key" name="key" placeholder="编码/名称" />
    </div>
    <table id="dataGrid" class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="text-center"><input type="checkbox" name="checkAll"></th>
            <th>编码</th>
            <th>角色名称</th>
            <th>创建人</th>
            <th>创建时间</th>
            <th>描述</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody></tbody>
        <tfoot>
        <tr>
            <td colspan="7" align="center">
                <div id="pagination"></div>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
<script>
    var pageIndex = 1,pageSize = 10;
    var winIndex;
    var grid = $("#dataGrid tbody");
    $(function() {
        loadList();
        formValid();
        checkedAll();
    });

    function checkedAll(){
        $("input[name=checkAll]").click(function(){
            if(this.checked){
                $("input[name=check]").attr("checked",'true');//全选
            }else{
                $("input[name=check]").removeAttr("checked");//取消全选
            }
        });
    }

    function getChecks(){
        var ids = [];
        $("input[name=check]").each(function(index,el){
            if(el.checked){
                ids.push(parseInt(el.value));
            }
        });
        return ids;
    }

    function batchDel(){
        var ids = getChecks();
        if(ids.length == 0){
            layer.msg("请选择一条记录",{icon:7,shade: 0.01,time:1000});
            return;
        }
        console.log(ids);
        layer.confirm('是否确定删除选择的所有记录？', {
            icon:3,
            btn: ['确定','取消'] //按钮
        }, function(){
            try {
                $.post("/menu/batchDelBtn", {ids: ids}, function (result) {
                    if (result.status == 1) {
                        layer.msg(result.desc, {icon: 1, shade: 0.01, time: 1000}, function (index) {
                            layer.close(index);
                            loadList();
                        });
                    } else {
                        layer.msg(result.desc, {icon: 2, shade: 0.01, time: 1000});
                    }
                });
            }catch(e){
                layer.msg(e, {icon: 2, shade: 0.01, time: 1000});
            }
        }, function(){
        });
    }

    function loadList(){
        var loadIndex = layer.msg('加载中', {
            icon: 16
            ,shade: 0.01
        });
        $.post(
                "/menu/btn_list",
                {
                    pageIndex:pageIndex,
                    pageSize:pageSize,
                    menuId:selectNode.id,
                    key:$("#key").val()
                },
                function(result){
                    layer.close(loadIndex);
                    if(result.total == 0){
                        grid.empty().append(
                                '<tr><td class="text-danger text-center" colspan="7">暂无数据</td></tr>'
                        );
                    }else{
                        var list = result.data;
                        var tr = '';
                        for(var i = 0; i < list.length; i ++){
                            tr += '<tr>';
                            tr += '<td class="text-center"><input type="checkbox" name="check" value="'+ list[i].RID +'"></td>';
                            tr += '<td>' + list[i].CODE + '</td>';
                            tr += '<td>' + list[i].NAME + '</td>';
                            tr += '<td>' + list[i].BTN_URL + '</td>';
                            tr += '<td>' + list[i].REMARK + '</td>';
                            tr += '<td>' +
                                    '<a class="text-warning" href="javascript:save(' + list[i].RID + ',1)">\n' +
                                    '   <span class="glyphicon glyphicon-pencil btn-xs" aria-hidden="true"></span>修改\n' +
                                    '</a>' +
                                    '<a class="text-info" href="javascript:view(' + list[i].RID + ',2)">\n' +
                                    '   <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查看\n' +
                                    '</a>' +
                                    '<a class="text-danger" href="javascript:del(' + list[i].RID + ')">\n' +
                                    '   <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除\n' +
                                    '</a>' +
                                    '</td>';
                            tr += '</tr>';
                        }
                        grid.empty().append(tr);
                    }
                    pagination(result.pageIndex,result.total);
                }
        );
    }

    /**
     * 总数或者页数为0与1 不显示
     * @param currentPage
     * @param totalPage
     */
    function pagination(currentPage,total){
        $("#pagination").pagination({
            currentPage: currentPage,
            totalPage: Math.ceil(total/pageSize),
            isShow: true,
            count: 5,
            homePageText: "首页",
            endPageText: "尾页",
            prevPageText: "上一页",
            nextPageText: "下一页",
            callback: function(current) {
                // var info = $("#pagination").pagination("getPage");
                // $("#pagination").pagination("setPage", 1, 10);
                // console.log(info);
                pageIndex = current;
                loadList();
            }
        });
    }

    /**
     * type =0 添加
     * type =1 修改
     * type =2 查看
     * @param id
     * @param type
     */
    function getBtnInfo(id,type){
        $("#editFrom form")[0].reset();
        var info;
        if(id != null){
            $.ajax({
                type:'post',
                url:'/menu/getBtnById',
                dataType:'json',
                data:{id:id},
                async:false,
                success:function(result){
                    info = result;
                }
            });
        }
        if(type == 1){
            for(var name in info){
                $("#editFrom input[name=" +name + "]").val(info[name]);
            }
        }else if(type == 2){
            for(var name in info){
                $("#viewTable table td[name=" +name + "]").text(info[name]);
            }
        }
    }

    function save(id,type){
        getBtnInfo(id,type);
        var loadIndex = layer.msg('加载中', {
            icon: 16
            ,shade: 0.01
        });
        winIndex = layer.open({
            title:id == null?'添加按钮':'修改按钮',
            type:1,
            content: $("#editFrom")
            ,success:function(){
                layer.close(loadIndex);
            }
            ,area:['500px','auto']
            ,anim:5
            ,btnAlign:'c'
            ,shade:0.3
            ,maxmin:true
            ,btn: ['保存', '取消']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                $("#editFrom form").submit();
            }
            ,btn2: function(index, layero){
                //return false 开启该代码可禁止点击该按钮关闭
            }
            ,cancel: function(){
                //右上角关闭回调
                //return false 开启该代码可禁止点击该按钮关闭
            }
        });
    }

    function formValid(){
        $("#editFrom form").validator({
            fields: {
                code: "编码:required; length(1~20)",
                name: "名称:required; length(1~)",
                btnUrl: "按钮连接:required;"
            },
            focusCleanup: true,
            timely: 3,
            theme:'yellow_right_effect',
            msgClass: "n-bottom",
            valid: function(form) {
                // form.submit();
                var formData = decodeURIComponent($("#editFrom form").serialize(),true);
                formData += "&menuId=" + selectNode.id;
                $.post(
                        "/menu/saveBtn",
                        formData,
                        function(result){
                            if(result.status == 1){
                                layer.msg(
                                        result.desc,
                                        {icon: 1,shade: 0.01,time:1000},
                                        function(index){
                                            layer.close(index);
                                            layer.close(winIndex);
                                            loadList();
                                        }
                                );
                            }else{
                                layer.msg(result.desc,{icon:2,shade: 0.01,time:1000});
                            }
                        }
                );
            }
        });
    }

    function del(id){
        layer.confirm('是否确定删除？', {
            icon:3,
            btn: ['确定','取消'] //按钮
        }, function(){
            $.post("/menu/delBtn",{id:id},function(result){
                if(result.status == 1){
                    layer.msg(result.desc,{icon:1,shade: 0.01,time:1000},function(index){
                        layer.close(index);
                        loadList();
                    });
                }else{
                    layer.msg(result.desc,{icon:2,shade: 0.01,time:1000});
                }
            });
        }, function(){
        });
    }

    function view(id,type){
        getBtnInfo(id,type);
        var loadIndex = layer.msg('加载中', {
            icon: 16
            ,shade: 0.01
        });
        winIndex = layer.open({
            title:'详细信息',
            type:1,
            content: $("#viewTable")
            ,success:function(){
                layer.close(loadIndex);
            }
            ,area:['500px','auto']
            ,anim:5
            ,btnAlign:'c'
            ,shade:0.3
            ,maxmin:true
            ,btn: ['关闭']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                layer.close(index);
            }
            ,cancel: function(){
                //右上角关闭回调
                //return false 开启该代码可禁止点击该按钮关闭
            }
        });
    }
</script>
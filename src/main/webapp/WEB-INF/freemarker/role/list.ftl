<div class="table-responsive">
    <div id="toolBtn" style="margin-bottom: 5px">
        <button type="button" class="btn btn-default" onclick="addOrEdit()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
        </button>
        <button type="button" class="btn btn-danger" onclick="batchDel()">
            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
        </button>
        <button type="button" class="btn btn-default" style="float: right" onclick="searchAll()">
            <span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>显示全部
        </button>
        <button type="button" class="btn btn-default" style="float: right" onclick="search()">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
        </button>
        <input style="width:300px;float: right" type="text" class="form-control" id="key" name="key" placeholder="编码/名称" />
    </div>
    <div id="dataGrid" class="mini-datagrid" style="width: 100%;overflow-x:hidden"
         url="${ctx}/role/getPage" idField="id"
         sizeList="[15,30,50,100]" pageSize="15" multiSelect="true" allowResize="true">
        <div property="columns">
            <div type="checkcolumn" width="5%">选择</div>
            <div type="indexcolumn" width="5%" headerAlign="center">序号</div>
            <div field="roleCode" width="20%" headerAlign="center">角色编码</div>
            <div field="roleName" width="20%" headerAlign="center" renderer="onGenderRenderer">角色名称</div>
            <div field="roleDesc" width="20%%" headerAlign="center" >描述</div>
            <div field="createDate" width="15%" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss">创建日期</div>
            <div headerAlign="center" width="15%" align="center" renderer="onActionRenderer">操作</div>
        </div>
    </div>
</div>
<script>
    mini.parse();
    var grid = mini.get("dataGrid");
    var organId = ${organId!''};
    autoHeight("dataGrid",120);
    grid.load({organId:organId});
    function search(){
        grid.load({searchKey:$("#key").val()});
    }

    function searchAll(){
        $("#key").val('');
        grid.load({organId:organId});
    }

    function onActionRenderer(e) {
        var grid = e.sender;
        var record = e.record;
        var id = record.id;
        var rowIndex = e.rowIndex;

        var s = '<button class="btn btn-default btn-xs" onclick="addOrEdit(' + id + ')">修改</button>&nbsp;'
                + '&nbsp;<button class="btn btn-danger btn-xs" onclick="batchDel(' + id + ')">删除</button>';
        return s;
    }

    function batchDel(id){
        var ids = [];
        if(id == null){
            var rows = grid.getSelecteds();
            if(rows.length == 0){
                layer.msg("请选择一条记录",{icon:7,shade: 0.01,time:1000});
                return;
            }else{
                for(var index in rows){
                    ids.push(rows[index].id)
                }
            }
        }else{
            ids.push(id);
        }
        console.log(ids);
        layer.confirm('是否确定删除选择记录？', {
            icon:3,
            btn: ['确定','取消'] //按钮
        }, function(){
            try {
                $.post("/role/delete", {ids: ids}, function (result) {
                    if (result.status == 1) {
                        layer.msg(result.desc, {icon: 1, shade: 0.01, time: 1000}, function (index) {
                            layer.close(index);
                            grid.reload();
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
    var roleIndex;
    function addOrEdit(id){
        var url = id == null?"/role/edit?organId="+organId:"/role/edit?organId="+organId+"&id="+id;
        roleIndex = Mine.layer.openWin(id==null?"添加角色":"修改角色",url,500,400);
    }
</script>
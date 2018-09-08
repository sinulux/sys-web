<div class="table-responsive" style="margin: 15px auto">
    <#--${ctx}${springMacroRequestContext.getRequestUri()}-->
    <div id="toolBtn" style="margin-bottom: 5px">
        <button type="button" class="btn btn-default" onclick="()">
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
    <div id="dataGrid" class="mini-datagrid"
         url="${ctx}/data/miniui_grid.json" idField="id"
         sizeList="[20,30,50,100]" pageSize="20">
        <div property="columns">
            <div type="indexcolumn"></div>
            <div field="position_name" headerAlign="center">职位</div>
            <div field="name"      headerAlign="center">姓名</div>
            <div field="gender"    headerAlign="center" renderer="onGenderRenderer">性别</div>
            <div field="salary"    headerAlign="center" numberFormat="¥#,0.00">薪资</div>
            <div field="age"       headerAlign="center" decimalPlaces="2">年龄</div>
            <div field="createtime"headerAlign="center" dateFormat="yyyy-MM-dd">创建日期</div>
            <div headerAlign="center" renderer="onActionRenderer">操作</div>
        </div>
    </div>
</div>
<script>
    mini.parse();
    var grid = mini.get("dataGrid");
    grid.load();
    var Genders = [{ id: 1, text: '男' }, { id: 2, text: '女'}];
    function onGenderRenderer(e) {
        for (var i = 0, l = Genders.length; i < l; i++) {
            var g = Genders[i];
            if (g.id == e.value) return g.text;
        }
        return "";
    }

    function onActionRenderer(e) {
        var grid = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;

        var s = '<a class="btn btn-default btn-xs" href="javascript:editRow(\'' + uid + '\')">修改</a>'
                + '<a class="btn btn-danger btn-xs" href="javascript:delRow(\'' + uid + '\')">删除</a>';

        return s;
    }
    // Mine.layer.openWin2("测试窗口","/test/layerPage","400","300");

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

    function add(id,type){
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
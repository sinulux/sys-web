<link href="/css/jsonviewer.css" type="text/css" rel="stylesheet" />
<div class="col-md-12 tree-bg">
    <ul class="nav nav-tabs">
        <li role="presentation1" class="active"><a href="#">菜单模板</a></li>
        <li role="presentation2" class=""><a href="#">历史版本</a></li>
    </ul>
    <br/>
    <div id="presentation1">
        <div class="col-xs-12">
            <button id="saveBtn" class="btn btn-primary" title="run save()">保存</button>
            <button id="previewBtn" class="btn btn-success" title="run save()">预览</button>
            <button id="btn-json-viewer" class="btn btn-info" title="run jsonViewer()">转换Json数据</button>
            <label class="checkbox-inline"> <input type="checkbox" id="collapsed"> 收缩所有的节点 </label>
            <label class="checkbox-inline"> <input type="checkbox" id="with-quotes">为Key添加双引号 </label>
        </div>
        <br/><br/>
        <div class="col-xs-6">
            <textarea class="form-control" id="json-input" rows="15"></textarea>
        </div>
        <div class="col-xs-6">
            <pre id="json-renderer"></pre>
        </div>
    </div>
    <div id="presentation2" style="overflow: auto" class="hidden">
        <div id="dataGrid" class="mini-datagrid" style="width: 100%;height: 500px"
             url="${ctx}/info/getTplList" idField="id"
             sizeList="[15,30,50,100]" pageSize="15" multiSelect="true" allowResize="true">
            <div property="columns">
                <div type="indexcolumn" width="5%" headerAlign="center">序号</div>
                <div field="title" width="40%" headerAlign="center" align="center">模板名称</div>
                <div field="updateDate" width="30%" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">修改日期</div>
                <div field="article" width="20%" headerAlign="center" align="center" renderer="onRenderer">详情内容</div>
            </div>
        </div>
    </div>
</div>
<script src="/js/jsonviewer.js"></script>
<script>
    $(function() {
        mini.parse();
        var grid = mini.get("dataGrid");
        grid.load();
        $.get("/info/getTpl",function(d){
            $("#json-input").val(d.data);
            $('#btn-json-viewer').click();
        });
        $("#saveBtn").click(function(){
            $.post("/info/saveTpl",{content:$("#json-input").val()},function(d){
                if(d.status == 1){
                    Mine.layer.tips("保存成功！",1);
                }
            });
        });
        $(".nav li").click(function () {
            $(this).addClass('active').siblings().removeClass('active');
            if ($(this).attr('role') == 'presentation1') {
                $("#presentation1").show();
                $("#presentation2").hide();
            } else {
                $("#presentation1").hide();
                $("#presentation2").show();
            }
        });
        $('#previewBtn').click(function() {
            window.open("/login/mainSite");
        });
        $('#btn-json-viewer').click(function() {
            initJsonView();
        });
    });
    function initJsonView(){
        try {
            var input = eval('(' + $('#json-input').val() + ')');
            console.log(input);
        }
        catch (error) {
            return alert("Cannot eval JSON: " + error);
        }
        var options = {
            collapsed: $('#collapsed').is(':checked'),
            withQuotes: $('#with-quotes').is(':checked')
        };
        $('#json-renderer').jsonViewer(input, options);
    }
    function onRenderer(e){
        return "<a href='javascript:viewDetail("+e.record.id+")'>查看详情</a>";
    }
    function viewDetail(id){
        $.get("/info/getTpl",{id:id},function(d){
            if(d.status == 1){
                alert(d.data);
            }
        });
    }
</script>
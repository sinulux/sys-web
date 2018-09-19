<div class="col-md-12">
    <div class="col-md-2 tree-bg">
        <div class="text-center text-danger bg-danger tree-header">机构角色</div>
        <ul id="organTree" class="ztree" style="height: 750px;overflow: auto"></ul>
    </div>
    <div class="col-md-10 hidden table-bordered" id="rightInfo" style="height: 800px;overflow: auto"></div>
</div>
<script type="text/javascript">
    var zTree, selectNode;
    var setting = {
        data: {
            key: {
                name: "organName"
            },
            simpleData: {
                enable: true,
                pIdKey: "parentId"
            }
        },
        callback: {
            onClick: function (event, treeId, treeNode) {
                selectNode = treeNode;
                if(treeNode.open){
                    zTree.expandNode(treeNode, false, false, true);
                }else{
                    zTree.expandNode(treeNode, true, false, true);
                }
                $("#rightInfo").load("/role/list?organId=" + selectNode.id).show();
            }
        }
    };

    function getNodes() {
        var zNodes = [];
        $.ajax({
            type: 'post',
            url: '/organ/getOrganTree',
            dataType: 'json',
            async: false,
            success: function (result) {
                zNodes = result;
                for(var i = 0 ; i < zNodes.length ; i ++){
                    zNodes[i].icon = '/images/organ/'+ zNodes[i].organType +'.png';
                }
            }
        });
        return zNodes;
    }

    $(document).ready(function () {
        var nodes = getNodes();
        zTree = $.fn.zTree.init($("#organTree"), setting, nodes);
        if (nodes.length == 0) {
            $("#organTree").empty().append('<li><a href="javascript:void(0)">暂无组织机构</a></li>');
        }
    });


</script>

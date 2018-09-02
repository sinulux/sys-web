<div class="container row col-xs-12">
    <div class="col-xs-3">
        <div class="text-center text-danger bg-danger" style="height: 50px;font-size: 20px;line-height: 50px;">组织机构
        </div>
        <ul id="organTree" class="ztree bg-warning"
            style="height: 700px;overflow: auto;border-right:1px solid #C9C9C9;">
        </ul>
    </div>
    <div class="col-xs-9 hidden table-bordered" id="rightInfo" style="height: 750px;overflow: auto"></div>
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
                $("#rightInfo").load("/role/roleInfo").show();
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

<form class="layer-form" id="roleForm">
    <input type="hidden" class="form-control" id="createOrganId" name="createOrganId" value="${organId!''}">
    <input type="hidden" class="form-control" id="id" name="id" value="${(eo.id)!}">
    <div class="form-group">
        <label>角色编码</label>
        <input <#if (eo.id)??>readonly</#if> value="${(eo.roleCode)!}" type="text" class="form-control" id="roleCode" name="roleCode" placeholder="角色编码">
    </div>
    <div class="form-group">
        <label>角色名称</label>
        <input value="${(eo.roleName)!''}" type="text" class="form-control" id="roleName" name="roleName" placeholder="角色名称">
    </div>
    <div class="form-group">
        <label>角色描述</label>
        <textarea id="roleDesc" class="form-control" name="roleDesc" placeholder="角色描述信息">${(eo.roleDesc)!''}</textarea>
        <p class="help-block text-warning">填写描述信息帮助了解角色功能.</p>
    </div>
    <div class="center-block">
        <button type="submit" class="btn btn-default">保 存</button>
        <button type="reset" class="btn btn-danger">重 置</button>
    </div>
</form>
<script>
    $("#roleForm").validator({
        fields: {
            roleCode: "编码:required; length(4~12)",
            roleName: "名称:required; length(2~50)",
            roleDesc: "length(0~500)"
        },
        focusCleanup: true,
        timely: 2,
        theme:'yellow_right_effect',
        msgClass:'n-bottom',
        valid: function (form) {
            // form.submit();
            var formData = decodeURIComponent($("#roleForm").serialize(), true);
            $.post("/role/save",formData,function (result) {
                if (result.status == '1') {
                    layer.msg(result.desc, {icon: 1, shade: 0.01, time: 1000},function(index){
                        layer.close(index);
                        layer.close(roleIndex);
                        grid.reload();
                    });
                } else {
                    layer.msg(result.desc, {icon: 2, shade: 0.01, time: 1000});
                }
            });
        }
    });
</script>
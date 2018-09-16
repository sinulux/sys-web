<#--div可编辑属性 contenteditable-->
<div class="text-danger" contenteditable="true">
    ${key}，${userEO.userName}
</div>
<div class="text-info">业务办理</div>
<table class="table table-striped table-bordered">
    <#list firstList as item1>
        <tr>
            <td>${item1_index + 1}</td>
            <td>${item1.name}</td>
            <#if item1.secList?size gt 0>
            <td>
                <table class="table table-bordered" style="margin: 0;padding: 0">
                    <#list item1.secList as item2>
                        <tr>
                            <td>${item2.busi}</td>
                        </tr>
                    </#list>
                </table>
            </td>
            <#else>
            <td>${item1.busi}</td>
            </#if>
        </tr>
    </#list>
</table>
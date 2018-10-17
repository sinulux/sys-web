<#include "../common/header.ftl">
<div class="text-info">${key!''}</div>
<div class="date-picker">
    日期1--${date?string("yyyy-MM-dd HH:mm:ss")}<br/>
    日期2--${dateFormat(date)}
</div>
<#--自定义标签-->
<@mine_test num="12">标签内部${label_inner_var!''}</@mine_test><br/>
<@demo param="com.springboot.tag.generate.DemoBeanService">标签内部${resultObj!''}</@demo><br/>
<div style="margin: 10px">
    <div id="dataGrid" class="mini-datagrid"
         url="${ctx}/data/miniui_grid.json" idField="id"
         sizeList="[20,30,50,100]" pageSize="10">
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
<script type="text/javascript">
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

        var s = '<a class="Edit_Button" href="javascript:editRow(\'' + uid + '\')">修改</a>'
                + '<a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除</a>';

        return s;
    }
</script>
<#include "../common/footer.ftl">

/*
函数：格式化日期
参数：formatStr-格式化字符串
d：将日显示为不带前导零的数字，如1
dd：将日显示为带前导零的数字，如01
ddd：将日显示为缩写形式，如Sun
dddd：将日显示为全名，如Sunday
M：将月份显示为不带前导零的数字，如一月显示为1
MM：将月份显示为带前导零的数字，如01
MMM：将月份显示为缩写形式，如Jan
MMMM：将月份显示为完整月份名，如January
yy：以两位数字格式显示年份
yyyy：以四位数字格式显示年份
h：使用12小时制将小时显示为不带前导零的数字，注意||的用法
hh：使用12小时制将小时显示为带前导零的数字
H：使用24小时制将小时显示为不带前导零的数字
HH：使用24小时制将小时显示为带前导零的数字
m：将分钟显示为不带前导零的数字
mm：将分钟显示为带前导零的数字
s：将秒显示为不带前导零的数字
ss：将秒显示为带前导零的数字
l：将毫秒显示为不带前导零的数字
ll：将毫秒显示为带前导零的数字
tt：显示am/pm
TT：显示AM/PM
返回：格式化后的日期
*/
Date.prototype.format = function (formatStr) {
    var date = this;
    /*
    函数：填充0字符
    参数：value-需要填充的字符串, length-总长度
    返回：填充后的字符串
    */
    var zeroize = function (value, length) {
        if (!length) {
            length = 2;
        }
        value = new String(value);
        for (var i = 0, zeros = ''; i < (length - value.length); i++) {
            zeros += '0';
        }
        return zeros + value;
    };
    return formatStr.replace(/"[^"]*"|'[^']*'|\b(?:d{1,4}|M{1,4}|yy(?:yy)?|([hHmstT])\1?|[lLZ])\b/g, function($0) {
        switch ($0) {
            case 'd': return date.getDate();
            case 'dd': return zeroize(date.getDate());
            case 'ddd': return ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'][date.getDay()];
            case 'dddd': return ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][date.getDay()];
            case 'M': return date.getMonth() + 1;
            case 'MM': return zeroize(date.getMonth() + 1);
            case 'MMM': return ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][date.getMonth()];
            case 'MMMM': return ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][date.getMonth()];
            case 'yy': return new String(date.getFullYear()).substr(2);
            case 'yyyy': return date.getFullYear();
            case 'h': return date.getHours() % 12 || 12;
            case 'hh': return zeroize(date.getHours() % 12 || 12);
            case 'H': return date.getHours();
            case 'HH': return zeroize(date.getHours());
            case 'm': return date.getMinutes();
            case 'mm': return zeroize(date.getMinutes());
            case 's': return date.getSeconds();
            case 'ss': return zeroize(date.getSeconds());
            case 'l': return date.getMilliseconds();
            case 'll': return zeroize(date.getMilliseconds());
            case 'tt': return date.getHours() < 12 ? 'am' : 'pm';
            case 'TT': return date.getHours() < 12 ? 'AM' : 'PM';
        }
    });
};
// document.writeln(new Date().format("yyyy-MM-dd hh:mm:ss"));
function getConstant(id, tableName, columnName, desc) {
    var sel = $("#" + id);
    $.ajax({
        type: 'post',
        url: '/common/getConstant',
        dataType: 'json',
        data: {tableName: tableName, columnName: columnName},
        async: false,
        success: function (result) {
            if (result.data.length == 0) {
                sel.empty().append('<option value="">请选择' + desc + '</option>');
            } else {
                sel.empty().append('<option value="">请选择' + desc + '</option>');
                for (var i = 0; i < result.data.length; i++) {
                    sel.append('<option value="' + result.data[i].CODE + '">' + result.data[i].NAME + '</option>');
                }
            }
        }
    });
}

var Mine = {
  layer:{
      openWin:function(title,url,width,height){
          var cct = $("#layerWin").empty().load(url);
          return layer.open({
              type:1,
              title:title,
              area:[width+"px",height+"px"],
              content:cct
          });
      },
      openWin2:function(title,url,width,height){
          var cct = $("#layerWin2").empty().load(url);
          return layer.open({
              type:1,
              title:title,
              area:[width+"px",height+"px"],
              content:cct
          });
      },
      openIframe:function(title,url,width,height){
          return layer.open({
              type:2,
              title:title,
              area:[width+"px",height+"px"],
              content:url
          });
      },
      tips:function(desc,icon){
          layer.msg(desc, {icon: icon, shade: 0.01, time: 1000});
      }
  }
};

window.alert = function (msg,callback){
  layer.alert(msg,function (index) {
      layer.close(index);
      if(typeof(callback) === "function"){
          callback("ok");
      }
  });
};

window.confirm = function (msg,okName,cancleName,callback){
    layer.confirm(msg,{
        icon:3,
        btn: [okName == undefined?'确定':okName,cancleName == undefined ?'取消':cancleName] //按钮
    },function (index) {
        layer.close(index);
        if(typeof(callback) === "function"){
            callback("ok");
        }
    });
};
function resetHeight(id,cuteHeight) {
    var h = document.documentElement.clientHeight; //获取当前窗口可视操作区域高度
    var bodyHeight = document.getElementById(id); //寻找ID为content的对象
    if(bodyHeight){
        bodyHeight.style.height = (h - cuteHeight) + "px"; //你想要自适应高度的对象
    }
}
function autoHeight(id,cuteHeight){
    setInterval(function(){
        resetHeight(id,cuteHeight);
    },200);
}
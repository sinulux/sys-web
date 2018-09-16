Freemarker页面语法
博客分类： Freemarker
freemarkerSpringPythonC#C++ 

A 概念
最常用的 3 个概念

sequence 序列，对应java 里的list 、数组等非键值对的集合

hash      键值对的集合

namespace 对一个ftl 文件的引用, 利用这个名字可以访问到该ftl 文件的资源

B 指令
if, else, elseif


语法

Java代码  收藏代码
<#if condition>  
  ...  
<#elseif condition2>  
  ...  
<#elseif condition3>  
  ...  
...  
<#else>  
  ...  
</#if>  

用例


Freemarker代码  收藏代码
<#if x = 1>  
  x is 1  
</#if>  
<#if x = 1>  
  x is 1  
<#else>  
  x is not 1  
</#if>  

switch, case, default, break


语法

 

Freemarker代码  收藏代码
<#switch value>  
  <#case refValue1>  
         ...  
         <#break>  
  <#case refValue2>  
         ...  
         <#break>  
  ...  
  <#case refValueN>  
         ...  
         <#break>  
  <#default>  
         ...  
</#switch>  
 
用例


字符串

Freemarker代码  收藏代码
<#switch being.size>  
  <#case "small">  
          This will be processed if it is small  
          <#break>  
  <#case "medium">  
          This will be processed if it is medium  
          <#break>  
  <#case "large">  
          This will be processed if it is large  
          <#break>  
  <#default>  
          This will be processed if it is neither  
</#switch>  
 

数字

Freemarker代码  收藏代码
<#switch x>  
  <#case x = 1>  
         1  
  <#case x = 2>  
         2  
  <#default>  
         d  
</#switch>  
 

如果x=1 输出 1 2, x=2 输出 2, x=3 输出d

list, break


语法
Freemarker代码  收藏代码
<#list sequence as item>  
...  
<#if item = "spring"><#break></#if>  
...  
</#list>  
 关键字

item_index:是list当前值的下标

item_has_next:判断list是否还有值


用例
Freemarker代码  收藏代码
<#assign seq = ["winter", "spring", "summer", "autumn"]>  
<#list seq as x>  
  ${x_index + 1}. ${x}<#if x_has_next>,</#if>  
</#list>  
 

输出：

      1.winter,

      2.spring,

      3.summer,

      4.autumn


include


语法
Freemarker代码  收藏代码
<#include filename>  
  或则

Java代码  收藏代码
<#include filename options>  
 
options包含两个属性

encoding="GBK" 编码格式

parse=true 是否作为ftl语法解析,默认是true，false就是以文本方式引入.注意在ftl文件里布尔值都是直接赋值
的如parse=true,而不是parse="true" 

用例
/common/copyright.ftl 包含内容

Ftl代码  收藏代码
Copyright 2001-2002 ${me}  
  
All rights reserved.    
 

模板文件


Java代码  收藏代码
<#assign me = "Juila Smith">  
  
Some test  
  
Yeah  
___________________________________________________________________________  
  
<span><strong><span><#include "/common/copyright.ftl" encoding="GBK"></span>  
  
  
  
  
  
</strong>  
  
  
  
</span>  

 



输出结果:

Some test

Yeah.

Copyright 2001-2002 Juila Smith

All rights reserved. 

 

Import


语法
Freemarker代码  收藏代码
<#import path as hash>  
 类似于java里的import,它导入文件，然后就可以在当前文件里使用被导入文件里的宏组件


用例
假设mylib.ftl 里定义了宏copyright 那么我们在其他模板页面里可以这样使用

Freemarker代码  收藏代码
<#import "/libs/mylib.ftl" as my>  
  
<@my.copyright date="1999-2002"/>  
  
<#-- "my"在freemarker里被称作namespace -->  
 

compress


语法
Freemarker代码  收藏代码
<#compress>  
  ...  
</#compress>  
 

用来压缩空白空间和空白的行

escape, noescape


语法
Freemarker代码  收藏代码
<#escape identifier as expression>  
  ...  
  <#noescape>...</#noescape>  
  ...  
</#escape>  

用例
      主要使用在相似的字符串变量输出，比如某一个模块的所有字符串输出都必须是html安全的，这个时候就可以使用

该表达式

Freemarker代码  收藏代码
<#escape x as x?html>  
  First name: ${firstName}  
  <#noescape>Last name: ${lastName}</#noescape>  
  Maiden name: ${maidenName}  
</#escape>  

相同表达式

Ftl代码  收藏代码
First name: ${firstName?html}  
Last name: ${lastName }  
Maiden name: ${maidenName?html}  
 

assign


语法
Freemarker代码  收藏代码
<#assign name=value>  
  
<#-- 或则 -->  
  
<#assign name1=value1 name2=value2 ... nameN=valueN>  
  
<#-- 或则 -->  
  
<#assign same as above... in namespacehash>  
  
<#-- 或则 -->  
  
<#assign name>  
  capture this  
</#assign>  
  
<#-- 或则 -->  
  
<#assign name in namespacehash>  
  capture this  
</#assign>  
 

用例
生成变量,并且给变量赋值

给seasons赋予序列值
Ftl代码  收藏代码
<#assign seasons = ["winter", "spring", "summer", "autumn"]>  
 给变量test加1

Ftl代码  收藏代码
<#assign test = test + 1>  
 给my namespage 赋予一个变量bgColor,下面可以通过my.bgColor来访问这个变量

Ftl代码  收藏代码
<#import "/mylib.ftl" as my>  
  
<#assign bgColor="red" in my>  
 将一段输出的文本作为变量保存在x里

Ftl代码  收藏代码
<#assign x>  
  <#list 1..3 as n>  
         ${n} <@myMacro />  
  </#list>  
</#assign>  
  
Number of words: ${x?word_list?size}  
  
${x}  
  
<#assign x>Hello ${userEO}!</#assign>          error  
  
<#assign x=" Hello ${userEO}!">         true  
 同时也支持中文赋值，如：

Ftl代码  收藏代码
<#assign 语法>  
  java  
</#assign>  
  
${语法}  
 打印输出:

java



global



语法
Freemarker代码  收藏代码
<#global name=value>  
  
<#--或则-->  
  
<#global name1=value1 name2=value2 ... nameN=valueN>  
  
<#--或则-->  
  
<#global name>  
  capture this  
</#global>  
 

     全局赋值语法，利用这个语法给变量赋值，那么这个变量在所有的namespace [A1] 中是可见的, 如果这个变量被当前的assign 语法覆盖 如<#global x=2> <#assign x=1> 在当前页面里x=2 将被隐藏，或者通过${.global.x} 来访问

setting


语法
Freemarker代码  收藏代码
<#setting name=value>  
 

用来设置整个系统的一个环境

locale

number_format

boolean_format

date_format , time_format , datetime_format

time_zone

classic_compatible

用例
假如当前是匈牙利的设置，然后修改成美国

Ftl代码  收藏代码
${1.2}  
  
<#setting locale="en_US">  
  
${1.2}    
 

输出

         1,2

         1.2
因为匈牙利是采用", "作为十进制的分隔符，美国是用". "

macro, nested, return


语法
Freemarker代码  收藏代码
<#macro name param1 param2 ... paramN>  
  ...  
  <#nested loopvar1, loopvar2, ..., loopvarN>  
  ...  
  <#return>  
  ...  
</#macro>  

用例
Ftl代码  收藏代码
<#macro test foo bar="Bar"[A2]  baaz=-1>  
  Test text, and the params: ${foo}, ${bar}, ${baaz}  
</#macro>  
  
<@test foo="a" bar="b" baaz=5*5-2/>  
  
<@test foo="a" bar="b"/>  
  
<@test foo="a" baaz=5*5-2/>  
  
<@test foo="a"/>   
 

输出

  Test text, and the params: a, b, 23
  Test text, and the params: a, b, -1
  Test text, and the params: a, Bar, 23

  Test text, and the params: a, Bar, -1

 

定义循环输出的宏

Ftl代码  收藏代码
<#macro list title items>  
${title?cap_first}:  
        <#list items as x>  
           *${x?cap_first}  
  
         </#list>  
</#macro>  
  
<@list items=["mouse", "elephant", "python"] title="Animals"/>  
 
输出结果:
      Animals:
           *Mouse
           *Elephant
           *Python

 


包含body 的宏

Ftl代码  收藏代码
<#macro repeat count>  
  <#list 1..count as x>  
         <#nested x, x/2, x==count>  
  </#list>  
</#macro>  
  
<@repeat count=4 ; c halfc last>  
  ${c}. ${halfc}<#if last> Last!</#if>  
</@repeat>   
 

输出

  1. 0.5
  2. 1
  3. 1.5
  4. 2 Last!

t, lt, rt


语法
Freemarkder代码  收藏代码
<#t> 去掉左右空白和回车换行  
  
<#lt>去掉左边空白和回车换行  
  
<#rt>去掉右边空白和回车换行  
  
<#nt>取消上面的效果  

C 一些常用方法或注意事项
表达式转换类
${expression} 计算expression 并输出

#{ expression } 数字计算#{ expression ;format} 安格式输出数字format 为M 和m

M 表示小数点后最多的位数,m 表示小数点后最少的位数如#{121.2322;m2M2} 输出121.23

数字循环
1..5 表示从1 到5 ，原型number..number

对浮点取整数
${123.23?int} 输出 123

给变量默认值
${var?default("hello world")?html} 如果var is null 那么将会被hello world 替代

判断对象是不是 null
Ftl代码  收藏代码
<#if mouse?exists>  
      Mouse found  
<#else>  
 也可以直接${mouse?if_exists})输出布尔形

 

－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

（1）解决输出中文乱码问题：

     freemarker乱码的原因：

没有使用正确的编码格式读取模版文件,表现为模版中的中文为乱码
解决方法：在classpath上放置一个文件freemarker.properties，在里面写上模版文件的编码方式，比如

default_encoding=UTF-8
locale=zh_CN

注意：eclipse中除了xml文件、java文件外，默认的文件格式iso8859-1

数据插入模版时，没有使用正确的编码，表现出模版中的新插入数据为乱码
解决方法：在result的配置中，指定charset，s2的FreemarkerResult.java会将charset传递freemarker

<action name="ListPersons" class="ListPersons">

<result type="freemarker">

    <param name="location">/pages/Person/view.ftl</param>

    <param name="contentType"> text/html;charset=UTF-8

</param>

</result>

</action>

（2）提高freemarker的性能

在freemarker.properties中设置：

template_update_delay=60000

避免每次请求都重新载入模版，即充分利用cached的模版

（3）尽量使用freemarker本身的提供的tag，使用S2 tags 的标签会在性能上有所损失

 

（4）freemarker的标签种类：

${..}:FreeMarker will replace it in the output with the actual value of the thing in the curly brackets. They are called interpolation s.
# ,代表是FTL tags（FreeMarker Template Language tags） ，hey are instructions to FreeMarker and will not be printed to the output
<#if ...></#if>
<#list totalList as elementObject>...</#list>
@ ,代表用户自定义的标签
<#-- --> 注释标签，注意不是<!-- -->
（5）一些特殊的指令：  

r代表原样输出：${r"C:\foo\bar"}
<#list ["winter", "spring", "summer", "autumn"] as x>${x}</#list>
？引出内置指令
String处理指令：
html:特殊的html字符将会被转义，比如"<"，处理后的结果是&lt;
cap_first 、lower_case 、upper_case
trim :除去字符串前后的空格
sequences处理指令
size ：返回sequences的大小
numbers处理指令
int:number的整数部分，(e.g. -1.9?int is -1)
（6）对于null，或者miss value，freemarker会报错

  ?exists:旧版本的用法
!：default value operator，语法结构为： unsafe_expr !default_expr，比如 ${mouse!"No mouse."} 当mouse不存在时，返回default value；
(product.color)!"red" 这种方式，能够处理product或者color为miss value的情况；
而product.color!"red"将只处理color为miss value的情况
??: Missing value test operator ,测试是否为missing value
unsafe_expr ?? ：product.color??将只测试color是否为null
(unsafe_expr )??：(product.color)??将测试product和color是否存在null
Ftl代码  收藏代码
<#if mouse??>  
  Mouse found  
<#else>  
  No mouse found  
</#if>  
Creating mouse...  
<#assign mouse = "Jerry">  
<#if mouse??>  
  Mouse found  
  
<#else>  
  No mouse found  
</#if>  
 
（7）模版值插入方式 （interpolation）

通用方式 （ Universal interpolations）： ${expression }

对于字符串：只是简单输出
对于数值，会自动根据local确定格式，称为human audience，否则称为computer audience，可以"?c", 比如， <a href="/shop/details?id=${product.id ?c }">Details...</a>,因此这里的id是给浏览器使用的，不需要进行格式化，注意?c只对数值有效
对于日期，会使用默认的日期格式转换，因此需要事先设置好默认的转换格式，包括date_format , time_format ，atetime_format
对于布尔值，不能输出，会报错并停止模版的执行，比如${a = 2} 会出错，但是可以 string built-in来进行转换
数值处理，具体参考：Built-ins for numbers

    http://freemarker.org/docs/ref_builtins_number.html#ref_builtin_string_for_number 

    数值处理的例子： 
    
    <#setting number_format="currency"/>
    <#assign answer=42/>
    ${answer}
    ${answer?string} <#-- the same as ${answer} -->
    ${answer?string.number}
    ${answer?string.currency}
    ${answer?string.percent}

    除了使用内置的formate，可以使用任何用Java decimal number format syntax 书写的formate，比如

    <#setting number_format="0.###E0"/>

    <#setting number_format="0"/>

    <#setting number_format="#"/>
    ${1234}
    ${12345?string("0.####E0")}

    更加方便的格式： 

    <#setting locale="en_US">
    US people writes:        ${12345678?string(",##0.00")}

    <#setting locale="hu">
    Hungarian people writes: ${12345678?string(",##0.00")}

     

    日期处理，参考Built-ins for dates 

    http://freemarker.org/docs/ref_builtins_date.html#ref_builtin_string_for_date 

    日期处理的例子：

    ${openingTime?string.short}
    ${openingTime?string.medium}
    ${openingTime?string.long}
    ${openingTime?string.full}
    ${nextDiscountDay?string.short}
    ${nextDiscountDay?string.medium}
    ${nextDiscountDay?string.long}
    ${nextDiscountDay?string.full}
    ${lastUpdated?string.short}
    ${lastUpdated?string.medium}
    ${lastUpdated?string.long}
    ${lastUpdated?string.full}
 

注意： 

    由于java语言中的Date类型的不足，freemarker不能根据Date变量判断出变量包含的部分（日期、时间还是全部），在这种情况下，freemarker

    不能正确显示出${lastUpdated?string.short} 或者 simply ${lastUpdated}，因此，可以通过?date, ?time and ?datetime built-ins

    来帮助freemarker来进行判断，比如${lastUpdated?datetime?string.short}

    除了使用内置的日期转换格式外，可以自己指定日期的格式，使用的是Java date format syntax，比如：

    ${lastUpdated?string("yyyy-MM-dd HH:mm:ss zzzz")}
    ${lastUpdated?string("EEE, MMM d, ''yy")}
    ${lastUpdated?string("EEEE, MMMM dd, yyyy, hh:mm:ss a '('zzz')'")}
    数值专用方式 （ Numerical interpolations）：#{expression } or #{expression ; format }，这是数值专用的输出方式，但是 最好使用通用方式的string built-in或者number_format 来完成转换，Numerical interpolations方式将会被停用

 

 


（8）创建自定义模版

Ftl代码  收藏代码
<#macro greet>        
     <font size="+2">Hello Joe!</font>  
</#macro>  
 

 

 

<#assign   userEO="zhangsan"/>

字符串连接

${"Hello  ${userEO}!"}   与 ${"Hello " + userEO + "!"} 相同

结果：Hello  zhangsan

获取字符

${userEO[0]}    ${userEO[4]}

结果：z  g

序列的连接和访问

 <#assign   nums=["1" , "2"] + ["3" , "4"]  />

${nums[0]}   结果是 1

内置函数

html   使用实体引用替换字符串中所有HTML字符，例如，使用&amp; 替换&

lower_case   将字符串转化成小写

substring

index_of      例如”abcdc"?index_of("bc") 将返回1

seq_contains    序列中是否包含指定值  ${nums?seq_contains("1")?string("yes","no")}

seq_index_of    第一个出现的索引   ${nums?seq_index_of("1")}   结果0

sort_by    用于散列   
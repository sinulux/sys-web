<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<span>${key!"不存在"}</span><br/>
<span>${mkey!"不存在"}</span><br/>
<span>${mmkey!"不存在"}</span><br/>
<span>${model!"不存在"}</span><br/>
<span>${test!"不存在"}</span>
<div>
    <#if test??>
        哈哈哈1
        <#if test== 'Hello'>
            哈哈哈2
        <#else>
            呵呵呵2
        </#if>
    <#else>
        呵呵呵1
    </#if>
</div>
<table border=1>
<tr><th>Name<th>Price
<#if animals??>
 <#list animals as being>
    <tr><td>${being.name}<td>${being.price} ￥
 </#list>
</#if>
</table>
</body>
</html>
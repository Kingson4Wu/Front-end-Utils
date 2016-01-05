//js获取get参数值
<script language="JavaScript">
function Request(argname)
{
var url = document.location.href;
var arrStr = url.substring(url.indexOf("?")+1).split("&");
//return arrStr;
for(var i =0;i<arrStr.length;i++)
{
   var loc = arrStr[i].indexOf(argname+"=");
   if(loc!=-1)
   {
    return arrStr[i].replace(argname+"=","").replace("?","");
    break;
   }

}
return "";
}
//使用Request("argname")即可得到参数值;
</script>

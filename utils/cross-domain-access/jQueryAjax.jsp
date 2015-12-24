<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('#validateCustom').click(function(){
            $.getJSON('http://123.125.**.***:8088/ecpaycus/web/getCustomizeByPhoneNo?jsoncallback=?&phoneNo=18601148104',
                function(json){
                    var customState = json.customState;  
                    alert('服务端返回结果为：' + customState);
                }
            );
        });
    });
</script>
<span style="color:blue; text-decoration:underline; cursor:pointer;" id="validateCustom">点此完成定制</span>

<%--  http://blog.csdn.net/jadyer/article/details/7336954
==========================================================================================
说明：本示例在IE9.0.8112.16421和FireFox9.0.1上测试，均通过
用法：上面是客户端代码，下面是服务端代码
     String phoneNo = request.getParameter("phoneNo"));
     //TODO ...
     String jsoncallback = request.getParameter("jsoncallback");
     String jsonReturn = "{customState: 'hasCustomized'}";
     response.setContentType("application/json; charset=UTF-8");
     response.getWriter().print(jsoncallback + "(" + jsonReturn + ")");
注意：服务端输出给客户端时，输出的必须是json字符串，否则客户端无法接收
      且，客户端请求时，必须提供回调函数名，并以参数形式放到请求的URL后面
      服务端输出给客户端时，必须将接收到的回调函数名字放到json字符串的前面
==========================================================================================
--%>

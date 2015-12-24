<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" src="js/flyjsonp.min.js"></script>
<script type="text/javascript">
    function getJFBCustomState(){  
        FlyJSONP.init({debug: true}); //初始化FlyJSONP的实例，参数debug可设置为true或false
        FlyJSONP.post({
            url: 'http://123.125.**.***:8088/ecpaycus/web/getCustomizeByPhoneNo',
            parameters: {phoneNo:'18601148104'},
            success: function(data){  
                var customState = data.customState;
                alert('服务器返回结果为：' + customState);
            }
            /*
            success: function(data){
                var customState = data.customState;
                alert('服务器返回结果为：' + customState);
            },
            error: function(errorMsg){
                alert('22');
                console.log(errorMsg);
            }
            */
        });
    }
</script>
<span style="color:blue; text-decoration:underline; cursor:pointer;" onclick="getJFBCustomState();">点此完成定制</span>

<%--  http://blog.csdn.net/jadyer/article/details/7336954
==========================================================================================
FlyJSONP
主页：http://alotaiba.github.com/FlyJSONP/
概述：FlyJSONP是一个应用JSONP实现跨域请求的相当轻量级的JavaScript类库
     FlyJSONP不依赖于任何JavaScript框架，只需设置一些参数便能够用它实现跨域的POST和GET请求
补充：本示例在IE9.0.8112.16421和FireFox9.0.1上测试，均通过
      另外，我是在这个网站发现它的-->http://site518.net/javascript-cross-domain-request/
用法：上面是客户端代码，下面是服务端代码
     String phoneNo = request.getParameter("phoneNo"));
     //TODO ...
     response.setContentType("application/json; charset=UTF-8");
     response.getWriter().print("{customState: 'hasCustomized'}");
注意：服务端输出给客户端时，输出的必须是json字符串，否则客户端无法接收
==========================================================================================
--%>

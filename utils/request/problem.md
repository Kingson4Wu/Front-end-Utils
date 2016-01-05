+ get方法URL传值带+,#,&等特殊字符的解决方法
这种情况下可以分两种处理方法：

1.在服务器端处理
//处理文件名中的特殊字符  
$attachment_path = preg_replace("/\+/",'%2B',$row['attachment_path']);  
$attachment_path = preg_replace("/\#/",'%23',$attachment_path);  
$attachment_path = preg_replace("/\&/",'%26',$attachment_path);  
2.在客户端处理
‍function geturl(str){  
    return escape(sStr).replace(/\+/g,'%2B').replace(/\#/g,'%23').replace(/\&/g,'%26');  
}  

参考资料：

http://wolfgangkiefer.blog.163.com/blog/static/8626550320114158147174/

http://hi.baidu.com/ycycyc_1985/blog/item/e0f4436c71ac56eb431694e0.html

http://www.360doc.com/content/09/0717/11/16915_4307704.shtml
来源： <http://www.58lou.com/separticle.php?artid=83>

//如何通过js限制用户在input text中只能输入数字和"-"号?

<input type='text' onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" />
//这是你想要的结果，不过我建议改成：
<input type='text' onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" />
//就是在失去焦点时也进行验证，因为可以用输入法输入汉字（用鼠标选取汉字）或者用鼠标进行粘贴操作

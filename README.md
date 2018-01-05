# Front-end_Utils
+ <a href="javascript:void(0);">▼</a>不跳转
+ div悬浮
```html
	<div style="position:relative">
		<div style="position:absolute; width:50px; height:30px; left:-10px; top:0px; " >
        	<select id="masterWarehouse" name="masterWarehouse"   style="width: 65px;height: 23px;  cursor: pointer;">
          		<option value="">--主仓--</option>
        	</select>
     	</div>
     </div>				
```
+ 双击显示输入框异步调用后台
``` js
$(".spanBrandExplanation").on("dblclick", function(e) {
			var target= e.currentTarget;
			var id= $(target).attr("brandSeq");
			var brandExplanation= $("#"+id+"_explanation").val();
			//alert(brandExplanation);
			$(target).parent().find(".editBrandExplanation").val(brandExplanation);
			$(target).parent().find(".editBrandExplanation").show();
			$(target).parent().find(".editBrandExplanation").focus();
			$(target).hide();
		});
$(".editBrandExplanation").on("blur", function(e) {
			var target= e.currentTarget;
			var brandExplanation= $(target).val();
			var id= $(target).attr("brandSeq");
			$(target).parent().find(".spanBrandExplanation").show();
			$(target).hide();
			modifyBrandExplanation(id,brandExplanation,e);
		});
```
+ 异步调用显示json-list
```js
$(document).ready(function() {  //$(window).load(function() 用这个一样  
$.get("<%=request.getContextPath()%>/Admin/json_userList?f.pagenow=1", function(data) {      
    $.each(data.userlist, function(i, item) {   
             $.each(data.userlist, function(i, item) {    
    $("#info").append(                 
    "<div>" + item.id + "</div>" +      
      "<div>" + item.name    + "</div>" +       
     "<div>" + item.email + "</div>" +  

     "<div>" + item.level + "</div>" +  
     "<div>" + item.phone + "</div>" +  
     "<div>" + item.society + "</div>" +  
     "<div>" + item.sex +   
      "</div><hr/>");        });   
         });   
},"JSON");//前面用$.getJSON这里就不用设置JSON属性  
</script>  
```

+ jQuery表单异步提交
```js
<script type="text/javascript">  
$(function(){  
    // 只需要下面这个调用就可以将表单改成异步提交方式！  
    $("#form1").ajaxForm({  
        success:function(result){  
            $("#output").val(result);  
        }  
    });  
});  
</script>  
```


+ 下拉框onchange事件控制输入框隐藏或显示
```html
<div class="form-group">
                <label class="col-sm-2 control-label" for="salePlatform">渠道</label>
                <div class="col-sm-1">
                    <select id="salePlatform" name="salePlatform" class="validate[required]" onChange="existSubTypeId(this)">
                        <option value="" selected>请选择</option>
                        <c:forEach items="${params['appsSalePlatformMap']}" var="appsSalePlatform">
                            <option value="${appsSalePlatform.key}">${appsSalePlatform.value.salePlatformName}</option>
                        </c:forEach>
                    </select>
                </div>
                <label id="subTypeIdLabel"  class="col-sm-1 control-label" for="subTypeId" style="display: none;">子类型</label>
                <div id="subTypeIdSelect" class="col-sm-0" style="display: none;">
                    <select id="subTypeId" name="subTypeId" class="validate[required]">
                        <option value="" selected>请选择</option>
                        <option value="1">唯d</option>
						<option value="2">正d</option>
                    </select>
                </div>
</div>
```
```js
function existSubTypeId(osel){
	//选中正点app
	if("f"==osel.options[osel.selectedIndex].value){
		document.getElementById("subTypeId").options[0].selected = true;
		document.getElementById("subTypeIdLabel").style.display="block";
		document.getElementById("subTypeIdSelect").style.display="block";
	}else{
		document.getElementById("subTypeIdLabel").style.display="none";
		document.getElementById("subTypeIdSelect").style.display="none";
	}
}
```

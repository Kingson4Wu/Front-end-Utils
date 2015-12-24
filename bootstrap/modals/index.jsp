
<%-- boostrap插件地址：http://v3.bootcss.com/javascript/#modals --%>

<div class="container input_button_high" align="middle" >

   <button class="btn btn-primary" type="submit" id="synchBtn">同步档期</button>
   <button class="btn btn-primary" type="submit" id="preheatBtn">reload-预热档期</button>
   <button class="btn btn-primary" type="submit" id="aboutOnlineBtn">reload-即将上线</button>
   <button class="btn btn-primary" type="submit" id="saleBtn" >reload-在售档期</button>

</div>
<button class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm" id="tips" style="display:none;">Small modal</button>

<div id="smalltips" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <label ><font id="tipsText" color="blue" text=""></font></label>
    </div>
  </div>
</div>

<style type="text/css">
 .input_button_high{
  margin-top:300px;
  margin-bottom:400px;
 }
 </style>
<script type="text/javascript">
$(document).ready(function() {
    var url = "${pageContext.request.contextPath}/synchBrand";
    var data ="";
    $("#synchBtn").on('click', function() {
        $.ajax({
              type: 'POST',
              url: url,
              data: data,
              success:function(retJson){
                  if(retJson!=null && retJson.error!=null){
                    //alert(retJson.error.message);
                      $("#tipsText").text(retJson.error.message) ;
                  }else if(retJson!=null && retJson.data!=null && retJson.data.result=='success'){
                     // $("#tips").trigger("click");

                     $("#tipsText").text("操作成功！点击提示框之外任意区域关闭...") ;
                      $('#tips').click();
                     // $("#smalltips").attr("aria-hidden",false) ;
                      //location.reload();

                  }
              },
              beforeSend:function(msg){
                  $("#synchBtn").attr("disabled",true) ;
              },
              complete:function(msg){
                  $("#synchBtn").attr("disabled",false) ;  
              }
        });
    });

})
</script>

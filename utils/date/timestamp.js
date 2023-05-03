<td class="dateTd">${activeTimeMgr.startTime * 1000}</td>

<script type="text/javascript">
$(document).ready(function() {
  formatMillisecond();
//时间格式化
function formatMillisecond() {
  var els = $(".dateTd");
  var dt = new Date();
  if (els) {
    alert(els.length);
    for (var i = 0; i < els.length; i++) {
      var eText = els[i].innerHTML;
      alert(eText);
      if (eText == '' || eText == '0' || isNaN(eText)) {
        els[i].innerHTML = '--';
        continue;
      }
      dt.setTime(eText);
      els[i].innerHTML = dt.format('yyyy-MM-dd hh:mm');
    }
  }
};
/**
 * 时间对象的格式化;
 */
Date.prototype.format = function(format) {
/*
 * eg:format="YYYY-MM-dd hh:mm:ss";
 */
var o = {
  "M+" : this.getMonth() + 1, // month
  "d+" : this.getDate(), // day
  "h+" : this.getHours(), // hour
  "m+" : this.getMinutes(), // minute
  "s+" : this.getSeconds(), // second
  "q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
  "S" : this.getMilliseconds()
// millisecond
}

if (/(y+)/.test(format)) {
  format = format.replace(RegExp.$1, (this.getFullYear() + "")
      .substr(4 - RegExp.$1.length));
}


for ( var k in o) {
  if (new RegExp("(" + k + ")").test(format)) {
    format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
        : ("00" + o[k]).substr(("" + o[k]).length));
  }
}
return format;
}
</script>

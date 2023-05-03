<div id="channelShieldList">
						<c:forEach items="${channels}" var="channel">
							<span name="channelShieldDecorator">
							<input id="channelIdShield_${channel.key}" name="shieldChannelType"
								type="checkbox" value="${channel.key}" onclick="checkOneFn('shieldChannelTypeAll','shieldChannelType');">${channel.value.channelName}
							</span>
						</c:forEach>
						</div>
var previlegedChannels = '1,2,3,4,8';//对这些排序，其他不排序
		$("[name='channelDecorator']").sort(function(sa, sb){
			a = sa.children[0];//拿到id
			b = sb.children[0];
		if(previlegedChannels.indexOf($(a).val()) != -1 && previlegedChannels.indexOf($(b).val()) != -1//同时在'1,2,3,4,8'里
				||
			   previlegedChannels.indexOf($(a).val()) == -1 && previlegedChannels.indexOf($(b).val()) == -1){
//同时不在'1,2,3,4,8'里
				if($(a).val() < $(b).val())
					return -1;
				else
					return 1;
			}
			else if(previlegedChannels.indexOf($(a).val()) != -1 && previlegedChannels.indexOf($(b).val()) == -1)
//前面在'1,2,3,4,8'里，后面不在
				return -1;
			else
				return 1;


		}).appendTo("#channelList");//结果是升序
//http://www.blogjava.net/duduli/archive/2009/05/21/272001.html
//http://www.cnblogs.com/wenzichiqingwa/archive/2012/08/21/2648466.html

/**
知识点：

1,sort(function(a,b){return a-b;})对传入的一对值进行比较，然后返回的的值为：小于0，大于0，等于0；（大于0交换位置，反之则不）

  * 当小于0时，说明b>a，故b的排序靠后（即不变）.

  * 当大于0时，说明a>b，故a的排序靠后.

  * 当等于0时，说明a=b，故不改变排序.

如果对数值数组的值进行降序排序。那么只要把返回的值改为b-a!

个人觉得这个方法包含了排序算法的实现过程
*/

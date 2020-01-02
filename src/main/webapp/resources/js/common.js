
function check(objs){
	var cnt = 0;
	var res;
	
	$(objs).each(function(i, obj) {
		if($(obj).val() == ""){
			cnt++;
			res = $(obj).attr("data-msg");
			return false;
		}
	})
	
	if(0 < cnt){
		alert(res);
		return false;
	}
} 
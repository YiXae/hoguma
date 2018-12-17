/* 동의 체크 선택 시작  */
$(document).ready(function () {
	$("#cbox").click(function () {
			
		var ckAll = $("#cbox").is(":checked");		
		
		if(ckAll == true) {			
			$(".ckboxs").prop("checked", true);
			$(".agree_error").css("display", "none");
		} else {
			$(".ckboxs").prop("checked", false);				
		}
	});
		
	$(".ckboxs").click(function () {
			
		checkedLength = $(".ul_li_span > input:checked").length;	
		
		if(checkedLength == 4) {			
			$("#cbox").prop("checked", true);
		} else {
			$("#cbox").prop("checked", false);				
		} 
	});
				
	$(".okagree_btn").click(function () {
		var ck1 = $("#li1box").is(":checked");
		var ck2 = $("#li2box").is(":checked");
			
		if(ck1 == true && ck2 == true) {
			$(location).attr("href", "inputmemberinfo.bizpoll");
		} else {
			$(".agree_error").css("display", "block");
			return false;
		}		
	});	
		
	$(".ckboxs").click(function () {
			
		var ck1 = $("#li1box").is(":checked");
		var ck2 = $("#li2box").is(":checked");
			
		if(ck1 == true && ck2 == true) {			
			$(".agree_error").css("display", "none");
		} 
	});	
});
/* 동의 체크 선택 끝  */

/* 동의 버튼 시작  */
$(document).on("click", "#okagree", function() {
	var
	form = $("#frm_agree");

	// 유효성 끝나면 Controller로 보내야 함
	form.submit();
});
/* 동의 버튼 끝  */
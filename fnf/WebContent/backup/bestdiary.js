/* 메인에서 더보기 클릭시 인기 생산일지 Top 20 Tab 메뉴 처리 jQuery 시작 */
$(function () {
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index + 1);
	
	if(tab == 'a'){
		$("#tab2").hide();
		$("#tab1").show();
	    $("#t1").addClass("active").css("color", "#723d77");
	    $("#t2").removeClass("active").css("color", "#3e5dad");
	} else {
		$("#tab2").show();
		$("#tab1").hide();
		$("#t1").removeClass("active").css("color", "#3e5dad");
		$("#t2").addClass("active").css("color", "#723d77");		
	}
});
/* 메인에서 더보기 클릭시 인기 생산일지 Top 20 Tab 메뉴 처리 jQuery 끝 */

/* 인기 생산일지 Top 20 Tab 메뉴 jQuery 시작 */
$(function () {
    $(".contentstab_best").click(function () {
        $(".contentstab_best").removeClass("active").css("color", "#3e5dad");	        
        $(this).addClass("active").css("color", "#723d77");
        $(".tab_content_best").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});
/* 인기 생산일지 Top 20 Tab 메뉴 jQuery 끝 */

/* 회원정보 레이어팝업 jQuery 시작 */
$('.js-open_my').click(function () {
	var scrollHeight = 0;
	
	scrollHeight = $("body").scrollTop();
	$("body").addClass("layer-open");
	$("#popLayer_my").css({
		"position" : "fixed", //최상위 div 고정 
		"top" : -scrollHeight // 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
	});
	
	$("#popLayer_my").show();
	
	var $layer = $('.js-layer_my');
    $layer.removeClass('hidden_my');
    
    $(".infoclose_btn_my").click(function(){

		$("body").removeClass("layer-open");
		$("#popLayer_my").css({
			"position" : "relative",
			"top" : "0"
		});

		$("body").scrollTop(scrollHeight);
		$("#popLayer_my").hide();
	});
});
/* 회원정보 레이어팝업 jQuery 끝 */

/* 메인 Tab 메뉴 jQuery 시작 */
$(function () {
    $(".tab_contents").hide();
    $(".tab_contents:first").show();
    $("#tab_menu td:first").addClass("active").css("color", "orange");

    $("#tab_menu td").click(function () {
        $("#tab_menu td").removeClass("active").css("color", "#3e5dad");	        
        $(this).addClass("active").css("color", "orange");
        $(".tab_contents").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});
/* 메인 Tab 메뉴 jQuery 끝 */

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
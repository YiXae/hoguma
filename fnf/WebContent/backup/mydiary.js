/* 나의 생산일지 Tab 메뉴 jQuery 시작 */
$(function () {
    $(".tab_content_my").hide();
    $(".tab_content_my:first").show();
    $(".contentstab_my:first").addClass("active").css("color", "#723d77");

    $(".contentstab_my").click(function () {
        $(".contentstab_my").removeClass("active").css("color", "#3e5dad");	        
        $(this).addClass("active").css("color", "#723d77");
        $(".tab_content_my").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});
/* 나의 생산일지 Tab 메뉴 jQuery 끝 */

/* 자기소개 글자수 제한 jQuery 시작 */
function len_chk(){
	var frm = document.insertinfo.contents; 
	     
	if(frm.value.length > 150){
		/*alert("글자 수 150자로 제한됩니다!");*/  
	    frm.value = frm.value.substring(0,150);  
	    frm.focus();
	} 
}
/* 자기소개 글자수 제한 jQuery 끝 */

/* 자기소개 글자수 카운터 jQuery 시작 */
$(function() {
    $('#text_content').keyup(function (e){
        var content = $(this).val();
        /*$(this).height(((content.split('\n').length + 1) * 1.5) + 'em');*/
        $('#text_counter').html(content.length + '/150');
    });
    $('#text_content').keyup();
});
/* 자기소개 글자수 카운터 jQuery 끝 */

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

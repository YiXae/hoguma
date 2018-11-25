/* 메인에서 더보기 클릭시 인기 생산일지 Top 20 Tab 메뉴 처리 시작 */
$(function () {
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index + 1,index+2);
	
	if(tab == 'a'){
		$("#tab2_best").hide();
		$("#tab1_best").show();
	    $("#t1").addClass("active").css("color", "#723d77");
	    $("#t2").removeClass("active").css("color", "#3e5dad");
	} else if(tab == 'b'){
		$("#tab2_best").show();
		$("#tab1_best").hide();
		$("#t1").removeClass("active").css("color", "#3e5dad");
		$("#t2").addClass("active").css("color", "#723d77");		
	} 
});
/* 메인에서 더보기 클릭시 인기 생산일지 Top 20 Tab 메뉴 처리 끝 */

/* 탭 메뉴 시작 */
$(function () {
	$(".contentstab_best").click(function () {
	    $(".contentstab_best").removeClass("active").css("color", "#3e5dad");	        
	    $(this).addClass("active").css("color", "#723d77");
	    $(".tab_content_best").hide()
	    var activeTab = $(this).attr("rel");
	    $("#" + activeTab).fadeIn()
	});
});
/* 탭 메뉴 끝 */

/* 탭 메뉴 처리 시작 */
$(function () {
    
	$(".tab_content_gotown").hide();
    $(".tab_content_gotown:first").show();
    $(".contentstab_gotown:first").addClass("active").css("color", "#723d77");

    $(".contentstab_gotown").click(function () {
        $(".contentstab_gotown").removeClass("active").css("color", "#3e5dad");	        
        $(this).addClass("active").css("color", "#723d77");
        $(".tab_content_gotown").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});
/* 탭 메뉴 처리 끝 */
/* 탭 메뉴 시작 */
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
/* 탭 메뉴 끝 */

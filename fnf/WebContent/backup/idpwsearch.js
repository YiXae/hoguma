/* 아이디/비밀번호 찾기 Tab 메뉴 jQuery 시작 */
$(function () {
    $(".tab_content_idpw").hide();
    $(".tab_content_idpw:first").show();
    $(".contentstab_idpw:first").addClass("active").css("color", "#723d77");

    $(".contentstab_idpw").click(function () {
        $(".contentstab_idpw").removeClass("active").css("color", "#3e5dad");	        
        $(this).addClass("active").css("color", "#723d77");
        $(".tab_content_idpw").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});
/* 아이디/비밀번호 찾기 Tab 메뉴 jQuery */
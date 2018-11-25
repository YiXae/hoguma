/* 화면 위아래 이동 버튼 jQuery 시작 */
$(document).ready(function () {
	$(".godownbtn").addClass("show");
	
	$(window).scroll(function(event){
		var scroll = $(window).scrollTop();
		if (scroll >= 60) {
			$(".goupbtn").addClass("show");
			$(".godownbtn").removeClass("show");
		} else {
			$(".goupbtn").removeClass("show");
			$(".godownbtn").addClass("show");
		}
	});
	
	var topEle = $("#up");
	var bottomEle = $("#down");
	var delay = 2000;

	topEle.click(function() {
		$("html").stop().animate({scrollTop: 0}, delay);
	});

	bottomEle.click(function() {
		$("html").stop().animate({scrollTop : ($("#footer_area_info").offset().top)}, delay);
	});
});
/* 화면 위아래 이동 버튼 jQuery 끝 */	

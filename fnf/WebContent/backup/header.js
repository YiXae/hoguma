/* 화면 메뉴 에니 jQuery 시작 */
jQuery(window).scroll(function () {
		if (jQuery(this).scrollTop() > 50) {
			jQuery(".topmenuani").stop().animate({
					marginTop:"0px"
				}, 300);
		} else {
			jQuery(".topmenuani").stop().animate({
					marginTop:"-50px"
				}, 300);
		}
});
/* 화면 메뉴 에니 jQuery 끝 */	

/* 인풋 포커스와 블러 처리 시작 */
$(".input_login").focus(function() {
	$(this).parent().css("border", "1px solid orange");
});

$(".input_login").blur(function() {
	$(this).parent().css("border", "1px solid #dadada");
	
	var inputval = $(this).val();
	
	if(inputval == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else {
		$(this).parent().parent().next().css("display", "none");
	}
});
/* 인풋 포커스와 블러 처리 끝 */

/* 화면 메뉴 에니 시작 */
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
/* 화면 메뉴 에니 끝 */

/* 화면 위아래 이동 버튼 시작 */
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
/* 화면 위아래 이동 버튼 끝 */

/* 회원정보 레이어팝업에 아작스로 정보 가져오기 시작 */
$('.js-open_my').click(function () {
	var bwriter = $(this).children().text();
	
	$.ajax({				
		url: "myinfopop.bizpoll",
		type: "POST",
		dataType: "json",
		data: "bwriter=" + bwriter,
		
		success: function(data) {		
			$("#myinfo_mnick").text(data.mnick);
			$("#myinfo_maddr").text(data.maddr);
			$("#myinfo_midopen").text(data.midopen);
			$("#myinfo_mphoneopen").text(data.mphoneopen);
			$("#myinfo_mjob").text(data.mjob);
			$("#myinfo_mintro").text(data.mintro);
			var imgurl = "myphoto/"+data.mphoto;
			$("#myphoto").attr("src", imgurl);			
			
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
		    
		},				
		error: function(){
			alert("System Error!!!");
		}
	});
	
});
/* 회원정보 레이어팝업에 아작스로 정보 가져오기 끝 */

/* 회원정보 보기위한 비밀번호 확인 레이어팝업 시작 */
$(".membercheck_pop").click(function () {
	var scrollHeight = 0;
	
	scrollHeight = $("body").scrollTop();
	$("body").addClass("layer-open");
	$("#membercheck_all").css({
		"position" : "fixed", //최상위 div 고정 
		"top" : -scrollHeight // 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
	});
	
	$("#membercheck_all").show();
	
	var $layer = $('.membercheck_a');
    $layer.removeClass('hidden_membercheck_c');
    
    $(".membercheck_close").click(function(){

		$("body").removeClass("layer-open");
		$("#membercheck_all").css({
			"position" : "relative",
			"top" : "0"
		});

		$("body").scrollTop(scrollHeight);
		$("#membercheck_all").hide();
	});
});
/* 회원정보 보기위한 비밀번호 확인 레이어팝업 시작 */

/* 비밀번호 일치 검사 시작 */
$("#mpw_check").blur(function(){
	var mid = $("#mid_check").val();
	var mpw = $(this).val();
	
	if(mpw == "") {
		$("#mpw_check").parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(mpw != "") {
		$.ajax({				
			url: "pwCheck.bizpoll",
			type: "POST",
			dataType: "json",
			data: "id=" + mid + "&pw=" + mpw, // 쿼리스트링이라서 "pw=" 공백 사용할 수 없음

			success: function(data) {					
				if(data.message == "1") {						
					$("#mpw_check").parent().parent().next().css("display", "block").text("현재 비밀번호가 일치하지 않습니다.");
				} 
			},			
			error: function(){
				alert("System Error!!!");
			}
		});
	}
});
/* 비밀번호 일치 검사 끝 */

/* 회원확인 버튼 클릭시 유효성 검사 시작 */
$(document).on("click", "#btn_checking", function() {
	var
	form = $("#frm_memcheck"),
	id = $("#mid_check"),
	pw = $("#mpw_check");
	
	// 비밀번호 유효성 검사
	var mid = $.trim(id.val());
	var mpw = $.trim(pw.val());
	
	if(mpw == "") {			
		pw.focus();
		pw.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		return false;
	} else if(mpw != "") {
		$.ajax({				
			url: "pwCheck.bizpoll",
			type: "POST",
			dataType: "json",
			data: "id=" + mid + "&pw=" + mpw, // 쿼리스트링이라서 "pw=" 공백 사용할 수 없음

			success: function(data) {					
				if(data.message == "1") {						
					pw.parent().parent().next().css("display", "block").css("color", "#f46665").text("현재 비밀번호가 일치하지 않습니다.");
					pw.select();
					return false;
				} 
			},				
			error: function(){
				alert("System Error!!!");
			}
		});
	}	
	form.submit();
});
/* 회원확인 버튼 클릭시 유효성 검사 끝 */

/* 회원확인 취소 버튼 시작 */
$(document).on("click", ".noagree_btn", function() {
	$("body").removeClass("layer-open");
	$("#membercheck_all").css({
		"position" : "relative",
		"top" : "0"
	});

	$("body").scrollTop(scrollHeight);
	$("#membercheck_all").hide();
});
/* 회원확인 취소 버튼 끝 */

/* 회원탈퇴 확인 모달 팝업에서 탈퇴 처리 시작 */
$(".infoclose_btn_memeberdele").click(function(){

	$("body").removeClass("layer-open");
	$("#modal_leavecheck").css({
		"position" : "relative",
		"top" : "0"
	});

	$("body").scrollTop(scrollHeight);
	$("#modal_leavecheck").hide();
});
/* 회원탈퇴 확인 모달 팝업에서 탈퇴 처리 끝 */

/* 회원탈퇴 처리 시작 */
$(document).on("click", "#btn_delok", function() {
	var
	form = $("#frm_delok")

	form.submit();
});
/* 회원탈퇴 처리 끝 */

/* 회원탈퇴 취소 시작 */
$(document).on("click", "#pop_btn_can", function() {
	$("body").removeClass("layer-open");
	$("#modal_leavecheck").css({
		"position" : "relative",
		"top" : "0"
	});

	$("body").scrollTop(scrollHeight);
	$("#modal_leavecheck").hide();
});
/* 회원탈퇴 취소 끝 */

/* 게시판 삭제 닫기 시작 */
$(".close_boarddel").click(function(){

	$("body").removeClass("layer-open");
	$("#modal_boarddel").css({
		"position" : "relative",
		"top" : "0"
	});

	$("body").scrollTop(scrollHeight);
	$("#modal_boarddel").hide();
});
/* 게시판 삭제 닫기 시작 끝 */

/* 게시판 삭제 처리 시작 */
$(document).on("click", "#btn_boarddelok", function(){
	var form = $("#frm_boardelok")
	var bno = $("#bno_tran").val();
	var breplycnt = $("#breply_tran").val();
	var bfilename= $("#bfile_tran").val();	

	form.submit();	
});
/* 게시판 삭제 처리 끝 */

/* 게시판 삭제 취소 시작 */
$("#btn_boardcan").click(function(){

	$("body").removeClass("layer-open");
	$("#modal_boarddel").css({
		"position" : "relative",
		"top" : "0"
	});

	$("body").scrollTop(scrollHeight);
	$("#modal_boarddel").hide();
});
/* 게시판 삭제 취소 끝 */

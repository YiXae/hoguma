/* 게시글 삭제 버튼 클릭 시 이동 시작 */
$(document).on("click","#del_board",function(){
	var bno = $("#bno_tran").val();
	var breplycnt = $("#breply_tran").val();
	var bfilename= $("#bfile_tran").val();
	
	if(breplycnt > 0) {
		alert("댓글이 있는 글은 삭제하실수 없습니다.");
		$("#reply_list_header").focus();
		return false;
	} else if(breplycnt <= 0) {
		
		var scrollHeight = 0;
		
		scrollHeight = $("body").scrollTop();
		$("body").addClass("layer-open");
		$("#modal_boarddel").css({
			"position" : "fixed", //최상위 div 고정 
			"top" : -scrollHeight // 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
		});
		
		$("#modal_boarddel").show();
		
		var $layer = $('.js-layer_memberdele_ok');
		
	    $layer.removeClass('hidden_memeberdele_ok');
	}	
});
/* 게시글 삭제 버튼 클릭 시 이동 끝 */

/* 게시글 상세 화면 들어오면 자동으로 댓글 화면 로딩 시작 */
$(document).ready(function(){
	//문서가 준비되면 댓글 목록을 조회하는 ajax 실행 
	comment_list();
});
/* 게시글 상세 화면 들어오면 자동으로 댓글 화면 로딩 끝 */

/* 댓글 ajax로 화면에 호출 시작 */
function comment_list(){
	var bno = $("#bno_tran").val();
	$.ajax({
		type :"post",
		url : "mydiary_commentlist.bizpoll",
		data: "bno="+bno,
		success:function(result){
			$("#commentList").html(result);
		}
		
	});	
}
/* 댓글 ajax로 화면에 호출 끝 */

/* 게시판 좋아요 시작 */		
$(document).ready(function () {
	$('#likebutton').click(function(){
		if($(this).hasClass('btn_unlike')){
		   $(this).removeClass('btn_unlike');
		   $('.ani_heart_m').removeClass('hi');
		   $('.ani_heart_m').addClass('bye');
		} else{
		   $(this).addClass('btn_unlike');
		   $('.ani_heart_m').addClass('hi');
		   $('.ani_heart_m').removeClass('bye');
		}
	});
});
/* 게시판 좋아요 끝 */

/* 일반글과 생산일지 분류해서 표시 시작 */
$(document).ready(function () {
	
	var subcontent = $("#bkindtext").val();
	
	if(subcontent == "일반글") {
		$(".detail_ilji").css("display", "none");
	}
});
/* 일반글과 생산일지 분류해서 표시 끝 */
/*
 목록 버튼 시작 
$(document).on("click", ".go_list_btn", function(){
	var refer = $("#referer_list").val();
	location.href = refer;
});
 목록 버튼 끝 */
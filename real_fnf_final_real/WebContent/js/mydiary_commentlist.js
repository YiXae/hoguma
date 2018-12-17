/* 인풋 포커스와 블러 처리 시작 */
$(".commentzones").focus(function() {
	$(this).css("border", "1px solid orange");
});

$(".commentzones").blur(function() {
	$(this).css("border", "1px solid #dadada");	
	
});
/* 인풋 포커스와 블러 처리 끝 */

/* 댓글 작성 버튼 클릭 시 처리 시작 */
$(document).on("click","#btn_insertrply",function(){
	var content=$(".commentzones").val();
	var bno = $("#bno_tran").val();
	
	if(content == ""){
		$(".commentzones").focus();
		$(".rwriter_error").css("display","block");
		return false;
	} else {                               
		$(".rwriter_error").css("display","none");				
		$("#re_bno").val(bno);
	
		$.ajax({	
			
			url : "mydiary_replywrite.bizpoll",
			data: $("#frm_reply").serialize(), 
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success:function(){
				comment_list();
				$(".commentzones").val("");
			},
			error : function(){
				alert("system error!");	
			}
		});
		
		/*location.reload();*/
	}
	
});
/* 댓글 작성 버튼 클릭 시 처리 끝 */

/* 댓글 삭제 처리 시작 */
$(document).on("click",".com_del_btn",function(){
	var rno = $(this).attr("data_num");
	var bno = $("#bno_tran").val();
	
	$.ajax({
		url: "mydiary_replydelete.bizpoll",
		data: "rno=" + rno + "&bno=" + bno,
		success: function(result) {
			comment_list();
		},
		error: function() {
			alert("System Error!!!");
		}
	});
	
	/*location.reload();*/
});
/* 댓글 삭제 처리 끝 */

/* 댓글 작성 글자수 제한 시작 */
function len_commentc(){
	var frm = document.frm_reply.commentnum;
	
	$("#commentc").html(frm.value.length);
	
	if(frm.value.length > 300){
		frm.value = frm.value.substring(0,300);  
	    frm.focus();
	}
}
/* 댓글 작성 글자수 제한 끝 */

/* 댓글 수정 글자수 제한 시작 */
function len_chk_change_comment(){
	var frm = document.insertinfo_comment_change.comment_change_content;
	
	$("#comment_change_counter").html(frm.value.length);
	
	if(frm.value.length > 300){
		frm.value = frm.value.substring(0,300);  
	    frm.focus();
	}
}
/* 댓글 수정 글자수 제한 끝 */



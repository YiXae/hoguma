<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>	
	<div id="modal_boarddel">
		<div class="js-layer_memberdele_ok  allback_memberdele_ok  hidden_memeberdele_ok">
			<div id="title_back">
				<span id="allclose_my" class="close_boarddel"><i class="fa fa-close"></i></span>
				<div id="title_my">게시글 삭제</div>
			</div>
			<div id="contents_back_memberdele">
				<div id="info_box_my">
					<form action="boardDeleteplay.bizpoll" method="POST" name="frm_boardelok" id="frm_boardelok">					
						<input type="hidden" name="delid" value="${sessionScope.loginUser.mid}">
						<input type="hidden" id="bno_tran" name="bno_tran" value="${boardview.bno}">
						<input type="hidden" id="breply_tran" name="breply_tran" value="${boardview.breplycnt}">
						<input type="hidden" id="bfile_tran" name="bfile_tran" value="${boardview.bfilename}">
																
						<span style="font-size: 14px">정말 소중한 게시글을 삭제하실건가요? ^^</span>
						<hr>				
						<div class="googbye">						
				 			<img src="img/goodbye.png" alt="">		
						</div>
						<div class="agree_btn_zone">						
				 			<span style="font-size: 14px">한 번 삭제한 게시글은 복구가 불가능 합니다.
				 			<br>
				 			불필요한 게시글 관리는 좋은 습관이며 저희에게도 많은 도움이 된답니다. ^^</span>				
						</div>				
						<div class="agree_btn_zone">						
				 			<button type="button" class="noagree_btn" id="btn_boardcan">취소</button><button type="button" id="btn_boarddelok" class="okagree_btn">삭제</button>				
						</div>					
					</form>					
				</div>	
			</div>				
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>	
	<div id="modal_leavecheck">
		<div class="js-layer_memberdele_ok  allback_memberdele_ok  hidden_memeberdele_ok">
			<div id="title_back">
				<span id="allclose_my" class="infoclose_btn_memeberdele"><i class="fa fa-close"></i></span>
				<div id="title_my">회원탈퇴</div>
			</div>
			<div id="contents_back_memberdele">
				<div id="info_box_my">
					<form action="memberleaveplay.bizpoll" method="POST" name="frm_delok" id="frm_delok">					
						<input type="hidden" name="delid" value="${sessionScope.loginUser.mid}">
						<span style="font-size: 14px">정말 탈퇴하실건가요? ^^</span>
						<hr>				
						<div class="googbye">						
				 			<img src="img/goodbye.png" alt="">		
						</div>
						<div class="agree_btn_zone">						
				 			<span style="font-size: 14px">탈퇴 후에도 언제든지 재 가입이 가능합니다.
				 			<br>
				 			필요한 정보가 있다면 다시 서비스를 이용해 주세요!</span>				
						</div>				
						<div class="agree_btn_zone">						
				 			<button type="button" class="noagree_btn" id="pop_btn_can">취소</button><button type="button" id="btn_delok" class="okagree_btn">탈퇴</button>				
						</div>					
					</form>					
				</div>	
			</div>				
		</div>
	</div>
</body>
</html>
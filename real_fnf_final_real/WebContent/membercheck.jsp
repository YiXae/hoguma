<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>	
	<div id="membercheck_all">
		<div class="membercheck_a  membercheck_b  hidden_membercheck_c">
			<div id="title_back">
				<span id="allclose_my" class="membercheck_close"><i class="fa fa-close"></i></span>
				<div id="title_my">회원확인</div>
			</div>
			<div id="contents_back_memberdele">
				<div id="info_box_my">
					<span style="font-size: 14px">회원확인을 위해서 비밀번호를 입력해 주세요.</span>
					<hr>
					<form action="myinfo.bizpoll" method="POST" name="frm_memcheck" id="frm_memcheck">		
						<div class="member_el">
							<div class="member_check_el">
								<img src="img/secu1.png" alt="">
							</div>								
							<div>
								<label for="mpw_check" class="member_title">비밀번호<span class="span_only"> (필수)</span></label>
							</div>
							<div class="div_input" id="str_pw_ch">
								<input type="password" alt="비밀번호 입력" id="mpw_check" name="inputpw1" class="input_login">
								<input type="hidden" name="delId" value="${sessionScope.loginUser.mid}" id="mid_check">
							</div>
						</div>
						<span class="err_check_msg">필수 정보입니다.</span>
						<div class="agree_btn_zone">
							<button type="button" class="noagree_btn">취소</button><button type="button" id="btn_checking" class="okagree_btn">확인</button>
						</div>	
					</form>	
				</div>	
			</div>				
		</div>
	</div>
</body>
</html>
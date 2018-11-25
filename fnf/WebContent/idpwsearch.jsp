<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<article>		
		<!-- 전체 body 3개의 영역으로 나누기 시작
		     1. 좌측 전체 내용 표시 영역
		     2. 사이 여백 조절 영역
		     3. 우측 배너광고2 영역 -->	
		<table id="bodyall">
			<tr>
				<!-- 1. 좌측 전체 내용 표시 영역 시작 -->
				<td id="bodyalltd1">				
					<!-- 아이디/비밀번호 찾기 내용 시작 -->
					<div id="zone_box">									
						<!-- 아이디/비밀번호 찾기 타이틀 시작 -->
						<div id="contents_title">
							&nbsp;&nbsp;아이디ㆍ비밀번호 찾기																				
						</div>
						<!-- 아이디/비밀번호 찾기 타이틀 끝 -->						
						<!-- 아이디/비밀번호 찾기 시작(디폴트로 표시) -->
						<div class="gen_content">							
							<div class="login_title">
								아이디와 비밀번호를 잊어버리셨나요?										
							</div>
							<table width="100%">
								<tr>
									<td width="230px" valign="top">											
										<img src="img/join_img2.png" alt="" class="img_style">											
									</td>
									<td width="40px"></td>
									<td valign="top">
										<form action="idsearch.bizpoll" method="POST" name="frm_idsearch" id="frm_idsearch">
											<div class="search_id_title">아이디 찾기</div>
											<div class="login_box">
												<div class="div_input" id="str_searchname">
													<input type="text" placeholder="이름" id="inputname_search" name="inputname_search" class="input_login">
												</div>
												<div class="div_input" id="str_searchphone">
													<input type="text" placeholder="전화번호" id="inputphone_search" name="inputphone_search" class="input_login">
												</div>
											</div>									
											<div class="err_check_msg" id="idw">
												회원가입하실 때 입력한 이름과 전화번호를 입력해 주세요.
											</div>
											<div class="search_btn_zone">
												<button type="button" id="btn_searchid" class="idsearch_ok_btn">아이디 찾기</button>
											</div>												
										</form>	
										<form action="pwsearch.bizpoll" method="POST" name="frm_pwsearch" id="frm_pwsearch">
											<div class="search_pw_title">비밀번호 찾기</div>
											<div class="login_box">
												<div class="div_input" id="str_searchid">
													<input type="text" placeholder="아이디(이메일주소)" id="inputid_search" name="inputid_search" class="input_login">
												</div>
												<div class="div_input" id="str_searchphone">
													<input type="text" placeholder="전화번호" id="inputphone_search_down" name="inputphone_search_down" class="input_login">
												</div>
											</div>									
											<div class="err_check_msg" id="pww">
												회원가입하실 때 입력한 아이디와 전화번호를 입력해 주세요.
											</div>
											<div class="search_btn_zone">
												<button type="button" id="btn_searchpw" class="pwsearch_ok_btn">비밀번호 찾기</button>
											</div>
										</form>
									</td>
								</tr>
							</table>
						</div>																																			
					</div>
					<!-- 아이디/비밀번호 찾기 내용 끝 -->
				</td>
				<!-- 1. 좌측 전체 내용 표시 영역 끝 -->			
				<!-- 2. 사이 여백 조절 영역 시작 -->
				<td id="bodyalltd2"></td>
				<!-- 2. 사이 여백 조절 영역 끝 -->
				<!-- 3. 우측 배너광고 영역 시작 -->
				<td id="bodyalltd3">
					<%@ include file="include/bannerad.jsp"%>
				</td>
				<!-- 3. 우측 배너광고 영역 끝 -->
			</tr>	
		</table>
		<!-- 전체 바디 3개의 영역으로 나누기 끝 -->
	</article>
	<!-- 전체 바디 3개의 영역으로 나누기 끝 -->	
	<br>
	<br>
	<br>
	<br>
	<br>	
	<!-- Footer 시작 -->
	<%@ include file="include/footer.jsp"%>	
	<!-- Footer 끝 -->
</body>
<!-- 스크립트 시작 -->
<script type="text/javascript" src="js/idpwsearch.js"></script>
<!-- 스크립트 끝 -->
</html>
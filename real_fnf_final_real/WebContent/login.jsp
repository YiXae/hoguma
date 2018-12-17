<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<% 
	String referer = request.getHeader("referer");
%>
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
					<!-- 로그인 내용 시작 -->
					<div id="zone_box">									
						<!-- 로그인 타이틀 시작 -->
						<div id="contents_title">
							&nbsp;&nbsp;로그인																				
						</div>
						<!-- 로그인 타이틀 끝 -->
						<!-- 로그인 시작 -->									
						<div class="gen_content">
							<form action="loginplay.bizpoll" method="POST" name="frm_loginname" id="frm_login">							
								<div class="login_title">
									로그인을 통해 '호박고구마와 자반고등어'의 다양한 서비스를 이용해 보세요!									
								</div>
								<table width="100%">
									<tr>
										<td width="230px" valign="top">											
											<img src="img/join_img1.png" alt="" class="img_style">											
										</td>
										<td width="40px"></td>
										<td>
											<div class="login_box">
												<div class="div_input" id="str_id">
													<input type="hidden" value="<%=referer%>" id="referer_login" name="referer_login">
													<input type="text" placeholder="아이디(이메일)를 입력해 주세요." id="inputid_login" name="loginid" class="input_login">
												</div>
												<div class="div_input" id="str_pw">
													<input type="password" placeholder="비밀번호를 입력해 주세요." id="inputpw_login" name="loginpw" class="input_login">
												</div>					
												<div id="login_keep">
													<input type="checkbox" id="loginkeep_login">
													<label for="loginkeep_login" class="label_login">로그인 상태 유지</label>
												</div>
											</div>									
											<div class="err_check_msg">
												ID와 비빌번호를 모두 입력해 주세요.
											</div>
											<div class="login_btn_zone">
												<button type="button" id="btn_login_ok" class="login_ok_btn">로그인</button>
											</div>												
											<div id="login_etc">
												<button type="button" onclick="location.href='idpwsearch.bizpoll'" class="login_etc_btn">아이디 찾기</button><span class="login_si">|</span>
												<button type="button" onclick="location.href='idpwsearch.bizpoll'" class="login_etc_btn">비밀번호 찾기</button><span class="login_si">|</span>
												<button type="button" onclick="location.href='agreement.bizpoll'" class="login_etc_btn">회원가입</button>												
											</div>
											<div>
												<div id="simple_text">
													간단한 절차로 MH's Strawberry 가족이되어 다양하고 특별한 멤버쉽<br>
													 혜택을 누려보세요. 달콤한 딸기향으로 여러분의 삶을 채워드리겠습니다.
												</div>
												<div id="simple_login">
													<a href="#"><img src="img/ban_naver.png"></a>&nbsp;<a href="#"><img src="img/ban_kakao.png"></a>&nbsp;<a href="#"><img src="img/ban_face.png"></a>
												</div>
											</div>
										</td>
									</tr>
								</table>										
							</form>		
						</div>									
						<!-- 로그인 끝 -->																																		
					</div>
					<!-- 로그인 내용 끝 -->
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
<script type="text/javascript" src="js/login.js"></script>
<!-- 스크립트 끝 -->
</html>
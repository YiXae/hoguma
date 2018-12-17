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
					<!-- 회원정보 입력 내용 시작 -->
					<div id="zone_box">									
						<!-- 회원정보 입력 타이틀 시작 -->
						<div id="contents_title">
							&nbsp;&nbsp;회원탈퇴																				
						</div>
						<!-- 회원정보 입력 타이틀 끝 -->
						<!-- 회원정보 입력 시작 -->									
						<div class="gen_content">
							<form name="frm_del" id="frm_del">														
								<div class="join_update_title">
									'호박고구마와 자반고등어' 회원탈퇴 :
									<div class="join_dele_descript">탈퇴신청한 회원님의 개인정보는 바로 삭제됩니다.</div>
								</div>								
								<table width="100%">
									<tr>
										<td width="230px" valign="top" class="left_img_td">											
											<div class="lef_img_mem">
												<img src="img/join_img3.png" alt="" class="img_style">												
											</div>																																	
										</td>
										<td width="40px"></td>
										<td valign="top">
											<div class="join_box">											
												<div>
													<span style="font-size: 14px">중요한 내용이므로 주의 깊게 읽어주세요.
													<hr>
													다양한 '호박고구마와 자반고등어' 서비스에 대한 액세스를 제공하는 계정을 삭제하려고 합니다.
													이 과정을 진행하시면 더 이상 '호박고구마와 자반고등어' 서비스를 이용할 수 없으며 계정과 데이터 모두가 삭제됩니다.
													<br>
													<br>
													단, 회원탈퇴 후 언제든지 재 가입을 통해 '호박고구마와 자반고등어' 서비스를 이용하실 수 있습니다.
													이점 참고하여 회원탈퇴여부를 결정해 주시기 바랍니다.</span>
													<br>
													<br>
												</div>				
												<div class="member_el">
													<div>
														<label for="mpw_del" class="member_title">회원탈퇴 확인 비밀번호<span class="span_only"> (필수)</span></label>
													</div>
													<div class="div_input" id="str_pw_ch">
														<input type="password" alt="비밀번호 입력" id="mpw_del" name="inputpw1" class="input_login">
														<input type="hidden" name="delId" value="${sessionScope.loginUser.mid}" id="mid_del">
													</div>						
												</div>
												<span class="err_check_msg">필수 정보입니다.</span>																																		
											</div>
											<div class="agree_btn_zone">
												<button type="button" class="noagree_btn">취소</button><button type="button" id="btn_del" class="okagree_btn">탈퇴</button>
											</div>																				
										</td>
									</tr>
								</table>
							</form>											
						</div>									
						<!-- 회원정보 입력 끝 -->																																		
					</div>
					<!-- 회원정보 입력 내용 끝 -->	
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
<script type="text/javascript" src="js/memberdel.js"></script>
<!-- 스크립트 끝 -->
</html>
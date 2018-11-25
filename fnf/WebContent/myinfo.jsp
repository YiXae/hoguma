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
							&nbsp;&nbsp;회원정보 																				
						</div>
						<!-- 회원정보 입력 타이틀 끝 -->
						<!-- 회원정보 입력 시작 -->									
						<div class="gen_content">
							<form action="memberupdateplay.bizpoll" method="POST" name="frm_mem_update" id="frm_meminfo">								
								<div class="join_update_title">
									개인정보 확인 :
									<div class="join_update_descript">주기적으로 개인정보(비밀번호)를 변경하셔서 정보유출을 예방해 주세요. 개인정보 관리는 무엇보다 중요합니다.</div>
								</div>								
								<table width="100%">
									<tr>
										<td width="230px" valign="top" class="left_img_td">											
											<div class="lef_img_mem">
												<img src="img/join_img3.png" alt="" class="img_style">
												<div class="lef_img_mem_in">
													<button type="button" onclick="location.href='memberdel.bizpoll'" class="js-open_memberdele">회원 탈퇴</button>
												</div>
											</div>																																	
										</td>
										<td width="40px"></td>
										<td>
											<div class="join_box">
												<div class="emailid">
													<div>
														<label for="email" class="member_title">아이디<span class="span_only"></span></label>
													</div>
													<div class="memberinfofix">							
														${sessionScope.loginUser.mid}<input type="hidden" id="email" name="emailid" value="${sessionScope.loginUser.mid}" class="input_login">
													</div>											
												</div>
												<div class="member_el">
													<div>
														<label for="inputnickname" class="member_title">별명<span class="span_only"> (필수)</span></label>
													</div>
													<div class="div_input" id="str_nickname">
														<input type="text" placeholder="한글 별명을 최대 10자까지 입력해 주세요." maxlength="10" id="inputnickname" name="nickname" value="${sessionScope.loginUser.mnick}" class="input_login">
													</div>											
												</div>
												<div class="err_check_msg" id="mag_nick_ok">
													필수 정보입니다. <!-- 테스트  -->
												</div>	
												<div class="member_el">
													<div>
														<label for="inputpw" class="member_title">비밀번호<span class="span_only"> (필수)</span></label>
													</div>
													<div class="div_input" id="str_pw">
														<input type="password" placeholder="비밀번호를 입력해 주세요." id="inputpw" name="mpw" class="input_login checkpw">
													</div>							
												</div>
												<div class="err_check_msg" id="mag_pw_ok">
													필수 정보입니다.
												</div>	
												<div class="member_el">
													<div>
														<label for="inputpw_ch" class="member_title">비밀번호 확인<span class="span_only"> (필수)</span></label>
													</div>
													<div class="div_input" id="str_pw_ch">
														<input type="password" placeholder="비밀번호를 다시 한 번 입력해 주세요." id="inputpw_ch" name="mpwch" class="input_login checkpw">
													</div>											
												</div>
												<div class="err_check_msg" id="mag_pwch_ok">
													필수 정보입니다.
												</div>	
												<div class="member_el">
													<div>
														<label for="inputname" class="member_title">이름<span class="span_only"></span></label>
													</div>
													<div class="memberinfofix">
														${sessionScope.loginUser.mname}<input type="hidden" placeholder="3~10자까지의 한글, 띄어쓰기는 불가능합니다." id="inputname" name="name" value="${sessionScope.loginUser.mname}" class="input_login">
													</div>											
												</div>												
												<div class="member_el">
													<div>
														<label for="inputbirth" class="member_title">생년월일<span class="span_only"></span></label>
													</div>
													<div class="memberinfofix">
														${sessionScope.loginUser.mbirth}<input type="hidden" alt="생년월일입력" placeholder="YYYYMMDD 형식의 8자리 수로 입력해 주세요." id="inputbirth" name="birth" value="${sessionScope.loginUser.mbirth}" class="input_login" maxlength="8">
													</div>																			
												</div>												
												<div class="member_el">
													<div>
														<label for="inputgender" class="member_title">성별<span class="span_only"></span></label>
													</div>
													<div class="memberinfofix">							
														${sessionScope.loginUser.mgender}
														<select style="display:none" id="inputgender" name="gender_info" title="성별" value="${sessionScope.loginUser.mgender}" class="input_login">
															<option selected="selected">성별 선택</option>
															<option value="남성">남성</option>
															<option value="여성">여성</option>
														</select>														
													</div>				
												</div>		
												<div class="member_el">
													<div>
														<label for="inputphone" class="member_title">휴대전화<span class="span_only"> (필수)</span></label>
													</div>
													<div class="div_input" id="str_phone">
														<input type="text" placeholder="핸드폰번호 (-)없이 입력하세요." id="inputphone" name="phone" value="${sessionScope.loginUser.mphone}" class="input_login" maxlength="11">
													</div>					
												</div>
												<div class="err_check_msg" id="mag_phone_ok">
													필수 정보입니다.
												</div>						
												<div class="member_el">
													<div>
														<label for="sample6_postcode" class="member_title">주소<span class="span_only"> (필수)</span></label>
													</div>
													<div class="div_input" id="address_check1">
														<input type="text" onclick="sample6_execDaumPostcode()" id="sample6_postcode" name="postcode1" placeholder="우편번호를 입력해 주세요." value="${sessionScope.loginUser.mzipcode}" class="input_login" readonly="readonly">
													</div>
													<div class="postfind_ok" id="post">
														<button type="button" onclick="sample6_execDaumPostcode()" class="postfind_btn">우편번호 찾기</button>																			
													</div>
													<div class="div_input" id="address_check2">
														<input type="text" id="sample6_address" name="address1" placeholder="주소를 입력해 주세요." value="${sessionScope.loginUser.maddr}" class="input_login" readonly="readonly">
													</div>
													<div class="div_input" id="address_check3">
														<input type="text" id="sample6_address2" name="address2" placeholder="상세주소를 입력해 주세요." value="${sessionScope.loginUser.maddrdetail}" class="input_login">
													</div>						
												</div>
												<div class="err_check_msg" id="mag_add_ok">
													필수 정보입니다.
												</div>										
											</div>
											<div class="agree_btn_zone">
												<button type="button" onclick="location.href='index.bizpoll'" class="noagree_btn">수정 취소</button><button type="button" id="memberinfo_send" class="okagree_btn">회원정보 수정</button>
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
<script type="text/javascript" src="js/myinfo.js"></script>
<!-- 스크립트 끝 -->
</html>
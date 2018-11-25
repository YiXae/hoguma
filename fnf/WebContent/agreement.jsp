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
					<!-- 약관동의 영역 시작 -->
					<div class="zone_area">					
						<table>
							<tr>
								<td>
									<!-- 약관동의 내용 시작 -->
									<div id="zone_box">									
										<!-- 약관동의 타이틀 시작 -->
										<div id="contents_title">
											&nbsp;&nbsp;회원가입(약관동의)																				
										</div>
										<!-- 약관동의 타이틀 끝 -->
										<!-- 약관동의 시작 -->									
										<div class="gen_content">
											<form action="inputmemberinfo.bizpoll" name="frm_agree" id="frm_agree">
												<div class="join_title">
													Join Us :
													<div class="join_descript">'호박고구마와 자반고등어'의 회원이 되어 전국 농ㆍ수산업에 종사하시는 분들과 정보 교류를 통해 경쟁력을 키워나가시기 바랍니다.</div>
												</div>
												<table width="100%">
													<tr>
														<td width="230px" valign="top">											
															<img src="img/join_img4.png" alt="" class="img_style">											
														</td>
														<td width="40px"></td>
														<td>
															<div class="terms">
																<p class="terms_p">
																	<span class="terms_span">
																		<input type="checkbox" id="cbox" name="checkAll">
																		<label for="cbox">
																			이용약관, 개인정보 수집 및 이용, <br>
																			위치정보 이용약관(선택), 프로모션 안내 <br>
																			메일 수신(선택)에 모두 동의 합니다.
																		</label>
																	</span>
																</p>
																<ul id="terms_ul">
																	<li id="terms_ul_li1">
																		<span class="ul_li_span">
																			<input type="checkbox" id="li1box" class="ckboxs" name="checkOne">
																			<label for="li1box" class="label1">
																				'호박고구마와 자반고등어' 이용약관 동의 <span class="span_only">(필수)</span>
																			</label>
																		</span>
																		<div class="terms_box">
																			<div class="article">
																				<h3 class="article_title">여러분을 환영합니다.</h3>
																				<%@ include file="agreement/yak.jsp"%>
																			</div>
																		</div>
																	</li>
																	<li id="terms_ul_li2">
																		<span class="ul_li_span cusor" >
																			<input type="checkbox" id="li2box" class="ckboxs" name="checkTwo">
																			<label for="li2box" class="label1">
																				개인정보 수집 및 이용에 대한 안내 <span class="span_only">(필수)</span>
																			</label>
																		</span>
																		<div class="terms_box">
																			<div class="article">									
																				<%@ include file="agreement/pra.jsp"%>
																			</div>
																		</div>
																	</li>
																	<li id="terms_ul_li3">
																		<span class="ul_li_span">
																			<input type="checkbox" id="li3box" class="ckboxs" name="checkThree">
																			<label for="li3box" class="label1">
																				위치정보 이용약관 동의 <span class="span_select">(선택)</span>
																			</label>
																		</span>
																		<div class="terms_box">
																			<div class="article">									
																				<%@ include file="agreement/loc.jsp"%>
																			</div>
																		</div>
																	</li>
																	<li id="terms_ul_li4">
																		<span class="ul_li_span">
																			<input type="checkbox" id="li4box" class="ckboxs" name="checkFour">
																			<label for="li4box" class="label1">
																				이벤트 등 프로모션 알림 메일 수신 <span class="span_select">(선택)</span>
																			</label>
																		</span>							
																	</li>
																</ul>
															</div>
															<div class="agree_error">
																'호박고구마와 자반고등어'의 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해 주세요.
															</div>
															<div class="agree_btn_zone">
																<button type="button" onclick="location.href='index.bizpoll'" class="noagree_btn">비동의</button><button type="button" id="okagree" class="okagree_btn">동의</button>
															</div>
														</td>
													</tr>
												</table>										
											</form>											
										</div>									
										<!-- 약관동의 끝 -->																																		
									</div>
									<!-- 약관동의 내용 끝 -->										
								</td>
							</tr>
						</table>
					</div>
					<!-- 약관동의 영역 끝 -->
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
<script type="text/javascript" src="js/agreement.js"></script>
<!-- 스크립트 끝 -->	
</html>
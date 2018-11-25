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
											&nbsp;&nbsp;개인정보처리방침																				
										</div>
										<!-- 약관동의 타이틀 끝 -->
										<!-- 약관동의 시작 -->									
										<div class="gen_content">
											<table>
												<tr>
													<td>
														<div class="join_title">
															개인정보처리방침을 확인하여 서비스 이용에 참고해 주세요. 												
														</div>
														<table width="100%">
															<tr>
																<td width="230px" valign="top">											
																	<img src="img/join_img5.png" alt="" class="img_style">											
																</td>
																<td width="40px"></td>
																<td valign="top">
																	<div class="useagreement_terms">															
																		<ul id="terms_ul">
																			<li class="useagreement_terms_ul_li1">
																				<div class="useagree_title">
																					'호박고구마와 자반고등어' 개인정보처리방침 
																				</div>																	
																				<div class="useagreet_terms_box">
																					<div class="article">																						
																						<%@ include file="agreement/pra.jsp"%>																				   
																					</div>
																				</div>
																			</li>
																		</ul>
																	</div>
																</td>
															</tr>
														</table>							
													</td>
												</tr>
											</table>							
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
<script type="text/javascript" src="js/praviteagreement.js"></script>
<!-- 스크립트 끝 -->
</html>
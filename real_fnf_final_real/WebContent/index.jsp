<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->
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
					<!-- 메인 슬라이드 쇼 시작 -->
					<div class="zone_area">
						<!-- Start WOWSlider.com BODY section -->
						<div id="wowslider-container1">
							<div class="ws_images">
								<ul>
									<li class="slide_text"><img src="data1/images/1.png" alt="이모작의 시대" title="이모작의 시대" id="wows1_0"/>대한민국 벼농사에 이모작의 시대가 올까요?<br>기온 변화가 가져오는 곡물 생산량 변화 정보를 확인해 보세요~</li>
									<li class="slide_text"><a href="http://wowslider.net"><img src="data1/images/2.png" alt="image slider" title="열대 과일의 시대" id="wows1_1"/></a>30여년간의 대한민국 과일 생산 변동 추이를 확인하여<br>앞으로 재배할 과일을 계획해 보세요~</li>
									<li class="slide_text"><img src="data1/images/3.png" alt="참치 어획국가 대한민국" title="참치 어획국가 대한민국" id="wows1_2"/>대한민국 바다에서 참치를 어획할 수 있을까요?<br>기온 변화가 가져오는 수산물 변화 정보를 확인해 보세요~</li>
								</ul>
							</div>
							<div class="ws_bullets">
								<div>
									<a href="#" title="이모작의 시대"><span><img src="data1/tooltips/1.png" alt="이모작의 시대"/>1</span></a>
									<a href="#" title="열대 과일의 시대"><span><img src="data1/tooltips/2.png" alt="열대 과일의 시대"/>2</span></a>
									<a href="#" title="참치 어획국가 대한민국"><span><img src="data1/tooltips/3.png" alt="참치 어획국가 대한민국"/>3</span></a>
								</div>
							</div>						
						</div>	
						<script type="text/javascript" src="engine1/wowslider.js"></script>
						<script type="text/javascript" src="engine1/script.js"></script>
						<!-- End WOWSlider.com BODY section -->
					</div>
					<!-- 메인 슬라이드 쇼 끝 -->
					<div class="zone_area_space"></div>				
					<!-- 인기 농어촌 생산일지 타이틀 시작 -->
					<div class="zone_area">
						<div id="zone_area_box1">	
							<!-- 인기 농촌 생산일지 타이틀 시작 -->
							<table class="contents">
								<tr>
									<td class="contents_title1">농촌 인기 생산일지 Top 20</td>
								</tr>
							</table>
							<!-- 인기 농촌 생산일지 타이틀 끝 -->
							<!-- 인기 농촌 생산일지 타이틀 더 보기 시작 -->
							<div id="more_button">	
								<a href="bestdiary.bizpoll?opentab=a" target="_self">더 보기 >></a>	
							</div>
							<!-- 인기 농촌 생산일지 타이틀 더 보기 끝 -->	
						</div>		
						<div id="zone_area_box2">	
							<!-- 인기 어촌 생산일지 타이틀 시작 -->
							<table class="contents">
								<tr>
									<td class="contents_title1">어촌 인기 생산일지 Top 20</td>
								</tr>
							</table>
							<!-- 인기 어촌 생산일지 타이틀 끝 -->
							<!-- 인기 어촌 생산일지 타이틀 더 보기 시작 -->
							<div id="more_button">	
								<a href="bestdiary.bizpoll?opentab=b" target="_self">더 보기 >></a>
							</div>	
							<!-- 인기 어촌 생산일지 타이틀 더 보기 끝 -->
						</div>				
					</div>
					<!-- 인기 농어촌 생산일지 타이틀 끝 -->
					<div class="zone_area_space"></div>
					<div class="zone_area">
						<!-- 인기 농촌 생산일지 리스트 시작 -->
						<div id="zone_area_contents1">	
							<!-- 인기 농촌 생산일지 리스트 반복 시작 -->																						
							<c:forEach items="${bestrurallist}" var="bestRural"> <!-- <c : jstl 태그, $ : el태그 -->
								<div class="il_rep">
									<table class="ip_rep_table">
										<tr>
											<td class="img_cell">
												<c:choose>
													<c:when test="${bestRural.mphoto == null}">
														<a href="mydiary_boardviewcnt.bizpoll?bno=${bestRural.bno}"><img src="myphoto/noimg.png" id="myphoto1" width="135px" height="90px" alt="my_photo" class="uploadimg_rad"></a>
													</c:when>
													<c:otherwise>
														<a href="mydiary_boardviewcnt.bizpoll?bno=${bestRural.bno}"><img src="myphoto/${bestRural.mphoto}" id="myphoto1" width="135px" height="90px" alt="my_photo" class="uploadimg_rad"></a>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td class="table_space"></td>
										</tr>
										<tr>
											<td class="ilji_contents_info"><a href="mydiary_boardviewcnt.bizpoll?bno=${bestRural.bno}">${bestRural.btitle}</a></td>
										</tr>
										<tr>
											<td class="table_space"></td>
										</tr>
										<tr>
											<td class="ilji_contents_writer">
												<a href="javascript:;" class="js-open_my open-button_my"><b>${bestRural.bwriter}</b></a>												
											</td>
										</tr>
									</table>																		
								</div>
							</c:forEach>
							<!-- 인기 농촌 생산일지 리스트 반복 끝 -->
						</div>
						<!-- 인기 농촌 생산일지 리스트 끝 -->
						<!-- 인기 어촌 생산일지 리스트 시작 -->
						<div id="zone_area_contents2">	
							<!-- 인기 어촌 생산일지 리스트 반복 시작 -->
							<c:forEach items="${bestfishlist}" var="bestFish">
								<div class="il_rep">
									<table class="ip_rep_table">
										<tr>
											<td class="img_cell">
												<c:choose>
													<c:when test="${bestFish.mphoto == null}">
														<a href="mydiary_boardviewcnt.bizpoll?bno=${bestFish.bno}"><img src="myphoto/noimg.png" id="myphoto2" width="135px" height="90px" alt="my_photo" class="uploadimg_rad"></a>
													</c:when>
													<c:otherwise>
														<a href="mydiary_boardviewcnt.bizpoll?bno=${bestFish.bno}"><img src="myphoto/${bestFish.mphoto}" id="myphoto2" width="135px" height="90px" alt="my_photo" class="uploadimg_rad"></a>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<td class="table_space"></td>
										</tr>
										<tr>
											<td class="ilji_contents_info"><a href="mydiary_boardviewcnt.bizpoll?bno=${bestFish.bno}">${bestFish.btitle}</a></td>
										</tr>
										<tr>
											<td class="table_space"></td>
										</tr>
										<tr>
											<td class="ilji_contents_writer">
												<a href="javascript:;" class="js-open_my open-button_my"><b>${bestFish.bwriter}</b></a>												
											</td>
										</tr>
									</table>
								</div>
							</c:forEach>
							<!-- 인기 어촌 생산일지 리스트 반복 끝 -->									
						</div>	
						<!-- 인기 어촌 생산일지 리스트 끝 -->	
					</div>
					<div class="zone_area_space1"></div>
					<!-- 가장많이 검색된 농·수산물 영역 시작 -->
					<div class="zone_area">					
						<table class="ip_rep_table">
							<tr>
								<td id="chat_title">&nbsp;&nbsp;-&nbsp;가장많이 검색된 농·수산물</td>
							</tr>
							<tr>
								<td class="table_space"></td>
							</tr>
							<tr>
								<td>
									<div id="zone_area_box3">
										<!-- Tab 메뉴 시작 -->
										<div id="tab_menu">
											<table>
												<tr>
													<td id="tab_menu_td" class="active" rel="tab1">농산물</td>
													<td width="5px"></td>
													<td id="tab_menu_td" rel="tab2">수산물</td>
												</tr>										
											</table>
										</div>
										<!-- Tab 메뉴 끝 -->
										<!-- Tab 메뉴 농산물 그래프 시작(디폴트로 표시) -->
										<div id="tab1" class="tab_contents">
											11111111111111111111
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
										</div>
										<!-- Tab 메뉴 농산물 그래프 끝(디폴트로 표시) -->
										<!-- Tab 메뉴 수산물 그래프 시작(딜폴트로 숨겨짐) -->
										<div id="tab2" class="tab_contents">
											222222222222222222222
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
										</div>	
										<!-- Tab 메뉴 수산물 그래프 끝(디폴트로 숨겨짐) -->																	
									</div>									
								</td>
							</tr>
						</table>
					</div>
					<!-- 가장많이 검색된 농·수산물 영역 끝 -->
				</td>
				<!-- 1. 좌측 전체 내용 표시 영역 끝 -->			
				<!-- 2. 사이 여백 조절 영역 시작 -->
				<td id="bodyalltd2"></td>
				<!-- 2. 사이 여백 조절 영역 끝 -->
				<!-- 3. 우측 배너광고2 영역 시작 -->
				<td id="bodyalltd3">
					<%@ include file="include/bannerad.jsp"%>
				</td>
				<!-- 3. 우측 배너광고2 영역 끝 -->
			</tr>	
		</table>
		<!-- 전체 바디 3개의 영역으로 나누기 끝 -->
	</article>	
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
<script type="text/javascript" src="js/index.js"></script>
<!-- 스크립트 끝 -->
</html>
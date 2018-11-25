<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1d73404e3145312efa07680cbf12840e&libraries=services,clusterer,drawing"></script>
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
					<!-- 농산물 생산정보 내용 시작 -->
					<div id="zone_box">									
						<!-- 농산물 생산정보 타이틀 시작 -->
						<div id="contents_title" class="search_rural">
							&nbsp;&nbsp;농산물 생산정보
							<button id="search_open_rural" class="search_open_btn_rural">검색 조건 입력</button>																				
						</div>
						<!-- 농산물 생산정보 타이틀 끝 -->
						<!-- 농산물 생산정보 내용 시작 -->									
						<div class="gen_content">
							<!-- 검색 조건 시작 -->
							<div id="search_input_rural" class="hide">
								<!-- <form> -->
									<table id="searchbox_rural">
										<tr>
										 	<td class="searchboxtitle_rural">빅데이터 유형</td>
										 	<td class="searchboxtitle_rural">생산지역</td>
										 	<td class="searchboxtitle_rural">생산품목</td>
										 	<td class="searchboxtitle_rural">검색 기간</td>
										 	<td class="searchboxtitle_rural">검색</td>
										</tr>
										<tr>
											 <td class="searchboxtd_rural">											 	
												<input type="radio" id="government_rural" name="bigd" value="gover" checked="checked">
												<label for="government_rural">정부</label>
												<br>
												<br>
												<input type="radio" id="ouruser_rural" name="bigd" value="user" disabled>
												<label for="ouruser_rural">회원</label>	
											 </td>
											 <td class="searchboxtd_rural">
											 	<select id="location_rural" name="location_rural" title="생산지역" class="formstyle_rural">
													<option value="생산지역">생산지역</option>
													<option value="전국">전국</option>
													<option value="서울시">서울시</option>
													<option value="부산시">부산시</option>
													<option value="대구시">대구시</option>
													<option value="인천시">인천시</option>
													<option value="광주시">광주시</option>
													<option value="대전시">대전시</option>
													<option value="울산시">울산시</option>
													<option value="세종시">세종시</option>
													<option value="경기도">경기도</option>
													<option value="강원도">강원도</option>
													<option value="충청북도">충청북도</option>
													<option value="충청남도">충청남도</option>
													<option value="전라북도">전라북도</option>
													<option value="전라남도">전라남도</option>
													<option value="경상북도">경상북도</option>
													<option value="경상남도">경상남도</option>
													<option value="제주도">제주도</option>
												</select>
											 </td>
											 <td class="searchboxtd_rural" width="200px">											 	
											 	<form name="select_product">
												 	<select id="product" name="product" title="생산품목 선택" class="formstyle_rural" onChange="showSub(this.options[this.selectedIndex].value);">
														<option value="생산품목 선택">생산품목 선택</option>
														<option value="곡물">곡물</option>
														<option value="야채">야채</option>
														<option value="과일">과일</option>
													</select>
													<select id="product1_1" name="product1_1" title="곡물 선택" class="formstyle_rural" style="display: none;">
														<option value="곡물 선택">곡물 선택</option>
														<option value="쌀">쌀</option>
														<option value="보리">보리</option>
														<option value="현미">현미</option>
													</select>
													<select id="product1_2" name="product1_2" title="야채 선택" class="formstyle_rural" style="display: none;">
														<option value="야채 선택">야채 선택</option>
														<option value="배추">배추</option>
														<option value="고추">고추</option>
														<option value="무">무</option>
													</select>
													<select id="product1_3" name="product1_3" title="과일 선택" class="formstyle_rural" style="display: none;">
														<option value="과일 선택">과일 선택</option>
														<option value="사과">사과</option>
														<option value="오렌지">오렌지</option>
														<option value="수박">수박</option>
													</select>
												</form>
											 </td>
											 <td class="searchboxtd_rural">
											 	<select id="period_rural" name="period_rural" title="기간 선택" class="formstyle_rural">
													<option value="기간 선택">기간 선택</option>
													<option value="전체">전체</option>
													<option value="1년">1년</option>
													<option value="2년">2년</option>
													<option value="3년">3년</option>
													<option value="4년">4년</option>
													<option value="5년">5년</option>
													<option value="6년">6년</option>
													<option value="7년">7년</option>
													<option value="8년">8년</option>
													<option value="9년">9년</option>
													<option value="10년">10년</option>
													<option value="20년">20년</option>
												</select>
											 </td>
											 <td class="searchboxtd_rural" width="100px">
											 	<button id="search_to_rural" class="search_do_btn_rural">검색 실행</button>											 	
											 </td>
										</tr>
									</table>
								<!-- </form> -->
							</div>
							<!-- 검색 조건 끝 -->
							<!-- 다음지도 API 시작 -->
							<div class="map_wrap_rural">
								<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
								<div class="custom_typecontrol radius_border">
							        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
							        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
							    </div>
							</div>							
							<button onclick="panTo()" class="map_origin_rural">원위치 이동</button> 
							<!-- 다음지도 API 끝 -->
							<!-- 결과 그래프 표시 시작 -->
							<div id="search_graph_rural">
								이곳에 선택된 농산물에 대한 결과 그래프 표시<br><br>
								display none 했다가 결과 생기면 block으로 변경
							</div>
							<!-- 결과 그래프 표시 끝 -->
							<!-- 결과 분석내용 시작 -->
							<div id="search_graph_text_rural">
								이곳에 선택된 농산물에 대한 기온와 농산물 생산량의 밀접한 관계에 대한 상관분석 내용과 기온, 강수량, 가격, 표준 물가(서울버스요금) 등이 생산량에 미치는 영향에 대한 회귀분석 내용 표시<br><br>
								display none 했다가 결과 생기면 block으로 변경
							</div>
							<!-- 결과 분석내용 끝 -->
						</div>									
						<!-- 농산물 생산정보 내용 끝 -->																																	
					</div>
					<!-- 농산물 생산정보 내용 끝 -->
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
<script type="text/javascript" src="js/daummap.js"></script>
<script type="text/javascript" src="js/rural.js"></script>
<!-- 스크립트 끝 -->
</html>
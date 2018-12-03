<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bb1cb38fd36490239710319b9bbb201&libraries=clusterer"></script>
<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>

<!-- Step 2) Load billboard.js with style -->
<script src="js/billboard.js"></script>

<!-- Load with base style -->
<link rel="stylesheet" href="css/billboard.css">

<!-- Or load different theme style -->
<link rel="stylesheet" href="css/insight.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
								<div id="XAxisTimezone"></div>
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
<script>
var chart = bb.generate({
	  data: {
	    x: "x",
	    xFormat: "%Y",
	    columns: [
	    	["x", "1980", "1981", "1982", "1983", "1984", "1985",  "1986", "1987", "1988", "1989", "1990", "1991",  "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"],
			["평균기온", 11.2, 11.4, 12.4, 12.4, 11.9, 12.2, 11.6, 12.2, 11.9, 12.6, 12.9, 12, 12.2, 11.5, 12.7, 11.6, 11.6, 12.4, 13.5, 12.5, 12, 12.4, 12.5, 12.3, 12.7, 12, 12.8, 13, 12.9, 12.8, 12.6, 12.3, 12.3, 12.7, 12.9, 13.2, 13.5, 12.7],
			["총생산량", 29185, 20913,	29981, 33816, 47891, 47879, 41332, 51935, 41190, 31064, 23458, 20672, 26218, 21131, 18342, 23555, 18406, 16845, 15016, 17982, 16953, 15430, 15842, 9873, 9100, 8122, 6176, 6822, 7358, 4910, 4559, 5930, 5978, 5235, 8785, 8010, 4979, 4124]
		    ],
		    
	    axes: {
	        평균기온: "y2",
	        총생산량: "y"
	      }

	  },
	  axis: {
	    x: {
	      
	      type: "timeseries",
	      localtime: false,
	      tick: {
	        format: "%Y"
	      }
	    }

	  },
	 
	  axis: {
		  y: {
			  label: "총 생산량(t)"
			
		  },
		    y2: {
		    	label:"평균 기온(℃)",
		      show: true
		    }
		  },
	  bindto: "#XAxisTimezone"
	});
</script>
<script>
var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
    level : 14 // 지도의 확대 레벨
});

// 마커 클러스터러를 생성합니다
// 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
// 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
// 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
// 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
var clusterer = new daum.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
    minLevel: 10, // 클러스터 할 최소 지도 레벨
    disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
});

// 데이터를 가져오기 위해 jQuery를 사용합니다
// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
$.get("js/chicken.json", function(data) {
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    var markers = $(data.positions).map(function(i, position) {
        return new daum.maps.Marker({
            position : new daum.maps.LatLng(position.lat, position.lng)
        });
    });

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);
});

// 마커 클러스터러에 클릭이벤트를 등록합니다
// 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
// 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

    // 현재 지도 레벨에서 1레벨 확대한 레벨
    var level = map.getLevel()-1;

    // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
    map.setLevel(level, {anchor: cluster.getCenter()});
});

</script>
<!-- 스크립트 끝 -->
</html>
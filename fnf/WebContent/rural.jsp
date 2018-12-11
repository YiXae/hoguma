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

  <style>
.area {
    position: absolute;
    background: #fff;
    border: 1px solid #888;
    border-radius: 3px;
    font-size: 12px;
    top: -5px;
    left: 15px;
    padding:2px;
} 

.info {
    font-size: 12px;
    padding: 5px;
}
.info .title {
    font-weight: bold;
}
</style>
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
								<div id="map" style="width:100%;height:100%;"></div>
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
//지도에 폴리곤으로 표시할 영역데이터 배열입니다 
//행정구역 구분
var hole = [
  new daum.maps.LatLng(35.25870397600168, 126.7602893648317),
  new daum.maps.LatLng(35.25336749055866, 126.76370514919934),
  new daum.maps.LatLng(35.237086744385294, 126.75384980993594),
  new daum.maps.LatLng(35.2305749616062, 126.77536336904191),
  new daum.maps.LatLng(35.219798618848834, 126.79527046479062),
  new daum.maps.LatLng(35.219308075490204, 126.80622442693267),
  new daum.maps.LatLng(35.22838068097033, 126.83326454787166),
  new daum.maps.LatLng(35.240542126953436, 126.86023016689731),
  new daum.maps.LatLng(35.25005775748653, 126.87420883490995),
  new daum.maps.LatLng(35.24622186376321, 126.88632123960271),
  new daum.maps.LatLng(35.258242297147476, 126.90546612641126),
  new daum.maps.LatLng(35.250810280238255, 126.93125022176527),
  new daum.maps.LatLng(35.24065233751953, 126.93228483977386),
  new daum.maps.LatLng(35.22459112466017, 126.95184100162544),
  new daum.maps.LatLng(35.210587383944805, 126.9541268423971),
  new daum.maps.LatLng(35.20025817337315, 126.96450583100557),
  new daum.maps.LatLng(35.19050677715076, 126.95954618225724),
  new daum.maps.LatLng(35.18495238835343, 126.97212053398628),
  new daum.maps.LatLng(35.18881609408241, 126.99996890795069),
  new daum.maps.LatLng(35.17135964365156, 127.02227522372881),
  new daum.maps.LatLng(35.15549108580762, 127.00819000018984),
  new daum.maps.LatLng(35.127816211861905, 127.01183208720728),
  new daum.maps.LatLng(35.11405020295629, 126.99993185318249),
  new daum.maps.LatLng(35.10594532938534, 126.98635174542797),
  new daum.maps.LatLng(35.094987581610596, 126.98895069186884),
  new daum.maps.LatLng(35.087330690708214, 126.96304572560393),
  new daum.maps.LatLng(35.07484269163966, 126.95498651341448),
  new daum.maps.LatLng(35.07448168772764, 126.9359950127323),
  new daum.maps.LatLng(35.09168622515253, 126.92057624598804),
  new daum.maps.LatLng(35.08139050688823, 126.90453184391184),
  new daum.maps.LatLng(35.08159026824981, 126.88540282228499),
  new daum.maps.LatLng(35.07433782555615, 126.87167669963911 ),
  new daum.maps.LatLng(35.078359530473655, 126.85560924868967),
  new daum.maps.LatLng(35.06538123210497, 126.84397733255982),
  new daum.maps.LatLng(35.05237098474544, 126.80367730727927),
  new daum.maps.LatLng(35.06048816233756, 126.79156751964838),
  new daum.maps.LatLng(35.052803030606924, 126.7761033468128),
  new daum.maps.LatLng(35.06436185467372, 126.76510877384437),
  new daum.maps.LatLng(35.07268178401153, 126.77054431455787),
  new daum.maps.LatLng(35.09103305417451, 126.76187234958354),
  new daum.maps.LatLng(35.108227104512366, 126.73643742682233),
  new daum.maps.LatLng(35.10843711321382, 126.68510238383968),
  new daum.maps.LatLng(35.11328365538142, 126.65705889544111),
  new daum.maps.LatLng(35.120411856203084, 126.65165860824834),
  new daum.maps.LatLng(35.16661598258578, 126.65707845491326),
  new daum.maps.LatLng(35.169517507189376, 126.67042955076289),
  new daum.maps.LatLng(35.19226266320256, 126.65907088510308),
  new daum.maps.LatLng(35.19449167906539, 126.66960256055565),
  new daum.maps.LatLng(35.21521282130058, 126.68712233671978),
  new daum.maps.LatLng(35.20756444395869, 126.70255613945079),
  new daum.maps.LatLng(35.21238966196838, 126.71769487049146),
  new daum.maps.LatLng(35.221798690116685, 126.71847734430621),
  new daum.maps.LatLng(35.25076259421867, 126.73630100004037),
  new daum.maps.LatLng(35.25870397600168, 126.7602893648317)
]; // 전남에서 구멍낼 광주좌표

$.getJSON("map/map1.geojson", function(geojson) {

  var data = geojson.features;
  var coordinates = [];    //좌표 저장할 배열
  var name = "";            //행정 구 이름

  $.each(data, function(index, val) {

      coordinates = val.geometry.coordinates;
      name = val.properties.CTP_KOR_NM;
      
      if(val.geometry.type == "MultiPolygon"){
		    $.each(coordinates, function(index2, val2) {
		    	displayArea(val2, name);
		    }); 
      } else{
	    	displayArea(coordinates, name);        	
      }
		
  })
})
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  mapOption = { 
      center: new daum.maps.LatLng(35.840595, 127.871619), // 지도의 중심좌표
      level: 13 // 지도의 확대 레벨
  }; 

var map = new daum.maps.Map(mapContainer, mapOption),
  customOverlay = new daum.maps.CustomOverlay({}),
  infowindow = new daum.maps.InfoWindow({removable: true});


var polygons=[];    

//다각형을 생상하고 이벤트를 등록하는 함수입니다
function displayArea(coordinates, name) {

  var path = [];            //폴리곤 그려줄 path
  var points = [];        //중심좌표 구하기 위한 지역구 좌표들
  
  $.each(coordinates[0], function(index, coordinate) {        //console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
      var point = new Object(); 
      point.x = coordinate[1];
      point.y = coordinate[0];
      points.push(point);
      path.push(new daum.maps.LatLng(coordinate[1], coordinate[0]));            //new daum.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
  })
	
	
	
  var polygon;
  // 다각형을 생성합니다 
   if (name =="전라남도" && points[0].x==34.74781836495771){ 
	  // 전라남도에서 광주 구멍낼 폴리곤인 경우
  	  polygon = new daum.maps.Polygon({
          map: map, // 다각형을 표시할 지도 객체
          path: [path, hole], 
          strokeWeight: 2,
          strokeColor: '#004c80',
          strokeOpacity: 0.8,
          fillColor: '#fff',
          fillOpacity: 0.7 
      });
  } else { // 아니면 구멍 없음
	    polygon = new daum.maps.Polygon({
	        map: map, // 다각형을 표시할 지도 객체
	        path: path, 
	        strokeWeight: 2,
	        strokeColor: '#004c80',
	        strokeOpacity: 0.8,
	        fillColor: '#fff',
	        fillOpacity: 0.7 
	    });
  }
  
  // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
  // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
  daum.maps.event.addListener(polygon, 'mouseover', function() {
      polygon.setOptions({fillColor: '#09f'});


  	 customOverlay.setContent('<div class="area">' + name + '</div>');

      //customOverlay.setPosition(mouseEvent.latLng); 
      customOverlay.setMap(map); // 지역이름 띄우기
  });
  
  // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
   daum.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
      
<<<<<<< HEAD
      customOverlay.setPosition(mouseEvent.latLng);
=======
      customOverlay.setPosition(mouseEvent.latLng); 
>>>>>>> b0fd5365b6d408dfe247a4043a6977305ae7a119
  }); 

  // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
  // 커스텀 오버레이를 지도에서 제거합니다 
   daum.maps.event.addListener(polygon, 'mouseout', function() {
      polygon.setOptions({fillColor: '#fff'});
      customOverlay.setMap(null); // 지역이름 뜨는 것 사라짐
  }); 

  // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
  daum.maps.event.addListener(polygon, 'click', function(mouseEvent) {
      var content = '<div class="info">' + 
                  '   <div class="title">' + name + '</div>' +
                  '   <div class="size">총 면적 : 약 ' + Math.floor(polygon.getArea()) + ' m<sup>2</sup></area>' +
                  '</div>';

      infowindow.setContent(content); 
      infowindow.setPosition(mouseEvent.latLng); 
      infowindow.setMap(map);
  });
}

</script>
<!-- 스크립트 끝 -->
</html>
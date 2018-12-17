<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bb1cb38fd36490239710319b9bbb201&libraries=clusterer,services"></script>
<!-- Step 1) Load D3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>

<!-- Step 2) Load billboard.js with style -->
<script src="js/billboard.js"></script>

<!-- Load with base style -->
<link rel="stylesheet" href="css/billboard.css">

<!-- Or load different theme style -->
<link rel="stylesheet" href="css/insight.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
#search_graph_text_rural {
	display: none;
}

.area {
	position: absolute;
	background: #fff;
	border: 1px solid #888;
	border-radius: 3px;
	font-size: 12px;
	top: -5px;
	left: 15px;
	padding: 2px;
}

.info2 {
	font-size: 12px;
	padding: 5px;
}

.info2 .title2 {
	font-weight: bold;
}

#search_graph_rural {
	display: none;
}

.map_wrap_rural {
	display: none;
}

.search_msg {
	font-size: 15px;
	display: none;
}

/* 생산일지띄울 내용ㄷㄹ */
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
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
							<button id="search_open_rural" class="search_open_btn_rural">검색
								조건 입력</button>
						</div>
						<!-- 농산물 생산정보 타이틀 끝 -->
						<!-- 농산물 생산정보 내용 시작 -->
						<div class="gen_content">
						<span>정부통계 데이터를 통한 검색조건을 선택하거나 사용자의 생산일지 데이터를 통해 생산량을 조회하세요.</span>
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
										<td class="searchboxtd_rural"><input type="radio"
											id="government_rural" name="bigd" value="gover"
											checked="checked"> <label for="government_rural">정부통계</label>
											<br> <br> <input type="radio" id="ouruser_rural"
											name="bigd" value="user"> <label for="ouruser_rural">생산일지</label>
										</td>
										<td class="searchboxtd_rural"><select id="location_rural"
											name="location_rural" title="생산지역" class="formstyle_rural">
												<option value="지역 선택">생산지역 선택</option>
												<option value="seoul">서울시</option>
												<option value="busan">부산시</option>
												<option value="daegu">대구시</option>
												<option value="incheon">인천시</option>
												<option value="gwangju">광주시</option>
												<option value="daejeon">대전시</option>
												<option value="ulsan">울산시</option>
												<option value="sejong">세종시</option>
												<option value="gyeonggi">경기도</option>
												<option value="gangwon">강원도</option>
												<option value="chungcheongbuk">충청북도</option>
												<option value="chungcheongnam">충청남도</option>
												<option value="jeollabuk">전라북도</option>
												<option value="jeollanam">전라남도</option>
												<option value="gyeongsangbuk">경상북도</option>
												<option value="gyeongsangnam">경상남도</option>
												<option value="jeju">제주도</option>
										</select></td>
										<td class="searchboxtd_rural" width="200px">
											<form name="select_product">
												<select id="product" name="product" title="생산품목 선택"
													class="formstyle_rural"
													onChange="showSub(this.options[this.selectedIndex].value);">
													<option value="생산품목 선택">생산품목 선택</option>
													<option value="곡류">곡류</option>
													<option value="두류">두류</option>
													<option value="과실">과실</option>
													<option value="채소">채소</option>
													<option value="특용작물">특용작물</option>
												</select> <select id="product1_1" name="product1_1" title="곡류 선택"
													class="formstyle_rural select_product_name"
													style="display: none;">
													<option value="품목 선택">곡류 선택</option>
													<option value="논벼">논벼</option>
													<option value="밭벼">밭벼</option>
													<option value="겉보리">겉보리</option>
													<option value="쌀보리">쌀보리</option>
													<option value="맥주보리">맥주보리</option>
													<option value="밀">밀</option>
													<option value="호밀">호밀</option>
													<option value="조">조</option>
													<option value="수수">수수</option>
													<option value="옥수수">옥수수</option>
													<option value="메밀">메밀</option>
													<option value="기타잡곡">기타잡곡</option>
												</select> <select id="product1_2" name="product1_2" title="두류 선택"
													class="formstyle_rural select_product_name"
													style="display: none;">
													<option value="품목 선택">두류 선택</option>
													<option value="콩">콩</option>
													<option value="팥">팥</option>
													<option value="녹두">녹두</option>
													<option value="기타두류">기타두류</option>
												</select> <select id="product1_3" name="product1_3" title="과실 선택"
													class="formstyle_rural select_product_name"
													style="display: none;">
													<option value="품목 선택">과일 선택</option>
													<option value="사과">사과</option>
													<option value="배">배</option>
													<option value="복숭아">복숭아</option>
													<option value="포도">포도</option>
													<option value="감귤">감귤</option>
													<option value="감">감</option>
													<option value="단감">단감</option>
													<option value="떫은감">떫은감</option>
													<option value="자두">자두</option>
													<option value="기타">기타</option>
												</select> <select id="product1_4" name="product1_4" title="채소 선택"
													class="formstyle_rural select_product_name"
													style="display: none;">
													<option value="품목 선택">채소 선택</option>
													<option value="수박">수박</option>
													<option value="참외">참외</option>
													<option value="딸기">딸기</option>
													<option value="오이">오이</option>
													<option value="호박">호박</option>
													<option value="토마토">토마토</option>
													<option value="무">무</option>
													<option value="당근">당근</option>
													<option value="배추">배추</option>
													<option value="시금치">시금치</option>
													<option value="상추">상추</option>
													<option value="양배추">양배추</option>
													<option value="고추">고추</option>
													<option value="건고추">건고추</option>
													<option value="풋고추">풋고추</option>
													<option value="파">파</option>
													<option value="대파">대파</option>
													<option value="쪽파">쪽파</option>
													<option value="양파">양파</option>
													<option value="생강">생강</option>
													<option value="마늘">마늘</option>
													<option value="고구마">고구마</option>
													<option value="감자">감자</option>
													<option value="봄감자">봄감자</option>
													<option value="일반봄감자">일반봄감자</option>
													<option value="고랭지감자">고랭지감자</option>
													<option value="가을감자">가을감자</option>
												</select> <select id="product1_5" name="product1_5" title="특용작물 선택"
													class="formstyle_rural select_product_name"
													style="display: none;">
													<option value="품목 선택">특용작물 선택</option>
													<option value="유채">유채</option>
													<option value="참깨">참깨</option>
													<option value="들깨">들깨</option>
													<option value="땅콩">땅콩</option>
												</select>

											</form>
										</td>
										<td class="searchboxtd_rural"><select id="period_rural"
											name="period_rural" title="기간 선택" class="formstyle_rural">
												<option value="기간 선택">기간 선택</option>
												<option value="2010">2010 ~</option>
												<option value="2000">2000 ~</option>
												<option value="1990">1990 ~</option>
												<option value="1980">1980 ~</option>
										</select></td>
										<td class="searchboxtd_rural" width="100px">
											<button id="search_to_rural" class="search_do_btn_rural">검색
												실행</button>
										</td>
									</tr>
								</table>
								<!-- </form> -->
							</div>
							
							<!-- 검색 조건 끝 -->
							<span class="search_msg">지역별 최근 1년의 <b>${ProductDTO.name}</b>
								생산량을 확인하세요
							</span>
							<!-- 다음지도 API 시작 -->
							<div class="map_wrap_rural">
								<div id="map" style="width: 100%; height: 100%;"></div>
								<div class="custom_typecontrol radius_border">
									<span id="btnRoadmap" class="selected_btn"
										onclick="setMapType('roadmap')">지도</span> <span
										id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
								</div>
							</div>

							<!-- 다음지도 API 끝 -->

							<!-- 결과 그래프 표시 시작 -->
							<span class="search_msg"><b>${regionkor}</b>의 기온변화에 따른 <b>${ProductDTO.name}</b>의
								생산량 변동추이 그래프 </span>
							<div id="search_graph_rural">
								<div id="XAxisTimezone"></div>
							</div>
							<!-- 결과 그래프 표시 끝 -->
							<!-- 결과 분석내용 시작 -->
							<div id="search_graph_text_rural">
								이곳에 선택된 농산물에 대한 기온와 농산물 생산량의 밀접한 관계에 대한 상관분석 내용과 기온, 강수량, 가격, 표준
								물가(서울버스요금) 등이 생산량에 미치는 영향에 대한 회귀분석 내용 표시<br> <br>
								display none 했다가 결과 생기면 block으로 변경
							</div>
							<!-- 결과 분석내용 끝 -->
						</div>
						<!-- 농산물 생산정보 내용 끝 -->
					</div> <!-- 농산물 생산정보 내용 끝 -->
				</td>
				<!-- 1. 좌측 전체 내용 표시 영역 끝 -->
				<!-- 2. 사이 여백 조절 영역 시작 -->
				<td id="bodyalltd2"></td>
				<!-- 2. 사이 여백 조절 영역 끝 -->
				<!-- 3. 우측 배너광고 영역 시작 -->
				<td id="bodyalltd3"><%@ include file="include/bannerad.jsp"%>
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
<script type="text/javascript">

// 생산정보 검색했을 경우 사용하는 변수들



var radioval = "${radioval}"; // 검색옵션
//alert("radioval:"+radioval);

if(radioval=="gover"){// 생산정보 검색했을 경우 - 지도에 폴리곤,생산량 표시, 그래프 표시
		
		$("#search_graph_rural").css("display","block");
		$(".map_wrap_rural").css("display","block");
		$(".search_msg").css("display","block");
		

		var arr = [["x"],["평균기온"],["총생산량"]];
		
		<c:forEach items="${listToGraph}" var="item">
			arr[0].push("${item.year}");
			if("${item.temp}"==""){
				arr[1].push(null);
			}else{
				arr[1].push("${item.temp}");
			}
			if("${item.crop}"==""){
				arr[2].push(null);
			}else{
				arr[2].push("${item.crop}");
			}
		</c:forEach>
		
		
		// alert(arr);
		
		
		var chart = bb.generate({
			  data: {
			    x: "x",
			    xFormat: "%Y",
			    columns: arr 
			    	/* [
			    	["x", "1980", "1981", "1982", "1983", "1984", "1985",  "1986", "1987", "1988", "1989", "1990", "1991",  "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"],
					["평균기온", 11.2, 11.4, 12.4, null, 11.9, 12.2, "", 12.2, 11.9, 12.6, 12.9, 12, 12.2, 11.5, 12.7, 11.6, 11.6, 12.4, 13.5, 12.5, 12, 12.4, 12.5, 12.3, 12.7, 12, 12.8, 13, 12.9, 12.8, 12.6, 12.3, 12.3, 12.7, 12.9, 13.2, 13.5, 12.7],
					["총생산량", 29185, 20913,	29981, 33816, 47891, 47879, 41332, 51935, 41190, 31064, 23458, 20672, 26218, 21131, 18342, 23555, 18406, 16845, 15016, 17982, 16953, 15430, 15842, 9873, 9100, 8122, 6176, 6822, 7358, 4910, 4559, 5930, 5978, 5235, 8785, 8010, 4979, 4124]
				    ] */
				    ,
				    
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
		
		// 멀티폴리곤지역인 경우 폴리곤들 저장할 배열
		var busan = [];
		var incheon = [];
		var chungcheongnam = [];
		var jeollabuk = [];
		var jeollanam = [];
		var gyeongsangbuk = [];
		var gyeongsangnam = [];
		var jeju = [];
		
		// 생산량 최대 최소 이용해서 투명도 
		var bunmo = '${max+max-min}'*1.0;
		//alert("max:${max},min:${min},ProductDTO.seoul:${ProductDTO.seoul}");
		var seoulOpacity = ('${(ProductDTO.seoul-min+max)}'/bunmo).toFixed(2);
		var busanOpacity = ('${(ProductDTO.busan-min+max)}'/bunmo).toFixed(2);
		var daeguOpacity = ('${(ProductDTO.daegu-min+max)}'/bunmo).toFixed(2);
		var incheonOpacity = ('${(ProductDTO.incheon-min+max)}'/bunmo).toFixed(2);
		var gwangjuOpacity = ('${(ProductDTO.gwangju-min+max)}'/bunmo).toFixed(2);
		var daejeonOpacity = ('${(ProductDTO.daejeon-min+max)}'/bunmo).toFixed(2);
		var ulsanOpacity = ('${(ProductDTO.ulsan-min+max)}'/bunmo).toFixed(2);
		var sejongOpacity = ('${(ProductDTO.sejong-min+max)}'/bunmo).toFixed(2);
		var gyeonggiOpacity = ('${(ProductDTO.gyeonggi-min+max)}'/bunmo).toFixed(2);
		var gangwonOpacity = ('${(ProductDTO.gangwon-min+max)}'/bunmo).toFixed(2);
		var chungcheongbukOpacity = ('${(ProductDTO.chungcheongbuk-min+max)}'/bunmo).toFixed(2);
		var chungcheongnamOpacity = ('${(ProductDTO.chungcheongnam-min+max)}'/bunmo).toFixed(2);
		var jeollabukOpacity = ('${(ProductDTO.jeollabuk-min+max)}'/bunmo).toFixed(2);
		var jeollanamOpacity = ('${(ProductDTO.jeollanam-min+max)}'/bunmo).toFixed(2);
		var gyeongsangbukOpacity = ('${(ProductDTO.gyeongsangbuk-min+max)}'/bunmo).toFixed(2);
		var gyeongsangnamOpacity = ('${(ProductDTO.gyeongsangnam-min+max)}'/bunmo).toFixed(2);
		var jejuOpacity = ('${(ProductDTO.jeju-min+max)}'/bunmo).toFixed(2);
		
		//var testnumber = (1.0*50+1-1)/(50+50-1);
		//var testnumber2=testnumber.toFixed(2);
		//var testnumber3= ((1.0*50+1-1)/(50+50-1)).toFixed(2);
		//alert("원본:"+testnumber+",소수점변경1:"+testnumber2+",소수점변경2:"+testnumber3);
		//alert(seoulOpacity+","+busanOpacity+","+daeguOpacity+","+incheonOpacity+","+gwangjuOpacity+","+ulsanOpacity+","+chungcheongbukOpacity+","+jeollanamOpacity);
		
		
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
		
		//다각형을 생상하고 이벤트를 등록하는 함수입니다. 생산정보 검색했을 때 사용
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
		   if (name =="전라남도"){
			   if(points[0].x==34.74781836495771){ 
				  // 전라남도에서 광주 구멍낼 폴리곤인 경우
			  	  polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path, hole], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: jeollanamOpacity
			      });
			   } else{
			  	  polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: jeollanamOpacity
			      });
			   }
		  } else if(name=="인천광역시"){
			  polygon = new daum.maps.Polygon({
		          map: map, // 다각형을 표시할 지도 객체
		          path: [path], 
		          strokeWeight: 2,
		          strokeColor: '#004c80',
		          strokeOpacity: 0.8,
		          fillColor: '#FD8F10',
		          fillOpacity: incheonOpacity
		      });
		   } else if(name=="부산광역시"){
			   polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: busanOpacity
			      });
		   } else if(name=="충청남도"){
			   polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: chungcheongnamOpacity
			      });
		   } else if(name=="전라북도"){
			   polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: jeollabukOpacity 
			      }); 
		   } else if(name=="경상북도"){
			   polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: gyeongsangbukOpacity 
			      });
		   } else if(name=="경상남도"){
			   polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: gyeongsangnamOpacity
			      }); 
		   } else if(name=="제주특별자치도"){
			   polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: jejuOpacity
			      }); 
		   } else if(name=="서울특별시"){
			   polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: seoulOpacity
			      }); 
			  }else if(name=="경기도"){
				  polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: gyeonggiOpacity
			      }); 
			  }else if(name=="강원도"){
				  polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: gangwonOpacity
			      }); 
			  }else if(name=="충청북도"){
				  polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: chungcheongbukOpacity
			      }); 
			  }else if(name=="세종특별자치시"){
				  polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: sejongOpacity
			      }); 
			  }else if(name=="대전광역시"){
				  polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: daejeonOpacity
			      }); 
			  }else if(name=="대구광역시"){
				  polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: daeguOpacity
			      }); 
			  }else if(name=="울산광역시"){
				  polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: ulsanOpacity
			      }); 
			  }else if(name=="광주광역시"){
				  polygon = new daum.maps.Polygon({
			          map: map, // 다각형을 표시할 지도 객체
			          path: [path], 
			          strokeWeight: 2,
			          strokeColor: '#004c80',
			          strokeOpacity: 0.8,
			          fillColor: '#FD8F10',
			          fillOpacity: gwangjuOpacity
			      }); 
			  }
		  
		   // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
		   // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
		   daum.maps.event.addListener(polygon, 'mouseover', function() {
			   if(name=="인천광역시"){
				   $.each(incheon, function(idx, poly) {
					   poly.setOptions({fillColor: '#09f'});
					   poly.setOptions({fillOpacity: 0.7});
				   }); 
			   } else if(name=="부산광역시"){
				   $.each(busan, function(idx, poly) {
					   poly.setOptions({fillColor: '#09f'});
					   poly.setOptions({fillOpacity: 0.7});
				   }); 
			   } else if(name=="충청남도"){
				   $.each(chungcheongnam, function(idx, poly) {
					   poly.setOptions({fillColor: '#09f'});
					   poly.setOptions({fillOpacity: 0.7});
				   }); 
			   } else if(name=="전라북도"){
				   $.each(jeollabuk, function(idx, poly) {
					   poly.setOptions({fillColor: '#09f'});
					   poly.setOptions({fillOpacity: 0.7});
				   }); 
			   } else if(name=="전라남도"){
				   $.each(jeollanam, function(idx, poly) {
					   poly.setOptions({fillColor: '#09f'});
					   poly.setOptions({fillOpacity: 0.7});
				   }); 
			   } else if(name=="경상북도"){
				   $.each(gyeongsangbuk, function(idx, poly) {
					   poly.setOptions({fillColor: '#09f'});
					   poly.setOptions({fillOpacity: 0.7});
				   }); 
			   } else if(name=="경상남도"){
				   $.each(gyeongsangnam, function(idx, poly) {
					   poly.setOptions({fillColor: '#09f'});
					   poly.setOptions({fillOpacity: 0.7});
				   }); 
			   } else if(name=="제주특별자치도"){
				   $.each(jeju, function(idx, poly) {
					   poly.setOptions({fillColor: '#09f'});
					   poly.setOptions({fillOpacity: 0.7});
				   }); 
			   } else {
		       		polygon.setOptions({fillColor: '#09f'});
					polygon.setOptions({fillOpacity: 0.7});
			   }

		       customOverlay.setContent('<div class="area">' + name + '</div>');
		       
		       customOverlay.setMap(map);
		       // 지역이름 띄우기
		   });
		   
		   // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
		   daum.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
		       
		       customOverlay.setPosition(mouseEvent.latLng); 
		   }); 

		  // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
		  // 커스텀 오버레이를 지도에서 제거합니다 
		  daum.maps.event.addListener(polygon, 'mouseout', function() {
			  if(name=="인천광역시"){ // 멀티폴리곤일 경우 폴리곤 배열의 요소마다 적용시킴
				   $.each(incheon, function(idx, poly) {
					    poly.setOptions({fillColor: '#FD8F10'});
						poly.setOptions({fillOpacity: incheonOpacity});
				   }); 
			   } else if(name=="부산광역시"){
				   $.each(busan, function(idx, poly) {
					  	poly.setOptions({fillColor: '#FD8F10'});
						poly.setOptions({fillOpacity: busanOpacity});
				   }); 
			   } else if(name=="충청남도"){
				   $.each(chungcheongnam, function(idx, poly) {
					   poly.setOptions({fillColor: '#FD8F10'});
						poly.setOptions({fillOpacity: chungcheongnamOpacity});
				   }); 
			   } else if(name=="전라북도"){
				   $.each(jeollabuk, function(idx, poly) {
					   poly.setOptions({fillColor: '#FD8F10'});
						poly.setOptions({fillOpacity: jeollabukOpacity});
				   }); 
			   } else if(name=="전라남도"){
				   $.each(jeollanam, function(idx, poly) {
					   poly.setOptions({fillColor: '#FD8F10'});
						poly.setOptions({fillOpacity: jeollanamOpacity});
				   }); 
			   } else if(name=="경상북도"){
				   $.each(gyeongsangbuk, function(idx, poly) {
					   poly.setOptions({fillColor: '#FD8F10'});
						poly.setOptions({fillOpacity: gyeongsangbukOpacity});
				   }); 
			   } else if(name=="경상남도"){
				   $.each(gyeongsangnam, function(idx, poly) {
					   poly.setOptions({fillColor: '#FD8F10'});
						poly.setOptions({fillOpacity: gyeongsangnamOpacity});
				   }); 
			   } else if(name=="제주특별자치도"){
				   $.each(jeju, function(idx, poly) {
					   poly.setOptions({fillColor: '#FD8F10'});
						poly.setOptions({fillOpacity: jejuOpacity});
				   }); 
			   } else if(name=="서울특별시"){ // 여기부터 멀티폴리곤 아님
					polygon.setOptions({fillColor: '#FD8F10'});
					polygon.setOptions({fillOpacity: seoulOpacity});
				}else if(name=="경기도"){
						polygon.setOptions({fillColor: '#FD8F10'});
						polygon.setOptions({fillOpacity: gyeonggiOpacity});
				  }else if(name=="강원도"){
						polygon.setOptions({fillColor: '#FD8F10'});
						polygon.setOptions({fillOpacity: gangwonOpacity});
				  }else if(name=="충청북도"){
						polygon.setOptions({fillColor: '#FD8F10'});
						polygon.setOptions({fillOpacity: chungcheongbukOpacity});
				  }else if(name=="세종특별자치시"){
						polygon.setOptions({fillColor: '#FD8F10'});
						polygon.setOptions({fillOpacity: sejongOpacity});
				  }else if(name=="대전광역시"){
						polygon.setOptions({fillColor: '#FD8F10'});
						polygon.setOptions({fillOpacity: daejeonOpacity}); 
				  }else if(name=="대구광역시"){
						polygon.setOptions({fillColor: '#FD8F10'});
						polygon.setOptions({fillOpacity: daeguOpacity});
				  }else if(name=="울산광역시"){
						polygon.setOptions({fillColor: '#FD8F10'});
						polygon.setOptions({fillOpacity: ulsanOpacity});
				  }else if(name=="광주광역시"){
					  	polygon.setOptions({fillColor: '#FD8F10'});
						polygon.setOptions({fillOpacity: gwangjuOpacity});
				  }
		      customOverlay.setMap(null); // 지역이름 뜨는 것 사라짐
		  }); 
		 
		  // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
		  daum.maps.event.addListener(polygon, 'click', function(mouseEvent) {
		      var content = '<div class="info2">' + 
		                  '   <div class="title2">' + name + '</div>' +
		                  '   <div class="size">${name} 생산량 : 약  ';
		      if(name=="인천광역시"){
		    	  content = content +  '${ProductDTO.incheon}';
			  } else if(name=="부산광역시"){
				  content = content +  '${ProductDTO.busan}';
			  } else if(name=="충청남도"){
				  content = content +  '${ProductDTO.chungcheongnam}';
			  } else if(name=="전라북도"){
				  content = content +  '${ProductDTO.jeollabuk}';
			  } else if(name=="전라남도"){
				  content = content +  '${ProductDTO.jeollanam}';
			  } else if(name=="경상북도"){
				  content = content +  '${ProductDTO.gyeongsangbuk}';
			  } else if(name=="경상남도"){
				  content = content +  '${ProductDTO.gyeongsangnam}';
			  } else if(name=="제주특별자치도"){
				  content = content +  '${ProductDTO.jeju}';
			  } else if(name=="서울특별시"){
				  content = content +  '${ProductDTO.seoul}';
			  }else if(name=="경기도"){
				  content = content +  '${ProductDTO.gyeonggi}';
			  }else if(name=="강원도"){
				  content = content +  '${ProductDTO.gangwon}';
			  }else if(name=="충청북도"){
				  content = content +  '${ProductDTO.chungcheongbuk}';
			  }else if(name=="세종특별자치시"){
				  content = content +  '${ProductDTO.sejong}';
			  }else if(name=="대전광역시"){
				  content = content +  '${ProductDTO.daejeon}';
			  }else if(name=="대구광역시"){
				  content = content +  '${ProductDTO.daegu}';
			  }else if(name=="울산광역시"){
				  content = content +  '${ProductDTO.ulsan}';
			  }else if(name=="광주광역시"){
				  content = content +  '${ProductDTO.gwangju}';
			  }
		      
		      
		      content = content + 't</div>';

		      infowindow.setContent(content); 
		      infowindow.setPosition(mouseEvent.latLng); 
		      infowindow.setMap(map);
		  });
		  
		  // 멀티폴리곤 지역들의 폴리곤 배열에 담기
		  if(name=="인천광역시"){
			   incheon.push(polygon);
		  } else if(name=="부산광역시"){
			   busan.push(polygon);
		  } else if(name=="충청남도"){
			   chungcheongnam.push(polygon);
		  } else if(name=="전라북도"){
			   jeollabuk.push(polygon);
		  } else if(name=="전라남도"){
			   jeollanam.push(polygon);
		  } else if(name=="경상북도"){
			   gyeongsangbuk.push(polygon);
		  } else if(name=="경상남도"){
			   gyeongsangnam.push(polygon);
		  } else if(name=="제주특별자치도"){
			   jeju.push(polygon);
		  }
		} //displayArea 함수 끝
		
} // if gover 끝
		
		
	else if(radioval=="user") { // 생산일지로 검색했을 경우
		
		$(".map_wrap_rural").css("display","block");
	
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new daum.maps.LatLng(35.840595, 127.871619), // 지도의 중심좌표
		    level: 13 // 지도의 확대 레벨
		};  
		
		//지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();



		<c:forEach var="mapDto" items="${mapList}" varStatus = "status">
			/* geocoder.addressSearch('광주 동구 지산동', function(result, status) {  */
				
			geocoder.addressSearch('${mapDto.bpplace}', function(result, status) {
				
				
				// 정상적으로 검색이 완료됐으면 
				 if (status === daum.maps.services.Status.OK) {
					
					
				    var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				    
				    // 결과값으로 받은 위치를 마커로 표시합니다
				    var marker = new daum.maps.Marker({
				        map: map,
				        position: coords
				        
				    });
				
				    
				    var iwContent = '<div class="wrap">' + 
			        '    <div class="info">' + 
			        '        <div class="title">' + 
			        '            "${mapDto.bwriter}"'+"님의 생산량" + 
			        '            <div class="close" title="닫기"></div>' + 
			        '        </div>' + 
			        '        <div class="body">' + 
			        '            <div class="img">' +
			        '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			        '           </div>' + 
			        '            <div class="desc">' + 
			        '                <div class="ellipsis">${mapDto.bpplace}</div>' + 
			        '                <div>${mapDto.bmainproduct} > ${mapDto.bproduct}</div>' + 
			        '                <div>생산량 : ${mapDto.btotalproduct}kg</div>' +
			        '            </div>' + 
			        '        </div>' + 
			        '    </div>' +    
			        '</div>';
				    
	
				    
				    var overlay = new daum.maps.CustomOverlay({
				    	content: iwContent,
				    	//map: map,
				    	position: marker.getPosition()   
				    });
					    
				 	// 마커에 마우스오버 이벤트를 등록합니다
				    daum.maps.event.addListener(marker, "click", function() {
				    	//alert("등장");
				    	overlay.setMap(map);
				    	    	
				    	// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				    });
				 
				    	
				    
				   $(document).on("click", ".close", function(){
				    	overlay.setMap(null);
				    });
	
	
				}
			});
		</c:forEach>
		
	}
		

		
		



</script>
<!-- 스크립트 끝 -->
</html>
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
					<!-- 귀농/귀어 정보 내용 시작 -->
					<div id="zone_box">									
						<!-- 귀농/귀어 정보 타이틀 시작 -->
						<div id="contents_title">
							&nbsp;&nbsp;귀농·귀어 정보																				
						</div>
						<!-- 귀농/귀어 정보 타이틀 끝 -->
						<!-- 귀농/귀어 정보 Tab 메뉴 시작 -->
						<div id="contentstab_gotown_wrap">
							<div class="contentstab_gotown" class="active" rel="tab1">귀농</div>
							<div class="contentstab_gotown_2"></div>
							<div class="contentstab_gotown" rel="tab2">귀어</div>
						</div>
						<!-- 귀농/귀어 정보 Tab 메뉴 끝 -->
						<!-- 귀농 정보 시작(디폴트로 표시) -->
						<div id="tab1" class="tab_content_gotown">
							<div class="gotowninfo_title">성공적인 귀농ㆍ귀촌을 위한 7단계의 준비절차</div>
							<div class="gotowninfo_step1">
								<div class="gotowninfo_step1_text">
									<div class="gotowninfo_small_t">단계 1. 귀농 정보를 수집하자!</div>
									농업관련 기관과 단체, 농촌 지도자, 선배 귀농인을 방문하여 필요한 정보를 수집합니다.
									<br>
									<br>
									<ul>
										<li>- <a href="http://www.returnfarm.com/cmn/main/main.do" target="_blank">홈페이지</a></li>
										<li>- <a href="http://www.returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseListAjax" target="_blank">관련우수사례</a></li>
										<li>- <a href="http://www.returnfarm.com/cmn/sym/mnu/mpm/1010201/htmlMenuView.do" target="_blank">상담전화</a></li>
									</ul>
									<br>										
									<div class="gotowninfo_small_t">단계 2. 가족들과 충분한 의논을 하자!</div>
									가족들과 귀농결심에 대한 충분한 의논 후에 동의를 얻습니다.	
									<br>
									<br>									
									<div class="gotowninfo_small_t">단계 3. 어떤 작물을 기를까를 결정하자!</div>
									자신의 여건과 적성, 기술수준, 자본능력 등에 적합한 작목을 신중하게 선택합니다.
									<br>
									<br>
									<ul>
										<li>- <a href="http://www.returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=returnFarmAreaFarmingInfoListAjax" target="_blank">품목별 출하지역</a></li>
										<li>- <a href="http://soil.rda.go.kr/soil/soilmap/crop.jsp" target="_blank">재배적지</a></li>
										<li>- <a href="http://www.returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseListAjax" target="_blank">관련우수사례</a></li>
									</ul>					
								</div>								
								<div class="gotowninfo_step1_img">
									<img src="img/gotown_img2.png" class="gotown_img_style" alt="">
									<br>
									<br>
									<img src="img/gotown_img6.png" class="gotown_img_style" alt="">
								</div>
							</div>
							<div class="gotowninfo_step1">	
								<div class="gotowninfo_step1_text1">
									<div class="gotowninfo_small_t">단계 4. 영농 기술을 습득하자!</div>									
									귀농귀촌 자체교육을 포함한 귀농자 교육프로그램과 귀농에 성공한 농가 견학, 현장 체험들을 통해 충분히 영농기술을 배우고 익힙니다.
									<br>
									<br>
									<ul>
										<li>- <a href="http://www.returnfarm.com/cmn/returnFarm/module/eduAkademy/eduAkademyMain.do" target="_blank">귀농귀촌 자체 교육</a></li>
										<li>- <a href="http://www.returnfarm.com/cmn/returnFarm/module/eduAkademy/onlineList.do" target="_blank">온라인 교육</a></li>
										<li>- <a href="http://www.returnfarm.com/cmn/sym/mnu/mpm/1020201/htmlMenuView.do" target="_blank">오프라인 교육정보</a></li>
										<li>- <a href="http://www.nongsaro.go.kr/portal/portalMain.ps?menuId=PS00001" target="_blank">작목종합정보</a></li>
										<li>- <a href="http://www.returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseListAjax" target="_blank">관련우수사례</a></li>
									</ul>									
									<br>
									<div class="gotowninfo_small_t">단계 5. 어디서 정착할까 결정하자!</div>									
									자녀교육 등 생활여건과 선정된 작목에 적합한 입지조건이나 농업여건 등을 고려하여 정착지를 물색하고 결정합니다.
									<br>
									<br>
									<ul>
										<li>- <a href="http://soil.rda.go.kr/soil/soilmap/crop.jsp" target="_blank">재배적지</a></li>
										<li>- <a href="http://www.welchon.com/web/index.do" target="_blank">웰촌</a></li>
										<li>- <a href="http://www.returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseListAjax" target="_blank">관련우수사례</a></li>
									</ul>	
								</div>
							</div>						
							<div class="gotowninfo_step1">
								<div class="gotowninfo_step1_img">
									<img src="img/gotown_img1.png" class="gotown_img_style" alt="">
									<br>
									<br>
									<img src="img/gotown_img7.png" class="gotown_img_style" alt="">
								</div>
								<div class="gotowninfo_step1_text2">		
									<div class="gotowninfo_small_t">단계 6. 주택과 농지를 구매하자!</div>
									주택의 규모와 형태, 농지의 매입여부를 결정한 뒤 최소 3~4 군데를 비교 후 선택합니다.
									<br>
									<br>
									<ul>
										<li>- <a href="https://www.fbo.or.kr/" target="_blank">농지은행</a></li>
										<li>- <a href="http://www.returnfarm.com/cmn/returnFarm/locgov/locgovMain.do" target="_blank">빈집정보</a></li>
										<li>- <a href="http://www.returnfarm.com/cmn/sym/mnu/mpm/1030101/htmlMenuView.do" target="_blank">지원정책</a></li>
									</ul>
									<br>
									<div class="gotowninfo_small_t">단계 7. 영농계획을 수립하자!</div>
									농산물을 생산하여 수익을 얻을 수 있을 때까지 최소 4개월에서 길게 4~5년정도 걸리므로 초보 귀농인은 가격변동이 적고, 영농기술과 자본이 적게 드는 작목 중심으로 영농계획을 수립합니다.
									<br>
									<br>
									<ul>
										<li>- <a href="http://www.nongsaro.go.kr/portal/portalMain.ps?menuId=PS00001" target="_blank">작목별 농작업일정</a></li>
										<li>- <a href="http://www.nongsaro.go.kr/portal/portalMain.ps?menuId=PS00001" target="_blank">농산물 소득정보</a></li>
										<li>- <a href="http://www.returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseListAjax" target="_blank">관련우수사례</a></li>
									</ul>
									<br>
									- 출처 : <a href="http://www.returnfarm.com/" target="_blank">귀농귀촌종합센터</a> -		
								</div>
							</div>							
						</div>
						<!-- 귀농 정보 끝(디폴트로 표시) -->
						<!-- 귀어 정보 시작(딜폴트로 숨겨짐) -->
						<div id="tab2" class="tab_content_gotown">
							<div class="gotowninfo_title">성공적인 귀어ㆍ귀촌을 위한 10단계 준비절차</div>
							<div class="gotowninfo_step1">
								<div class="gotowninfo_step1_text">
									<div class="gotowninfo_small_t">단계 1. 정보와 기초지식을 수집하자!</div>
									어업을 시작하기 위해서는 가장 먼저 관련 정보를 수집해서 기초지식을 쌓아야 합니다. 다양한 수산관련 기관 홈페이지에서 정보를 모으고 전화 및 
									창구를 이용해 전문가와 상담을 합니다.
									<br>
									<br>																		
									<div class="gotowninfo_small_t">단계 2. 영어(營漁)교육 사전이수 및 영어(營漁)체험하자!</div>
									교육기관을 방문해 이론과 기술교육을 받고, 선도어가에게 어업체험을 해 봅니다.	
									<br>
									<br>									
									<div class="gotowninfo_small_t">단계 3. 업종을 선택하자!</div>
									경영하고자 하는 업종을 선택할 때는 자신의 여건과 적성, 기술수준, 자본능력 등에 적합한지 신중하게 검토한 후 선택해야 합니다. 
									‘어업’이라 함은 수산동식물을 포획ㆍ채취 또는 양식하는 사업을 말하며, 면허ㆍ허가ㆍ신고어업으로 구분 합니다.
									<br>
									<br>
									<div class="gotowninfo_small_t">단계 4. 기술을 습득하자!</div>									
									경영하고자 하는 업종을 선택한 후에는 그에 맞는 확실한 기술을 습득해야 합니다. 단순한 취미가 아닌 직업으로 어업을 경영하는 것이라면 더욱 
									어업기술과 노하우를 제대로 익혀두는 것이 무엇보다 중요합니다. 어업은 농업과 같이 과학기술의 진보에 따라 기술이 개발되어 있지만 어업생산의 
									기본은 생물과 자연을 상대로 이루어지는 생산 활동이므로, 책에 소개되어 있는 이론과는 확연히 다릅니다.
									<br>
									<br>
									생계를 위한 직업으로서 비교적 규모 있는 어업경영을 위해서는 실질적인 정보 수집과 현장 체험을 통한 기술 습득이 시행착오를 줄이며 단기간에 
									성공할 수 있는 최대한의 방법인 것입니다. 경영할 업종이 정해지면 정부, 지자체에서 실시하는 교육을 수료하고, 잠시 선도어가를 방문해 
									영어체험을 해보는 것이 좋습니다. 적어도 종사할 업종에 대한 한 사이클 정도의 경험을 쌓아두어야 합니다.
									<br>
									<br>
									<div class="gotowninfo_small_t">단계 5. 지역을 선정하자!</div>									
									업종 선택과 기술을 습득한 후에는 자녀교육 등 생활여건과 선정된 업종에 적합한 입지조건, 어업여건 등을 고려해 정착지를 
									물색하고 결정해야 합니다. ‘일정한 후보지역’과 ‘어떤 어업을 하고 싶은지’에 대한 것이 결정되면 후보지역에 맞는 어장과 
									부지가 있는지를 해당 지자체 및 관할 수산기술사업소에 문의해야 합니다. 
									<br>
									<br>
									또한, 가족의 동의를 얻기 위해서 생활조건도 고려할 필요가 있습니다. 정착지에 대한 정보는 해당지역의 시·도·군, 수산기술사업소에서 
									전화 문의를 통해 수집할 수도 있지만, 직접 현장을 방문하여 여러 곳을 알아보는 것이 바람직합니다. 
									<br>
									<br>
									읍면 중심지에서부터 귀어지역까지의 거리와 도로사정, 병원까지의 거리, 일용품을 살 수 있는 상점가지의 거리 등도 확인하는 것이 좋습니다. 
									도시와 비교해 교통사정 등 불편한 것이 많고, 그 동안 해왔던 도시생활과 비교하여 어촌의 생활이나 나에게 가능한 납득할 수 있는 지역인지 
									충분히 고려하고 정하는 것이 중요합니다. 어업의 특성상, 어장에 나가 조업을 하거나 양식 수산물을 돌보는 등의 일을 매일매일 해야 하므로 
									집과 어장은 가까운 거리에 있는 것이 좋습니다.
									<br>
									<br>
									<div class="gotowninfo_small_t">단계 6. 자금을 확보하자!</div>									
									업종과 지역을 선정한 후에는 어선 및 어장구입 외에 종묘와 사료 대금 등 1년간 어업을 경영하기 위해 필요한 자금과 생활자금을 확보해 두어야 합니다. 
									사전에 필요한 자금액 등 생활설계를 면밀히 세우는 것이 특히 중요한데, 가능한 자기자금을 활용하는 것이 바람직하지만, 국가에서 지원하는 귀어 
									자금 등 수산 정책 자금등을 유용하게 활용한다면 저금리로 융자를 해주는 어업인 혜택을 받으며 자금을 마련할 수 있습니다.																						
								</div>								
								<div class="gotowninfo_step1_img">
									<img src="img/gotown_img5.png" class="gotown_img_style" alt="">
									<br>
									<br>
									<img src="img/gotown_img3.png" class="gotown_img_style" alt="">
									<br>
									<br>
									<img src="img/gotown_img4.png" class="gotown_img_style" alt="">
									<br>
									<br>
									<img src="img/gotown_img8.png" class="gotown_img_style" alt="">
								</div>
							</div>
							<div class="gotowninfo_step1">	
								<div class="gotowninfo_step1_text1">
									
									<div class="gotowninfo_small_t">단계 7. 어선ㆍ어장 및 주택을 확보하자!</div>									
									어업을 경영하기 위해서는 어선과 어장을 확보해야 합니다. 국가는 바다의 일정구역에서 수산물을 포획, 양식할 수 있도록 어업인에게 허가권과 면허권을 부여합니다. 
									따라서 어업을 하기 위해서는 허가 및 면허권을 취득해야만 하고, 모든 허가와 면허는 총량제로 신규취득을 할 수 없으며 기존 허가(면허)권을 매입하는 방법으로만 
									취득할 수 있습니다.
									<br>
									<br>
									<div class="gotowninfo_small_t">단계 8. 영어 재원 마련(營漁)하자!</div>									
									자신이 선택한 업종과 그에 맞는 규모를 고려해 지역의 수산사무소 및 선도어가 등에 조언을 구해 최적화된 시설과 장비를 갖추고 어업 활동을 본격적으로 시작해야 합니다.
									<br>
									<br>
									<div class="gotowninfo_small_t">단계 9. 영어(營漁)계획을 수립하자!</div>									
									어장과 시설, 주택 등 모든 것이 확보 된 후에는, 합리적이고 치밀하게 영어계획을 세워 ‘나만의 영어계획서’를 만들어 봅니다. 사업을 시작한 후 바로 소득이 창출될 
									것이라는 부푼 기대감을 갖기보다는 그동안 해당 업종의 이론 및 체험을 통해 얻은 경험을 바탕으로, 생산계획과 판매계획, 자금계획 등을 명확히 함으로써 예측 가능한 
									경영을 계획하는 것이 중요합니다.
									<br>
									<br>
									<div class="gotowninfo_small_t">단계 10. 지역사회와 커뮤니케이션을 하자!</div>									
									1차 산업을 바탕으로 영위되는 어업의 경우는 예부터 마을 사람들끼리 교류하며 한 가족처럼 지내는 풍습이 뿌리 깊이 자리 잡고 있습니다. 이것은 산업의 특성상 공동체 의식이 
									중요하게 작용하기 때문인데, 자신의 삶의 터전이 어촌에 맞춰진 것인 만큼, 지역 주민과의 활발한 교류가 중요합니다. 
									<br>
									<br>
									공동체 의식을 중시하는 마을회의와 행사, 공동작업 등에 적극적으로 참여하고, 경우에 따라서는 일정한 역할도 맡는 등 적극적인 동참 노력이 필요합니다. 동참 노력이 필요하며, 
									먼저 인사를 하는 등 원 주민들과 교류하는 것이 필요합니다. 어촌생활과 이웃 간의 따뜻한 정 등을 생각해 이주한 경우가 아니라 직업으로서 어촌을 선택한 경우라 할지라도, 
									지역사회에 얼마나 용해될 수 있는지, 지역주민들과 잘 사귈 수 있는지의 여부가 안정적인 어촌정착의 마지막 단계가 될 것입니다.
									<br>
									<br>
									- 출처 : <a href="http://www.sealife.go.kr/index.do" target="_blank">귀어귀촌종합센터</a> -	
								</div>
							</div>	
						</div>	
						<!-- 귀어 정보 끝(딜폴트로 숨겨짐) -->																																	
					</div>
					<!-- 귀농/귀어 정보 내용 끝 -->		
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
<script type="text/javascript" src="js/gotowninfo.js"></script>
<!-- 스크립트 끝 -->
</html>
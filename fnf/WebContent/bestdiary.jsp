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
					<!-- 인기 생산일지 베스트 20 영역 시작 -->
					<div class="zone_area">					
						<table>
							<tr>
								<td>
									<!-- 인기 생산일지 베스트 20 내용 시작 -->
									<div id="zone_box">									
										<!-- 인기 생산일지 베스트 타이틀 시작 -->
										<div id="contents_title">
											&nbsp;&nbsp;인기 생산일지 Top 20																				
										</div>
										<!-- 인기 생산일지 베스트 타이틀 끝 -->
										<!-- 인기 생산일지 Tab 메뉴 시작 -->
										<div id="contentstab_best_wrap">
											<div id="t1" class="contentstab_best" class="active" rel="tab1_best">농촌</div>
											<div class="contentstab_best_2"></div>
											<div id="t2" class="contentstab_best" rel="tab2_best">어촌</div>
										</div>
										<!-- 인기 생산일지 Tab 메뉴 끝 -->
										<!-- 농촌 인기 생산일지 시작(디폴트로 표시) -->
										<div id="tab1_best" class="tab_content_best">
											11111111111111111111
											<a href="javascript:;" class="js-open_my open-button_my"><b>니들이농사를알어</b></a>
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
										<!-- 농촌 인기 생산일지 끝(디폴트로 표시) -->
										<!-- 어촌 인기 생산일지 시작(딜폴트로 숨겨짐) -->
										<div id="tab2_best" class="tab_content_best">
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
										<!-- 어촌 인기 생산일지 끝(딜폴트로 숨겨짐) -->																																	
									</div>
									<!-- 인기 생산일지 베스트 20 내용 끝 -->									
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
<script type="text/javascript" src="js/bestdiary.js"></script>	
<!-- 스크립트 끝 -->
</html>
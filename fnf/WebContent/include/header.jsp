<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>:: 농·수산 빅데이터 서비스 호박고구마와 자반고등어 ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="icon" sizes="16x16 24x24 32x32 48x48 64x64" href="favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
</head>
<body>
	<div class="topmenuani" data-scroll="true">
		<div class="top_main_menu">
			<a href="index.bizpoll" target="_self">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="rural.bizpoll" target="_self">농산물 생산정보</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="fishingvillage.bizpoll" target="_self">수산물 생산정보</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="gotowninfo.bizpoll" target="_self">귀농·귀어 정보</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
			<c:choose>
				<c:when test="${empty sessionScope.loginUser}">
					<a href="mydiary.bizpoll?opentab=d" target="_self">나의 생산일지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="login.bizpoll" target="_self">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="agreement.bizpoll" target="_self">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:when>
				<c:otherwise>
					<a href="mydiary.bizpoll?opentab=c" target="_self">나의 생산일지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="logout.bizpoll">나가기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" class="membercheck_pop">회원정보</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:otherwise>	
			</c:choose>			
			<a href="companyinfo.bizpoll" target="_self">회사소개</a>
		</div>
	</div> 
	<header>
		<!-- 전체 header 3개의 영역으로 나누기 시작
	     1. 좌측 header 내용 표시 영역
	     2. 사이 여백 조절 영역
	     3. 우측 배너광고1 영역 -->
		<table id="headerall">
			<tr>
				<!-- 1. 좌측 header 내용 표시 영역 시작 -->
				<td id="headeralltd1">
					<!-- Header 영역 시작 -->
					<div id="header_all" class="zone_area">						
						<div id="header_space1" class="zone_area"></div>
						<!-- Header 로고 영역 시작 -->
						<div id="header_logo">
							<a href="index.bizpoll" target="_self"><img src="img/main_logo.png" alt="로고"></a>
						</div>
						<!-- Header 로고 영역 끝 -->
						<!-- Header GNB 메뉴와 유틸리티 메뉴 영역 시작 -->
						<div id="header_util_zone">
							<table>
								<tr>
									<td id="header_table_td1">
										<table>
											<tr>
												<!-- Header GNB 메뉴 시작 -->
												<td id="header_table_td1_1">
													<a href="rural.bizpoll" target="_self">농산물 생산정보</a>  |  
													<a href="fishingvillage.bizpoll" target="_self">수산물 생산정보</a>  |  
													<a href="gotowninfo.bizpoll" target="_self">귀농·귀어 정보</a>  |  
													<c:choose>
														<c:when test="${empty sessionScope.loginUser}">
															<a href="mydiary.bizpoll?opentab=d" target="_self">나의 생산일지</a>&nbsp;&nbsp;
														</c:when>
														<c:otherwise>
															<a href="mydiary.bizpoll?opentab=c" target="_self">나의 생산일지</a>&nbsp;&nbsp;
														</c:otherwise>									
													</c:choose>
												</td>
												<!-- Header GNB 메뉴 끝 -->
												<!-- Header 유틸리티 메뉴 시작 -->
												<td id="header_table_td1_2">
													<c:choose>
														<c:when test="${empty sessionScope.loginUser}">
															<a href="login.bizpoll" target="_self">로그인</a>&nbsp;&nbsp;&nbsp;<a href="agreement.bizpoll" target="_self">회원가입</a>&nbsp;
														</c:when>
														<c:otherwise>
															<a href="logout.bizpoll">나가기</a>&nbsp;&nbsp;&nbsp;<a href="#" class="membercheck_pop">회원정보</a>&nbsp;
														</c:otherwise>									
													</c:choose>
													<a href="companyinfo.bizpoll" target="_self">회사소개</a>
												</td>
												<!-- Header 유틸리티 메뉴 끝 -->
											</tr>							
										</table>
									</td>
								</tr>
								<tr>
									<!-- Header 환영문구 시작 -->
									<td id="header_table_td2">										
										<c:choose>
											<c:when test="${empty sessionScope.loginUser}">
												<span id="span_text_guest">Guest</span>님 로그인 해 주세요~ (<span id="span_text_crom">본 사이트는 크롬 브라우저에 최적화 되었습니다.</span>)
											</c:when>
											<c:otherwise>
												<span id="span_text_guest">${sessionScope.loginUser.mnick}</span>님 방문을 환영합니다.! (<span id="span_text_crom">본 사이트는 크롬 브라우저에 최적화 되었습니다.</span>)
											</c:otherwise>									
										</c:choose>
									</td>
									<!-- Header 환영문구 끝 -->
								</tr>
							</table>
						</div>
						<!-- Header GNB 메뉴와 유틸리티 메뉴 영역 끝 -->
						<!-- Header 인포메이션 영역 시작-->
						<div id="header_infotext_zone" class="zone_area">
							<table>
								<tr>
									<td id="header_table_td3"></td>
								</tr>
								<tr>
									<!-- Header 인포메이션 타이틀 시작-->
									<td id="header_table_td4">빅데이터 농·수산 생산량 변동 정보</td>
									<!-- Header 인포메이션 타이틀 끝-->
								</tr>
								<tr>
									<!-- Header 인포메이션 내용 시작-->
									<td id="header_table_td5">농·수산물의 생산량이 기온과 강수량 변화에따라 어떻게 변해왔는지 한눈에 확인하세요~</td>
									<!-- Header 인포메이션 내용 끝-->
								</tr>
								<tr>
									<td id="header_table_td6"></td>
								</tr>
							</table>
						</div>
						<!-- Header 인포메이션 영역 끝 -->
					</div>
					<!-- Header 영역 끝 -->				
				</td>
				<!-- 1. 좌측 header 내용 표시 영역 끝 -->			
				<!-- 2. 사이 여백 조절 영역 시작 -->
				<td id="headeralltd2"></td>
				<!-- 2. 사이 여백 조절 영역 끝 -->
				<!-- 3. 우측 배너광고1 영역 시작 -->
				<td id="headeralltd3"></td>
				<!-- 3. 우측 배너광고1 영역 끝 -->
			</tr>	
		</table>
		<!-- header 3개의 영역으로 나누기 끝 -->
	</header>
</body>
</html>
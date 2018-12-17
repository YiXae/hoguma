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
											<div id="t1" onclick="location.href='bestdiary.bizpoll?opentab=a'" class="contentstab_best" class="active" rel="tab1_best">농촌</div>
											<div class="contentstab_best_2"></div>
											<div id="t2" onclick="location.href='bestdiary.bizpoll?opentab=b'" class="contentstab_best" rel="tab2_best">어촌</div>
										</div>
										<!-- 인기 생산일지 Tab 메뉴 끝 -->
										<!-- 농촌 인기 생산일지 시작(디폴트로 표시) -->
										<div id="tab1_best" class="tab_content_best">											
											<table width="100%" id="list_table_list1">
												<tr style="border-bottom: 1px solid #dddddd;">
													<th width="60px">번호</th>
													<th>제목</th>
													<th width="120px">작성자</th>
													<th width="120px">작성일</th>
													<th width="50px">좋아요</th>
													<th width="50px">조회</th>
													<th width="50px">댓글</th>
												</tr>								
												<c:forEach items="${boardListBest}" var="bDto">
												<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
												<fmt:formatDate value="${bDto.bregdate}" pattern="yyyy-MM-dd" var="regdate2"/>
													<tr class="tstyle1">
														<td class="title_td">${bDto.bno}</td>
														<td class="title_td_left">											
															<a href="mydiary_boardviewcnt.bizpoll?bno=${bDto.bno}">											
																<c:if test="${today2==regdate2}">
																	<img src="img/board_new.png" alt="" style="vertical-align: middle"> 												
																</c:if>
																<c:if test="${bDto.bfilesize > 0}"><i class="fa fa-paperclip"></i></c:if>
																[<span <c:out value="${bDto.bkind=='생산일지'?'class=textcolor_bkind1':'class=textcolor_bkind2'}"/>>${bDto.bkind}</span>]&nbsp;${bDto.btitle}																					
															</a>																					
														</td>
														<td class="title_td_left">
															<span class="list_detail_title">
																<a href="javascript:;" class="js-open_my open-button_my"><b>${bDto.bwriter}</b></a>
															</span>	
														</td>
														<td class="title_td">
															<c:choose>
																<c:when test="${today2==regdate2}">
																	<fmt:formatDate pattern="HH:mm:ss" value="${bDto.bregdate}"/>
																</c:when>
																<c:otherwise>
																	<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.bregdate}"/>
																</c:otherwise>
															</c:choose>
														</td>
														<td class="title_td">${bDto.bgoodcnt}</td>
														<td class="title_td">${bDto.bviewcnt}</td>
														<td class="title_td">${bDto.breplycnt}</td>
													</tr>
												</c:forEach>
											</table>							
											<div class="hr">
											
											</div>																						
										</div>
										<!-- 농촌 인기 생산일지 끝(디폴트로 표시) -->
										<!-- 어촌 인기 생산일지 시작(딜폴트로 숨겨짐) -->
										<div id="tab2_best" class="tab_content_fish">											
											<table width="100%" id="list_table_list2">
												<tr style="border-bottom: 1px solid #dddddd;">
													<th width="60px">번호</th>
													<th>제목</th>
													<th width="120px">작성자</th>
													<th width="120px">작성일</th>
													<th width="50px">좋아요</th>
													<th width="50px">조회</th>
													<th width="50px">댓글</th>
												</tr>								
												<c:forEach items="${boardListBest}" var="bDto">
												<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
												<fmt:formatDate value="${bDto.bregdate}" pattern="yyyy-MM-dd" var="regdate2"/>
													<tr class="tstyle1">
														<td class="title_td">${bDto.bno}</td>
														<td class="title_td_left">											
															<a href="mydiary_boardviewcnt.bizpoll?bno=${bDto.bno}">											
																<c:if test="${today2==regdate2}">
																	<img src="img/board_new.png" alt="" style="vertical-align: middle"> 												
																</c:if>
																<c:if test="${bDto.bfilesize > 0}"><i class="fa fa-paperclip"></i></c:if>
																[<span <c:out value="${bDto.bkind=='생산일지'?'class=textcolor_bkind3':'class=textcolor_bkind2'}"/>>${bDto.bkind}</span>]&nbsp;${bDto.btitle}																					
															</a>																					
														</td>
														<td class="title_td_left">
															<span class="list_detail_title">
																<a href="javascript:;" class="js-open_my open-button_my"><b>${bDto.bwriter}</b></a>
															</span>	
														</td>
														<td class="title_td">
															<c:choose>
																<c:when test="${today2==regdate2}">
																	<fmt:formatDate pattern="HH:mm:ss" value="${bDto.bregdate}"/>
																</c:when>
																<c:otherwise>
																	<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.bregdate}"/>
																</c:otherwise>
															</c:choose>
														</td>
														<td class="title_td">${bDto.bgoodcnt}</td>
														<td class="title_td">${bDto.bviewcnt}</td>
														<td class="title_td">${bDto.breplycnt}</td>
													</tr>
												</c:forEach>
											</table>							
											<div class="hrfish">
											
											</div>																						
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
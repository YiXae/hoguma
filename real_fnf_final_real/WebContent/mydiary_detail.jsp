<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<% String prevurl = request.getHeader("referer"); %>
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
					<!-- 나의 생산일지 내용 시작 -->
					<div id="zone_box">									
						<!-- 나의 생산일지 타이틀 시작 -->
						<div id="contents_title">
							&nbsp;&nbsp;나의 생산일지																				
						</div>
						<!-- 나의 생산일지 타이틀 끝 -->	
						<!-- 나의 생산일지 시작(디폴트로 표시) -->
						<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
            			<fmt:formatDate value="${boardview.bregdate}" pattern="yyyy-MM-dd" var="regdate2"/> 
						<div class="my_detail_zone">
							<div class="my_detail_zone_box">
								<div class="detail_title_div">
									게시글 번호 : ${boardview.bno}번<br>
									<span class="detail_title"><c:if test="${today2==regdate2}"><img src="img/board_new.png" alt="" style="vertical-align: middle;">&nbsp;</c:if>${boardview.btitle}</span>
									<input type="hidden" id="bno_tran" value="${boardview.bno}">
									<input type="hidden" id="mno_tran" value="${sessionScope.loginUser.mno}">
									<input type="hidden" id="breply_tran" value="${boardview.breplycnt}">
									<input type="hidden" id="bfile_tran" value="${boardview.bfilename}">
								</div>									
								<div id="border1">
								
								</div>
								<div id="border2">
								           					
									[ <a href="javascript:;" class="js-open_my open-button_my"><b><span style="font-family: 'Nanum Gothic Coding', monospace;">${boardview.bwriter}</span></b></a> ]&nbsp;&nbsp;게시글 : <span style="color: red;">${boardview.bkind}</span>&nbsp;&nbsp;&nbsp;공개 : <span style="color: red;">${boardview.bopen}</span>&nbsp;&nbsp;&nbsp;조회 : <span style="color: red;">${boardview.bviewcnt}</span>&nbsp;&nbsp;&nbsp;댓글 : <span style="color: red;">${boardview.breplycnt}</span>&nbsp;&nbsp;&nbsp;
									작성 : 
									<span style="color: red;">
										<c:choose>
											<c:when test="${today2 == regdate2}">
												<fmt:formatDate  pattern="HH:mm:ss" value="${boardview.bregdate}"/>
											</c:when>
											<c:otherwise>
												 <fmt:formatDate  pattern=" yyyy-MM-dd " value="${boardview.bregdate}"/>
											</c:otherwise>
										</c:choose>
									</span>
								</div>
								<input type="hidden" id="bkindtext" value="${boardview.bkind}">
								<div class="detail_ilji">
									<table class="detail_ilji_table">
										<tr>
											<td class="detail_ilji_td"><strong>생산지 :</strong> ${boardview.bpplace}</td>
										</tr>
										<tr>
											<td class="detail_ilji_td_back"><strong>생산물 :</strong> ${boardview.bitema} > ${boardview.bmainproduct} > ${boardview.bproduct}</td>
										</tr>
										<tr>
											<td class="detail_ilji_td"><strong>생산일 :</strong> ${boardview.bpbirth}</td>											
										</tr>
										<tr>
											<td class="detail_ilji_td_back"><strong>생산량 :</strong> ${boardview.btotalproduct} kg</td>
										</tr>
										<tr>
											<td class="detail_ilji_td"><strong>판매가 :</strong> ${boardview.bprice} 만원</td>
										</tr>
										<tr>
											<td class="detail_ilji_td_back"><strong>판매처 :</strong> ${boardview.bsplace}</td>
										</tr>
									</table>
								</div>
								<div id="detail_contents" class="detail_style">
									<div>
										${boardview.bcontent}
									</div>
									<c:if test="${sessionScope.loginUser.mno == null}">
										<div class="liked">
											<button type="button" id="likebutton" class="btn_like nomember" disabled="disabled">
												<span class="img_emoti">좋아요</span>
												<span class="ani_heart_m"></span>
											</button>	
											<span class="rec_count good_text_ct"></span>
											<br>
											좋아요 기능은 로그인 후 사용 가능합니다.									
										</div>														
									</c:if>
									<c:if test="${sessionScope.loginUser.mno != null}">
										<div class="liked">
											<button type="button" id="likebutton" class="btn_like yesmember">
												<span class="img_emoti">좋아요</span>
												<span class="ani_heart_m"></span>
											</button>	
											<span class="rec_count good_text_ct"></span>
										</div>										
									</c:if>			
									<c:if test="${boardview.bfilesize > 0}">
										<div class="fileup">		
											<i class="fa fa-paperclip"></i> <a href="download.bizpoll?file=${boardview.bfilename}">${boardview.bfilename}</a> / ${boardview.bfilesize}
											(<fmt:formatNumber type="number" pattern="0.0" value="${boardview.bfilesize/1024}"></fmt:formatNumber>kb)</a>									
										</div>
									</c:if>															
								</div>								
								<div id="border1">
								
								</div>
								<div id="border3">
								
									<div class="buttonleft">
										<button onClick="location.href='<%=prevurl%>'" class="go_list_btn">목록으로</button>
										<%-- <input type="hidden" onClick="location.href = document.referrer;" id="referer_list" name="referer_list">
										<c:if test="${sessionScope.loginUser.mnick == boardview.bwriter}">
									    	<button onclick="location.href='mydiary_write.bizpoll'" class="reply_btn">답글 작성</button>
									    </c:if> --%>
									</div>
									<div class="buttonright">
										<c:if test="${sessionScope.loginUser.mnick == boardview.bwriter}">
									    	<button onclick="location.href='mydiary_write.bizpoll'" class="write_btn">일지 작성</button>
											<button onclick="location.href='boardUpdate.bizpoll?bno=${boardview.bno}'" class="change_btn">수정</button>
											<button id="del_board" class="del_btn">삭제</button>
									    </c:if>								
									</div>
								</div>
							</div>
							<div id="commentList"></div>
						</div>														
					</div>				
					<!-- 나의 생산일지 내용 끝 -->
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
<script type="text/javascript" src="js/mydiary_detail.js"></script>
<!-- 스크립트 끝 -->
</html>
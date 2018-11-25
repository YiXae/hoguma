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
</head>
<body>
	
	<!--댓글 영역 -->
	<div id="reply_list_header">총 댓글 수 : ${replyList.size()}</div>
	<c:if test="${replyList.size() == 0}">
		<div class="comment_rep_no" id="co4">
			작성된 <span style="color: orange;">댓글</span>이 없습니다.
		</div>
	</c:if>
	<c:if test="${replyList.size() != 0}">
		<c:forEach items="${replyList}" var="replyview">
			<div class="comment_rep" id="co3">
				<div class="comment_text_area">
					<div class="comment_writer">
						<a href="javascript:;" class="js-open_my open-button_my" id="acolor">
						<b><span style="font-family: 'Nanum Gothic Coding', monospace;">
						<c:if test="${today2==regdate2}">
							<img src="img/board_new_rp.png" alt="" style="vertical-align: middle;">
						</c:if>
						<c:choose>
					    	<c:when test="${sessionScope.loginUser.mnick== replyview.writer}">
					    		<span style="color: #723d77;">${replyview.writer}</span>
					    	</c:when>
					    	<c:otherwise>
					    		${replyview.writer}
					    	</c:otherwise>					    	
				    	</c:choose>						
						</span></b></a>&nbsp;
						<c:choose>
					    	<c:when test="${today2 == regdate2}">
					    		[ <fmt:formatDate pattern="HH:mm:ss" value="${replyview.regdate}"/> ]
					    	</c:when>
					    	<c:otherwise>
					    		[ <fmt:formatDate pattern="yy-MM-dd" value="${replyview.regdate}"/> ]
					    	</c:otherwise>					    	
				    	</c:choose>
				    	<c:if test="${sessionScope.loginUser.mnick== replyview.writer}">
					    	<div class="comment_writer_btn">
								<a href="#" class="com_change_btn" data_num="${replyview.rno}">수정</a>&nbsp;|&nbsp;<a href="#" class="com_del_btn" data_num="${replyview.rno}">삭제</a>								
							</div>
						</c:if>
					</div>						
				</div>
				<c:choose>
			    	<c:when test="${sessionScope.loginUser.mnick== replyview.writer}">
			    		<div class="comment_text_area_text_me">
							${replyview.content}
						</div>
			    	</c:when>
			    	<c:otherwise>
			    		<div class="comment_text_area_text_other">
							${replyview.content}
						</div>
			    	</c:otherwise>					    	
		    	</c:choose>
			</div>	
		</c:forEach>
	</c:if>
	<!--댓글 영역 -->
	
	<!--댓글 로그인 여부-->
	<div class="rwriter_error">
		내용을 입력해주세요.															
	</div>	
	<div id="reply_wrap">
		<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<div class="comment_back" id="co5">
					로그인을 해야 댓글작성이 가능합니다.						
				</div>
			</c:when>					
			<c:otherwise>
				<form method="POST" name="frm_reply" id="frm_reply">
					<section class="reply_section">						
						<div class="comment_back" id="co6">	
							<div class="comment_zone">
								<div id="rwriter">&nbsp;${sessionScope.loginUser.mnick}</div>								
									<textarea id="commentnum" maxlength="300" name="commentnum" onkeyup="len_commentc()" class="commentzones" style="resize: none;" placeholder="300자로 댓글을 달아주세요."></textarea>
									<span id="commentc">0</span>/300자 까지 입력 가능								
							</div>
							<div class="commentbuttonleft">
								<button class="commentwrite_btn" id="btn_insertrply">댓글 달기</button>
							</div>	
							<input type="hidden" id="re_writer" name="re_writer" value="${sessionScope.loginUser.mnick}">
							<input type="hidden" id="re_bno" name="re_bno">	
							<input type="hidden" id="bno_tran" name="bno_tran" value="${boardview.bno}">
						</div>						
					</section>					
				</form>			
			</c:otherwise>
		</c:choose>
	</div> 
</body>
<!-- 스크립트 시작 -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>	
<script type="text/javascript" src="js/mydiary_commentlist.js"></script>
<!-- 스크립트 끝 -->
</html>
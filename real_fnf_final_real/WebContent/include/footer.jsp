<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>		
	<footer>
		<!-- Footer 시작 -->
		<div id="footer_area_zone">
			<div id="footer_area_info" class="zone_area_footer">
				<table>
					<tr>
						<td id="footer_table_td1" class="text_ani">© 2018 호박고구마와 자반고등어</td>
						<td id="footer_table_td4"><button type="button" onclick="location.href='praviteagreement.bizpoll'" class="footer_pri_btn">개인정보처리방침</button><button type="button" onclick="location.href='useagreement.bizpoll'" class="footer_pri_btn1">이용약관</button></td>
						<td id="footer_table_td2">※ 본 정보제공 서비스의 모든 콘텐츠는 호박고구마와 자반고등어에 귀속되어 있으며 무단으로 사용할 수 없습니다.</td>
						<td width="20px"></td>
						<td id="footer_table_td3"><a href="#" target="_blank"><img src="img/sns_face.png" alt=""></a><a href="#" target="_blank"><img src="img/sns_insta.png" alt=""></a></td>
					</tr>
				</table>
				 
				<!-- 화면 위아래 이동 버튼 시작 -->
				<div id="up" class="goupbtn">
					<img src="img/go_up_btn.png" width="27px" height="25px" alt="위로 이동">
				</div>
				<div id="down" class="godownbtn">
					<img src="img/go_down_btn.png" width="27px" height="25px" alt="아래로 이동">
				</div>
				<!-- 화면 위아래 이동 버튼 끝 -->
			</div>
		</div>	
		<!-- Footer 끝 -->
		<!-- 회원 관련 레이어 팝업 시작 -->
		<%@ include file="../myinfopop.jsp"%>
		<%@ include file="../membercheck.jsp"%>
		<%@ include file="../memberdelete_check.jsp"%>					
		<!-- 회원 관련 레이어 팝업 끝 -->	
		
		<!-- 게시판 관련 레이어 팝업 시작 -->
		<%@ include file="../mydiary_del_check.jsp"%>				
		<!-- 게시판 관련 레이어 팝업 끝 -->	
	</footer>
</body>
<!-- 스크립트 시작 -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>					
<!-- 스크립트 끝 -->
</html>
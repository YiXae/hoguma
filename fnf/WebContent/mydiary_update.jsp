<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>				
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
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
							&nbsp;&nbsp;나의 생산일지 수정																				
						</div>
						<!-- 나의 생산일지 타이틀 끝 -->						
						<!-- 나의 생산일지 시작(디폴트로 표시) -->											
						<div class="my_detail_zone">							
							<form id="frm_boardwrite" name="frm_boardwrite" action="boardinsertplay.bizpoll" method="POST" enctype="multipart/form-data">
								<div class="detail_ilji">
									<table class="write_ilji_table">
										<tr>
											<td class="write_ilji_table_td1">&nbsp;&nbsp;<strong>제목</strong></td>
											<td class="write_ilji_table_td2">: 
												<input type="hidden" id="write_board" name="write_board" value="${sessionScope.loginUser.mnick}">
												<input type="hidden" id="bbno" name="bbno" value="${boardview.bno}">
												<input type="hidden" id="pplace" name="pplace" value="${sessionScope.loginUser.maddr}">
												<input type="text" id="write_title_p" name="write_title_p" value="${boardview.btitle}" class="formstyle_write2">
											</td>
										</tr>
									</table>									
									<div class="writer_error">
										필수정보 입니다.															
									</div>
									<table class="write_ilji_table">
										<tr>
											<td class="write_ilji_table_td1">&nbsp;&nbsp;<strong>공개</strong></td>
											<td class="write_ilji_table_td2">: 
												<select id="board_open" name="board_open" title="게시글 공개설정" class="formstyle_write1">
													<option value="게시글 공개설정">게시글 공개설정</option>
													<option value="비공개" <c:if test="${boardview.bopen.equals('비공개')}">selected</c:if>>비공개</option>														
													<option value="공개" <c:if test="${boardview.bopen.equals('공개')}">selected</c:if>>공개</option>
												</select>												
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="writer_error">
													필수정보 입니다.															
												</div>
											</td>											
										</tr>										
										<tr>
											<td class="write_ilji_table_td1">&nbsp;&nbsp;<strong>게시글</strong></td>
											<td class="write_ilji_table_td2">: 
												<select id="board_kind" name="board_kind" title="게시글 종류" class="formstyle_write1 formselect2">
													<option value="게시글 종류">게시글 종류</option>																											
													<option value="일반글" <c:if test="${boardview.bkind.equals('일반글')}">selected</c:if>>일반글</option>
													<option value="생산일지" <c:if test="${boardview.bkind.equals('생산일지')}">selected</c:if>>생산일지</option>
												</select>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="writer_error">
													필수정보 입니다.															
												</div>
											</td>											
										</tr>										
									</table>									
									<div class="write_ilji_table_box">
										<table class="write_ilji_table">
											<tr>
												<td class="write_ilji_table_td1"></td>
												<td class="write_ilji_table_td2">																											
													<div class="write_td_div2">&nbsp;&nbsp;<strong>생산품 :</strong>&nbsp;&nbsp;</div>
													<div class="write_td_div3">
														<input type="hidden" id="bitemval" value="${boardview.bitem}">
														<select id="item_sel" name="item_sel" class="formstyle_write4">
															<option value="대분류 선택">대분류 선택</option>
															<option value="농산물">농산물</option>
															<option value="수산물">수산물</option>
														</select>
														<input type="hidden" id="bmainval" value="${boardview.bmainproduct}">
														<select id="mainproduct" name="mainproduct" class="formstyle_write4">
														  <option class="대분류 선택" value="중분류 선택">중분류 선택</option>
														  <option class="농산물" value="곡물">곡물</option>
														  <option class="농산물" value="야채">야채</option>
														  <option class="농산물" value="과일">과일</option>
														  <option class="수산물" value="어류">어류</option>
														  <option class="수산물" value="연체동물">연체동물</option>
														  <option class="수산물" value="해조류">해조류</option>
														</select>
														<input type="hidden" id="bpval" value="${boardview.bproduct}">
														<select id="product" name="product" class="formstyle_write4">
														  <option class="중분류 선택" value="소분류 선택">소분류 선택</option>
														  <option class="곡물" value="쌀">쌀</option>
														  <option class="곡물" value="보리">보리</option>
														  <option class="곡물" value="현미">현미</option>
														  <option class="야채" value="배추">배추</option>
														  <option class="야채" value="상추">상추</option>
														  <option class="야채" value="시금치">시금치</option>
														  <option class="과일" value="사과">사과</option>
														  <option class="과일" value="수박">수박</option>
														  <option class="과일" value="딸기">딸기</option>
														  <option class="어류" value="고등어">고등어</option>
														  <option class="어류" value="참치">참치</option>
														  <option class="어류" value="갈치">갈치</option>
														  <option class="연체동물" value="오징어">오징어</option>
														  <option class="연체동물" value="문어">문어</option>
														  <option class="연체동물" value="낙지">낙지</option>
														  <option class="해조류" value="김">김</option>
														  <option class="해조류" value="미역">미역</option>
														  <option class="해조류" value="파래">파래</option>														  
														</select>													 
													</div>
													<div class="writer_error" id="selone">
														필수정보 입니다.															
													</div>																										
													<div id="divclear" class="write_td_div2">&nbsp;&nbsp;<strong>생산량 :</strong>&nbsp;&nbsp;</div>
													<div class="write_td_div3">
														<input type="text" id="totalproduct" name="totalproduct" value="${boardview.btotalproduct}" class="formstyle_write1"> kg											
													</div>
													<div class="writer_error">
														필수정보 입니다.															
													</div>	
													<div class="write_td_div2">&nbsp;&nbsp;<strong>생산일 :</strong>&nbsp;&nbsp;</div>
													<div class="write_td_div3">
														<input type="text" id="productbrith" name="productbrith" value="${boardview.bpbirth}" class="formstyle_write1"> 예) 20180101											
													</div>
													<div class="writer_error">
														필수정보 입니다.															
													</div>												
													<div class="write_td_div2">&nbsp;&nbsp;<strong>판매가 :</strong>&nbsp;&nbsp;</div>
													<div class="write_td_div3">
														<input type="text" id="productprice" name="productprice" value="${boardview.bprice}" class="formstyle_write1"> 만원													
													</div>
													<div class="writer_error">
														필수정보 입니다.															
													</div>
													<div class="write_td_div5">&nbsp;&nbsp;<strong>판매처 :</strong>&nbsp;&nbsp;</div>
													<div class="write_td_div4">
														<input type="text" id="productsaler" name="productsaler" value="${boardview.bsplace}" maxlength="20" class="formstyle_write1">													
													</div>
													<div class="writer_error">
														필수정보 입니다.															
													</div>			
												</td>
											</tr>																		
										</table>										
									</div>						
									<div id="border4">
								
									</div>																		
									<div class="write_ilji_table_td5" id="text_width">											
										<textarea id="textAreaContent" name="textAreaContent" class="formstyle_write2">${boardview.bcontent}</textarea>										
										<script type="text/javascript">
										 
										var oEditors = [];
										nhn.husky.EZCreator.createInIFrame({
										    oAppRef: oEditors,
										    elPlaceHolder: "textAreaContent",
										    sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
										    fCreator: "createSEditor2"
										});
										 
										//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
										function submitContents(elClickedObj) {
										    // 에디터의 내용이 textarea에 적용된다.
										    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
										 
										    // 에디터의 내용에 대한 값 검증은 이곳에서
										    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
										  
										    try {
										        elClickedObj.form.submit();
										    } catch(e) {
										     
										    }
										}
										
										// textArea에 이미지 첨부
										function pasteHTML(filepath){
										    var sHTML = '<img src="<%=request.getContextPath()%>/smarteditor/Webserver_imgup/'+filepath+'">';
										    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
										}
										 
										</script>																	
									</div>
									<table class="write_ilji_table">
										<tr>
											<td class="write_file_td"> 												
												<input type="file" name="uploadfile" id="uploadfile" style="display:none;">
												<label for="uploadfile" class="go_list_btn">파일선택</label>
												<input type="button" class="btn btn-file" value="파일선택" style="display:none;">
												<span class="file" id="file-name" style="height:20px; border:none;">${boardview.bfilename}</span>
												<i class="fa fa-close" id="close_btn" style="with: 10px; cursor: pointer;"></i>
												<input type="hidden" id="fffilesize" name="fffilesize" value="${boardview.bfilesize}">
												<input type="hidden" id="now-file-name" name="now-file-name">
												<input type="hidden" id="now-file-size" name="now-file-size">
											</td>
										</tr>										
									</table>
									<div class="writer_cuation">
										&nbsp;&nbsp;* 파일첨부는 선택이며 최대 5MB를 초과할 수 없습니다.															
									</div>									
									<div id="border4">
								
									</div>												
									<div id="border1">
								
									</div>
									<div id="border3">										
										<div class="buttonleft"><button onClick="history.go(-1); return false;" class="go_list_btn">목록으로</button></div>
										<div class="buttonright"><button class="write_btn" id="ilji_update_btn">일지 수정</button></div>
									</div>
								</div>
							</form>
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
<script type="text/javascript" src="js/mydiary_update.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src='//rawgit.com/tuupola/jquery_chained/master/jquery.chained.min.js'></script>
<script type="text/javascript">
$("#mainproduct").chained("#item_sel");
$("#product").chained("#mainproduct");
</script>
<!-- 스크립트 끝 -->
</html>
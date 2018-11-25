<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path %>/smarteditor/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>								
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
							<form id = "frm_insert" name ="frm_insert" action="boardUpadteplay.bizpoll?bno=${boardview.bno}" method="POST" enctype="multipart/form-data">
								<table class="write_ilji_table">
									<tr>
										<td class="write_ilji_table_td1">&nbsp;&nbsp;<strong>제목</strong></td>
										<td class="write_ilji_table_td2">: 
											<input type="hidden" id="write_board" name="write_board" value="${sessionScope.loginUser.mnick}">
											<input type="hidden" id="pplace" name="pplace" value="${sessionScope.loginUser.maddr}">
											<input type="text" id="write_title_p" name="write_title_p" value="${boardview.bopen}" class="formstyle_write2">
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
												<option value="비공개">비공개</option>														
												<option value="공개">공개</option>
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
										<td class="write_ilji_table_td1">&nbsp;&nbsp;<strong>품목</strong></td>
										<td class="write_ilji_table_td2">: 
											<select id="board_item" name="board_item" title="품목 선택" class="formstyle_write1 formselect1">
												<option value="품목 선택">품목 선택</option>
												<option value="농산물">농산물</option>														
												<option value="수산물">수산물</option>
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
												<option value="일반글">일반글</option>
												<option value="생산일지">생산일지</option>
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
												 	<select id="mainproduct" name="mainproduct" title="농산물 선택" class="formstyle_write1 product_1_select mainproduct" onChange="showSub(this.options[this.selectedIndex].value);">
														<option value="농산물 선택">농산물 선택</option>
														<option value="곡물">곡물</option>
														<option value="야채">야채</option>
														<option value="과일">과일</option>
													</select>
													<select id="product1_1" name="product" title="곡물 선택" class="formstyle_write1 product_2_select product" style="display: none;">
														<option value="곡물 선택">곡물 선택</option>
														<option value="쌀">쌀</option>
														<option value="보리">보리</option>
														<option value="현미">현미</option>
													</select>
													<select id="product1_2" name="product" title="야채 선택" class="formstyle_write1 product_3_select product" style="display: none;">
														<option value="야채 선택">야채 선택</option>
														<option value="배추">배추</option>
														<option value="고추">고추</option>
														<option value="무">무</option>
													</select>
													<select id="product1_3" name="product" title="과일 선택" class="formstyle_write1 product_4_select product" style="display: none;">
														<option value="과일 선택">과일 선택</option>
														<option value="사과">사과</option>
														<option value="오렌지">오렌지</option>
														<option value="수박">수박</option>
													</select>																											
												</div>
												<div class="writer_error">
													필수정보 입니다.															
												</div>
												<div class="write_td_div2">&nbsp;&nbsp;<strong>생산량 :</strong>&nbsp;&nbsp;</div>
												<div class="write_td_div3">
													<input type="text" id="totalproduct" name="totalproduct" value="${boardview.btotalproduct}" class="formstyle_write1"> kg											
												</div>
												<div class="writer_error">
													필수정보 입니다.															
												</div>	
												<div class="write_td_div2">&nbsp;&nbsp;<strong>생산일 :</strong>&nbsp;&nbsp;</div>
												<div class="write_td_div3">
													<input type="text" id="productbrith" name="productbrith" value="${boardview.bproductbrith}" class="formstyle_write1"> 예) 20180101											
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
								<div class="write_ilji_table_box1">
									<table class="write_ilji_table">
										<tr>
											<td class="write_ilji_table_td1"></td>
											<td class="write_ilji_table_td2">																											
												<div class="write_td_div2">&nbsp;&nbsp;<strong>생산품 :</strong>&nbsp;&nbsp;</div>
												<div class="write_td_div3">																											
												 	<select id="mainproduct_fish" name="mainproduct" title="생산품목 선택" class="formstyle_write1 product_1_select mainproduct" onChange="showSub(this.options[this.selectedIndex].value);">
												 		<option value="생산품목 선택">생산품목 선택</option>
														<option value="어류">어류</option>
														<option value="연체동물">연체동물</option>
														<option value="해조류">해조류</option>
													</select>
													<select id="product1_1_fish" name="product" title="어류 선택" class="formstyle_write product" style="display: none;">
														<option value="어류 선택">어류 선택</option>
														<option value="고등어">고등어</option>
														<option value="갈치">갈치</option>
														<option value="부시리">부시리</option>
													</select>
													<select id="product1_2_fish" name="product" title="연체동물 선택" class="formstyle_write product" style="display: none;">
														<option value="연체동물 선택">연체동물 선택</option>
														<option value="낙지">낙지</option>
														<option value="오징어">오징어</option>
														<option value="문어">문어</option>
													</select>
													<select id="product1_3_fish" name="product" title="해조류 선택" class="formstyle_write product" style="display: none;">
														<option value="해조류 선택">해조류 선택</option>
														<option value="김">김</option>
														<option value="파래">파래</option>
														<option value="미역">미역</option>
													</select>																									
												</div>
												<div class="writer_error">
													필수정보 입니다.															
												</div>
												<div class="write_td_div2">&nbsp;&nbsp;<strong>생산량 :</strong>&nbsp;&nbsp;</div>
												<div class="write_td_div3">
													<input type="text" id="totalproduct1" name="totalproduct" value="${boardview.btotalproduct}" class="formstyle_write1"> kg											
												</div>
												<div class="writer_error">
													필수정보 입니다.															
												</div>	
												<div class="write_td_div2">&nbsp;&nbsp;<strong>생산일 :</strong>&nbsp;&nbsp;</div>
												<div class="write_td_div3">
													<input type="text" id="productbrith1" name="productbrith" value="${boardview.bproductbrith}" class="formstyle_write1"> 예) 20180101											
												</div>
												<div class="writer_error">
													필수정보 입니다.															
												</div>												
												<div class="write_td_div2">&nbsp;&nbsp;<strong>판매가 :</strong>&nbsp;&nbsp;</div>
												<div class="write_td_div3">
													<input type="text" id="productprice1" name="productprice" value="${boardview.bprice}" class="formstyle_write1"> 만원													
												</div>
												<div class="writer_error">
													필수정보 입니다.															
												</div>
												<div class="write_td_div5">&nbsp;&nbsp;<strong>판매처 :</strong>&nbsp;&nbsp;</div>
												<div class="write_td_div4">
													<input type="text" id="productsaler1" name="productsaler" value="${boardview.bsplace}" class="formstyle_write1">													
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
									<textarea id="content_board" name="content_board">${boardview.bcontent}</textarea>	
									<script type="text/javascript">
										var oEditors = [];
										nhn.husky.EZCreator.createInIFrame({
											oAppRef: oEditors,
											elPlaceHolder: "content_board",
											sSkinURI:"<%=path%>/smarteditor/dist/SmartEditor2Skin.html",
											fCreator: "createSEditor2"
										});											
									</script>								
								</div>
								<table class="write_ilji_table">
									<tr>
										<td class="write_file_td"> 												
											<input type="file" name="uploadfile" id="uploadfile" style="display:none;">
											<label for="uploadfile" class="go_list_btn">파일선택</label>
											<input type="button" class="btn btn-file" value="파일선택" style="display:none;">
											<span class="file" id="file-name" style="height:20px; border:none;">${boardview.bfilename}"</span>
											<i class="fa fa-close" id="close_btn" style="display:none; with:10px; cursor:pointer;"></i>
											<input type="hidden" id="now-file-name" name="now-file-name">
											<input type="hidden" id="now-file-size" name="now-file-size">
										</td>
									</tr>										
								</table>
								<div class="writer_cuation">
									&nbsp;&nbsp;* 파일은 첨부는 선택이며 최대 5MB를 초과할 수 없습니다.															
								</div>									
								<div id="border4">
							
								</div>												
								<div id="border1">
							
								</div>
								<div id="border3">
									<div class="buttonleft"><button onclick="location.href='mydiary.bizpoll'" class="go_list_btn">목록으로</button></div>
									<div class="buttonright"><button class="write_btn" id="ilji_write_btn">일지 작성</button></div>
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
<!-- 스크립트 끝 -->
</html>
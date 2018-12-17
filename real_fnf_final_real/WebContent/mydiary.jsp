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
					<!-- 나의 생산일지 내용 시작 -->
					<div id="zone_box">									
						<!-- 나의 생산일지 타이틀 시작 -->
						<div id="contents_title">
							&nbsp;&nbsp;나의 생산일지																				
						</div>
						<!-- 나의 생산일지 타이틀 끝 -->
						<!-- 나의 생산일지 Tab 메뉴 시작 -->
						<div id="contentstab_my_wrap">
							<table width="564px">								
								<tr>
									<c:choose>
										<c:when test="${empty sessionScope.loginUser}">
											<td width="180px">
												
											</td>
											<td>
												<div id="mytab_space_2" class="contentstab_my_2"></div>
											</td>
											<td>
												<div id="mytab2" onclick="location.href='mydiary.bizpoll?opentab=d'" class="contentstab_my" class="active" rel="tab2">전체 농산물 생산일지</div>
											</td>
										</c:when>
										<c:otherwise>
											<td width="180px">
												<div id="mytab1" onclick="location.href='mydiary.bizpoll?opentab=c&mnick=${sessionScope.loginUser.mnick}'" class="contentstab_my" class="active" rel="tab1">나의 생산일지</div>
											</td>
											<td>
												<div id="mytab_space_2" class="contentstab_my_2"></div>
											</td>
											<td>
												<div id="mytab2" onclick="location.href='mydiary.bizpoll?opentab=d'" class="contentstab_my" rel="tab2">전체 농산물 생산일지</div>
											</td>
										</c:otherwise>
									</c:choose>									
									<td>
										<div id="mytab_space_2" class="contentstab_my_2"></div>
									</td>
									<td>
										<div id="mytab3" onclick="location.href='mydiary.bizpoll?opentab=e'" class="contentstab_my" rel="tab3">전체 수산물 생산일지</div>
									</td>
								</tr>					
							</table>							
						</div>
						<!-- 나의 생산일지 Tab 메뉴 끝 -->
						<!-- 나의 생산일지 시작(디폴트로 표시) -->								
						<c:choose>
							<c:when test="${empty sessionScope.loginUser}">
								
							</c:when>
							<c:otherwise>								
								<div id="tab1" class="tab_content_my">
									<div id="myinfo_area">
										<form action="" method="post" name="insertinfo" id="insertinfo" enctype="multipart/form-data">
											<div id="myinfo_photoarea">
												<span><img src="myphoto/${myintro.mphoto}" id="myphoto" width="135px" height="90px" alt="my_photo"></span>
												<div class="filebox"> 
													<label for="ex_file">등록/수정</label> 
													<input type="file" id="ex_file" name="ex_file"> 
												</div>																
											</div>
											<div id="myinfo_info">
												<table>
													<tr>
														<td class="myinfotd">닉네임 : <b>${myintro.mnick}</b><input type="hidden" id="moreinfonick" name="moreinfonick" value="${sessionScope.loginUser.mnick}"></td>
													</tr>
													<tr>
														<td class="myinfotd">거주지 : ${myintro.maddr}</td>
													</tr>
													<tr>
														<td class="myinfotd">
															이메일 : 
															<select id="emailopen" name="emailopen" class="doformstyle1">
																<option value="공개 선택" <c:if test="${myintro.midopen.equals('')}">selected</c:if>>공개 선택</option>
																<option value="y" <c:if test="${myintro.midopen.equals('y')}">selected</c:if>>공개</option>
																<option value="n" <c:if test="${myintro.midopen.equals('n')}">selected</c:if>>비공개</option>																
															</select>																											
														</td>
													</tr>
													<tr>
														<td class="myinfotd">
															휴대폰 :
															<select id="phoneopen" name="phoneopen" class="doformstyle1">
																<option value="공개 선택" <c:if test="${myintro.mphoneopen.equals('')}">selected</c:if>>공개 선택</option>
																<option value="y" <c:if test="${myintro.mphoneopen.equals('y')}">selected</c:if>>공개</option>
																<option value="n" <c:if test="${myintro.mphoneopen.equals('n')}">selected</c:if>>비공개</option>																
															</select>									
														</td>
													</tr>
													<tr>
														<td class="myinfotd" style="padding-top: 5px;">															
														 	<select id="doing" name="doing" title="직종" class="doformstyle">
																<option value="직종 선택" <c:if test="${myintro.mjob.equals('')}">selected</c:if>>직종 선택</option>
																<option value="농부" <c:if test="${myintro.mjob.equals('농부')}">selected</c:if>>농부</option>
																<option value="어부" <c:if test="${myintro.mjob.equals('어부')}">selected</c:if>>어부</option>
																<option value="일반" <c:if test="${myintro.mjob.equals('일반')}">selected</c:if>>일반</option>
															</select>
														</td>
													</tr>
												</table>
											</div>
											<div id="myinfo_intro">
												<textarea id="text_content_my" maxlength="150" name="contents" onkeyup="len_chk()" class="textzones" placeholder="150자로 간단한 자기소개를 적어주세요.">${myintro.mintro}</textarea>													
												<span id="text_counter_my">0</span>/150자 까지 입력 가능
											</div>						
											<div id="hrdiv"><hr></div>
											&nbsp;<span class="myimgstyle">* 대표 이미지는 가로 135 픽셀, 세로 90 픽셀(135 X 90)로 만들어 등록해 주세요.</span>
											<button id="myinfo_save_btn">저장</button>
										</form>
									</div>
									<!-- 리스트 시작 -->
									<div class="diary_header">
										<table width="100%">
											<tr>
												<td id="cbtd3_chk">
													<div class="chk_all">
														<input type="checkbox" id="allCheck" name="allCheck" onclick="allChk(this)" class="chkstyle">														 														
													</div>
													<div class="chk_all_text"><label for="allCheck" class="check_all_list_text">전체 선택</label></div>										
													<div class="wrap_zone">												
														<input type="hidden" id="regdate" value="${bDto.bregdate}">	
														<input type="hidden" id="kind" value="${bDto.bkind}">														
														<input type="hidden" value="${code}" id="code">
														<input type="hidden" value="${bkind}" id="bkindyear">
														<input type="hidden" value="${bregdate}" id="yearselect">	
														<input type="hidden" value="${sessionScope.loginUser.mnick}" id="nickname" name="nickname">																																														
														<div id="select_kind_1">
															<select id="selectkindmy" name="selectkindmy" title="검색 조건" class="sformstyle">
																<option value="1" <c:if test="${flag.equals('1')}">selected</c:if>>제목+내용</option>
																<option value="2" <c:if test="${flag.equals('2')}">selected</c:if>>제목</option>
																<option value="3" <c:if test="${flag.equals('3')}">selected</c:if>>내용</option>																
															</select>
														</div>
														<div id="input_keyword_zone">
															<input type="text" id="search_keywordmy" class="sformstyle2"  alt="" placeholder="검색어를 입력해 주세요."><button id="searchmy_btn">검색</button>
														</div>
														<div id="select_order">
															<select id="selectordermy" name="selectordermy" onchange="orderSelectmy()" class="sformstyle1">													
																<option value="new" <c:if test="${code.equals('new')}">selected</c:if>>전체 정렬(최신순)</option>													
																<option value="good" <c:if test="${code.equals('good')}">selected</c:if>>좋아요순</option>
																<option value="cnt" <c:if test="${code.equals('cnt')}">selected</c:if>>조회순</option>
																<option value="reply" <c:if test="${code.equals('reply')}">selected</c:if>>댓글순</option>
															</select>																																	
														</div>
														<div id="select_kind">
															<select id="selectkind1my" name="selectkind1my" onchange="kindmy()" class="sformstyle">											
																<option value="all" <c:if test="${bopen.equals('all')}">selected</c:if>>전체 종류</option>							
																<option value="생산일지" <c:if test="${bkind.equals('생산일지')}">selected</c:if>>생산일지</option>
																<option value="일반글" <c:if test="${bkind.equals('일반글')}">selected</c:if>>일반글</option>
																<option value="공개" <c:if test="${bopen.equals('공개')}">selected</c:if>>공개</option>
																<option value="비공개" <c:if test="${bopen.equals('비공개')}">selected</c:if>>비공개</option>																
															</select>
														</div>
													</div>								
												</td>
												<td id="cbtd4">
													<select id="selectyearmy" name="selectyearmy" onchange="yearmy()" class="sformstyle">
														<option value="all" <c:if test="${bregdate.equals('all')}">selected</c:if>>전체 연도</option>
														<option value="18" <c:if test="${bregdate.equals('18')}">selected</c:if>>2018년</option>
														<%-- <option value="19" <c:if test="${bregdate.equals('19')}">selected</c:if>>2019년</option>
														<option value="20" <c:if test="${bregdate.equals('20')}">selected</c:if>>2020년</option> --%>
													</select>
												</td>
											</tr>
										</table>								
										<div class="list_space">
												
										</div>	
										<form action="" method="post" name="frm_boarddel" id="frm_boarddel">									
											<table width="100%" id="list_table_list1">
												<tr style="border-bottom: 1px solid #dddddd;">
													<th width="60px">선택</th>
													<th width="60px">번호</th>
													<th>제목</th>												
													<th width="120px">작성일</th>
													<th width="50px">좋아요</th>
													<th width="50px">조회</th>
													<th width="50px">댓글</th>
												</tr>								
												<c:forEach items="${boardList}" var="bDto">
												<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
												<fmt:formatDate value="${bDto.bregdate}" pattern="yyyy-MM-dd" var="regdate2"/>													
													<tr class="tstyle1">
														<td class="title_td">	
															<input type="hidden" id="bwritersel" name="bwritersel" value="${bDto.bwriter}" class="chkstyle">
															<input type="hidden" id="mnicksel" name="mnicksel" value="${sessionScope.loginUser.mnick}" class="chkstyle">														
															<input type="checkbox" id="RowCheck" name="RowCheck" value="${bDto.bno}" class="chkstyle">														
														</td>
														<td class="title_td">${bDto.bno}</td>
														<td class="title_td_left">											
															<a href="mydiary_boardviewcnt.bizpoll?bno=${bDto.bno}">											
																<c:if test="${today2==regdate2}">
																	<img src="img/board_new.png" alt="" style="vertical-align: middle"> 												
																</c:if>
																<c:if test="${bDto.bfilesize > 0}"><i class="fa fa-paperclip"></i></c:if>
																[<span <c:out value="${bDto.bitem=='농산물'?'class=textcolor_bitem1':'class=textcolor_bitem2'}"/>>${bDto.bitem}</span>, <span <c:out value="${bDto.bkind=='생산일지'?'class=textcolor_bkind1':'class=textcolor_bkind2'}"/>>${bDto.bkind}</span>, <span <c:out value="${bDto.bopen=='비공개'?'class=textcolor_bopen1':'class=textcolor_bopen2'}"/>>${bDto.bopen}</span>]&nbsp;${bDto.btitle}																					
															</a>																					
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
										</form>							
										<div class="hr">
										
										</div>
										<div class="bord_list_paging_my">
											<div class="mylist_del"><button class="del_list_btn">삭제</button></div>											
											<div class="mylist_write"><button onclick="location.href='mydiary_write.bizpoll'" class="write_btn" >일지 작성</button></div>											
											<div class="hr_space">
										
											</div>
											<table class="pagination">
												<tr>
													<td>
														<ul class="pagination_paging">
															<c:if test="${pageMakermy.prev}">
																<li onclick="location.href='mydiary.bizpoll?opentab=c&mnick=${sessionScope.loginUser.mnick}&page=${pageMakermy.startPage - 1}';">
																	&laquo;					
																</li>
																<li onclick="location.href='mydiary.bizpoll?opentab=c&mnick=${sessionScope.loginUser.mnick}&page=${pageMakermy.firstPage}';">
																	${pageMakermy.firtstPage}
																</li>
																<li>
																	/
																</li>						               
												            </c:if>
												            <c:forEach begin="${pageMakermy.startPage}" end="${pageMakermy.endPage}" var="idx">
												                <li <c:out value="${pageMakermy.criDto.page == idx? 'class=active':''}"/> onclick="location.href='mydiary.bizpoll?opentab=c&mnick=${sessionScope.loginUser.mnick}&page=${idx}&flag=${flag}&keyword=${keyword}&key=${code}&bkind=${bkind}&bopen=${bopen}&bregdate=${bregdate}';">
												                	${idx} 							               
												            	</li>
												            </c:forEach>
												           	<c:if test="${pageMakermy.next}">
												           		<li>
																	/
																</li>	
												           		<li onclick="location.href='mydiary.bizpoll?opentab=c&mnick=${sessionScope.loginUser.mnick}&page=${pageMakermy.finalPage}';">
																	${pageMakermy.finalPage}
																</li>
																<li onclick="location.href='mydiary.bizpoll?opentab=c&mnick=${sessionScope.loginUser.mnick}&page=${pageMakermy.endPage + 1}';">
																	&raquo;
																</li>							           
												            </c:if>
											        	</ul>
													</td>
												</tr>
											</table>
										</div>
										<c:if test="${not empty keyword}">
											<div class="search_result_board">[&nbsp;&nbsp;<span style="color: red">${keyword}</span>&nbsp;&nbsp;]에 대한 검색 결과가 총 [&nbsp;&nbsp;<span style="color: red">${pageMakermy.totalCount}</span>&nbsp;&nbsp;]개 나왔습니다.&nbsp;&nbsp;<a href="mydiary.bizpoll?opentab=c&mnick=${sessionScope.loginUser.mnick}" target="_self"><span style="color: orange;">리스트 전체보기</span></a></div>				
										</c:if>
									</div>
								</div>						
							</c:otherwise>
						</c:choose>
						<div id="tab2" class="tab_content_my">
							<table width="100%">
								<tr>
									<td id="cbtd3">										
										<div class="wrap_zone">												
											<input type="hidden" id="regdate" value="${bDto.bregdate}">	
											<input type="hidden" id="kind" value="${bDto.bkind}">
											<input type="hidden" value="${code}" id="code">
											<input type="hidden" value="${bkind}" id="bkindyear">
											<input type="hidden" value="${bregdate}" id="yearselect">	
											<input type="hidden" value="${sessionScope.loginUser.mnick}" id="nickname" name="nickname">																																	
											<div id="select_kind_1">
												<select id="selectkind" name="selectkind" title="검색 조건" class="sformstyle">
													<option value="1" <c:if test="${flag.equals('1')}">selected</c:if>>제목+내용</option>
													<option value="2" <c:if test="${flag.equals('2')}">selected</c:if>>제목</option>
													<option value="3" <c:if test="${flag.equals('3')}">selected</c:if>>내용</option>
													<option value="4" <c:if test="${flag.equals('4')}">selected</c:if>>작성자</option>
												</select>
											</div>
											<div id="input_keyword_zone">
												<input type="text" id="search_keyword" class="sformstyle2" alt="" placeholder="검색어를 입력해 주세요."><button id="search_btn">검색</button>
											</div>
											<div id="select_order">
												<select id="selectorder" name="selectorder" onchange="orderSelect()" class="sformstyle1">													
													<option value="new" <c:if test="${code.equals('new')}">selected</c:if>>전체 정렬(최신순)</option>													
													<option value="good" <c:if test="${code.equals('good')}">selected</c:if>>좋아요순</option>
													<option value="cnt" <c:if test="${code.equals('cnt')}">selected</c:if>>조회순</option>
													<option value="reply" <c:if test="${code.equals('reply')}">selected</c:if>>댓글순</option>
												</select>																																	
											</div>
											<div id="select_kind">
												<select id="selectkind1" name="selectkind1" onchange="kind()" class="sformstyle">											
													<option value="all" <c:if test="${bkind.equals('all')}">selected</c:if>>전체 종류</option>
													<option value="생산일지" <c:if test="${bkind.equals('생산일지')}">selected</c:if>>생산일지</option>
													<option value="일반글" <c:if test="${bkind.equals('일반글')}">selected</c:if>>일반글</option>
												</select>
											</div>
										</div>								
									</td>
									<td id="cbtd4">
										<select id="selectyear" name="selectyear" onchange="year()" class="sformstyle">
											<option value="all" <c:if test="${bregdate.equals('all')}">selected</c:if>>전체 연도</option>
											<option value="18" <c:if test="${bregdate.equals('18')}">selected</c:if>>2018년</option>
											<%-- <option value="19" <c:if test="${bregdate.equals('19')}">selected</c:if>>2019년</option>
											<option value="20" <c:if test="${bregdate.equals('20')}">selected</c:if>>2020년</option> --%>
										</select>
									</td>
								</tr>
							</table>								
							<div class="list_space">
									
							</div>
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
								<c:forEach items="${boardList}" var="bDto">
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
							<div class="bord_list_paging">
								<table class="pagination">
									<tr>
										<td>
											<ul class="pagination_paging">
												<c:if test="${pageMakerrural.prev}">
													<li onclick="location.href='mydiary.bizpoll?opentab=d&page=${pageMakerrural.startPage - 1}';">
														&laquo;					
													</li>
													<li onclick="location.href='mydiary.bizpoll?opentab=d&page=${pageMakerrural.firstPage}';">
														${pageMakerrural.firtstPage}
													</li>
													<li>
														/
													</li>						               
									            </c:if>
									            <c:forEach begin="${pageMakerrural.startPage}" end="${pageMakerrural.endPage}" var="idx">
									                <li <c:out value="${pageMakerrural.criDto.page == idx? 'class=active':''}"/> onclick="location.href='mydiary.bizpoll?opentab=d&page=${idx}&flag=${flag}&keyword=${keyword}&key=${code}&bkind=${bkind}&bregdate=${bregdate}';">
									                	${idx} 							               
									            	</li>
									            </c:forEach>
									           	<c:if test="${pageMakerrural.next}">
									           		<li>
														/
													</li>	
									           		<li onclick="location.href='mydiary.bizpoll?opentab=d&page=${pageMakerrural.finalPage}';">
														${pageMakerrural.finalPage}
													</li>
													<li onclick="location.href='mydiary.bizpoll?opentab=d&page=${pageMakerrural.endPage + 1}';">
														&raquo;
													</li>							           
									            </c:if>
								        	</ul>
										</td>
									</tr>
								</table>
							</div>
							<c:if test="${not empty keyword}">
								<div class="search_result_board">[&nbsp;&nbsp;<span style="color: red">${keyword}</span>&nbsp;&nbsp;]에 대한 검색 결과가 총 [&nbsp;&nbsp;<span style="color: red">${pageMakerrural.totalCount}</span>&nbsp;&nbsp;]개 나왔습니다.&nbsp;&nbsp;<a href="mydiary.bizpoll?opentab=d" target="_self"><span style="color: orange;">리스트 전체보기</span></a></div>				
							</c:if>																
						</div>
						<!-- 전체 농산물 생산일지 끝(디폴트로 숨겨짐) -->
						<!-- 전체 수산물 생산일지 시작(딜폴트로 숨겨짐) -->
						<div id="tab3" class="tab_content_fish">
							<table width="100%">
								<tr>
									<td id="cbtd3fish">										
										<div class="wrap_zone">												
											<input type="hidden" id="regdate" value="${bDto.bregdate}">	
											<input type="hidden" id="kind" value="${bDto.bkind}">
											<input type="hidden" value="${code}" id="code">
											<input type="hidden" value="${bkind}" id="bkindyear">
											<input type="hidden" value="${bregdate}" id="yearselect">	
											<input type="hidden" value="${sessionScope.loginUser.mnick}" id="nickname" name="nickname">																																	
											<div id="select_kind_1">
												<select id="selectkindfish" name="selectkindfish" title="검색 조건" class="sformstyle">
													<option value="1" <c:if test="${flag.equals('1')}">selected</c:if>>제목+내용</option>
													<option value="2" <c:if test="${flag.equals('2')}">selected</c:if>>제목</option>
													<option value="3" <c:if test="${flag.equals('3')}">selected</c:if>>내용</option>
													<option value="4" <c:if test="${flag.equals('4')}">selected</c:if>>작성자</option>
												</select>
											</div>
											<div id="input_keyword_zone">
												<input type="text" id="search_keywordfish" class="sformstyle2" alt="" placeholder="검색어를 입력해 주세요."><button id="searchfish_btn">검색</button>
											</div>
											<div id="select_order">
												<select id="selectorderfish" name="selectorderfish" onchange="orderSelectfish()" class="sformstyle1">
													<option value="new" <c:if test="${code.equals('new')}">selected</c:if>>전체 정렬(최신순)</option>													
													<option value="good" <c:if test="${code.equals('good')}">selected</c:if>>좋아요순</option>
													<option value="cnt" <c:if test="${code.equals('cnt')}">selected</c:if>>조회순</option>
													<option value="reply" <c:if test="${code.equals('reply')}">selected</c:if>>댓글순</option>
												</select>																																	
											</div>
											<div id="select_kind">
												<select id="selectkind1fish" name="selectkind1fish" onchange="kindfish()" class="sformstyle">											
													<option value="all" <c:if test="${bkind.equals('all')}">selected</c:if>>전체 종류</option>
													<option value="생산일지" <c:if test="${bkind.equals('생산일지')}">selected</c:if>>생산일지</option>
													<option value="일반글" <c:if test="${bkind.equals('일반글')}">selected</c:if>>일반글</option>
												</select>
											</div>
										</div>								
									</td>
									<td id="cbtd4fish">
										<select id="selectyearfish" name="selectyearfish" onchange="yearfish()" class="sformstyle">
											<option value="all" <c:if test="${bregdate.equals('all')}">selected</c:if>>전체 연도</option>
											<option value="18" <c:if test="${bregdate.equals('18')}">selected</c:if>>2018년</option>
											<%-- <option value="19" <c:if test="${bregdate.equals('19')}">selected</c:if>>2019년</option>
											<option value="20" <c:if test="${bregdate.equals('20')}">selected</c:if>>2020년</option> --%>
										</select>
									</td>
								</tr>
							</table>								
							<div class="list_space">
									
							</div>
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
								<c:forEach items="${boardList}" var="bDto">
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
							<div class="bord_list_paging">
								<table class="pagination">
									<tr>
										<td>
											<ul class="pagination_paging">
												<c:if test="${pageMakerfish.prev}">
													<li onclick="location.href='mydiary.bizpoll?opentab=e&page=${pageMakerfish.startPage - 1}';">
														&laquo;					
													</li>
													<li onclick="location.href='mydiary.bizpoll?opentab=e&page=${pageMakerfish.firstPage}';">
														${pageMakerfish.firtstPage}
													</li>
													<li>
														/
													</li>						               
									            </c:if>
									            <c:forEach begin="${pageMakerfish.startPage}" end="${pageMakerfish.endPage}" var="idx">
									                <li <c:out value="${pageMakerfish.criDto.page == idx? 'class=activefish':''}"/> onclick="location.href='mydiary.bizpoll?opentab=e&page=${idx}&flag=${flag}&keyword=${keyword}&key=${code}&bkind=${bkind}&bregdate=${bregdate}';">
									                	${idx} 							               
									            	</li>
									            </c:forEach>
									           	<c:if test="${pageMakerfish.next}">
									           		<li>
														/
													</li>	
									           		<li onclick="location.href='mydiary.bizpoll?opentab=e&page=${pageMakerfish.finalPage}';">
														${pageMakerfish.finalPage}
													</li>
													<li onclick="location.href='mydiary.bizpoll?opentab=e&page=${pageMakerfish.endPage + 1}';">
														&raquo;
													</li>							           
									            </c:if>
								        	</ul>
										</td>
									</tr>
								</table>
							</div>
							<c:if test="${not empty keyword}">
								<div class="search_result_board">[&nbsp;&nbsp;<span style="color: red">${keyword}</span>&nbsp;&nbsp;]에 대한 검색 결과가 총 [&nbsp;&nbsp;<span style="color: red">${pageMakerfish.totalCount}</span>&nbsp;&nbsp;]개 나왔습니다.&nbsp;&nbsp;<a href="mydiary.bizpoll?opentab=e" target="_self"><span style="color: orange;">리스트 전체보기</span></a></div>				
							</c:if>	
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
<script type="text/javascript" src="js/mydiary.js"></script>
<!-- 스크립트 끝 -->
</html>
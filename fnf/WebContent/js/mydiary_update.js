
/* 대분류 셀렉트 박스 유지 시작 */
$("#item_sel option").each(function(){
	var bitemval = $("#bitemval").val();
	
	if($(this).val() == bitemval){
		$(this).attr("selected","selected");
	}
});
/* 대분류 셀렉트 박스 유지 끝 */

/* 중분류 셀렉트 박스 유지 시작 */
$("#mainproduct option").each(function(){
	var bmainval = $("#bmainval").val();
	
	if($(this).val() == bmainval){
		$(this).attr("selected","selected");
	}
});
/* 중분류 셀렉트 박스 유지 끝 */

/* 소분류 셀렉트 박스 유지 시작 */
$("#product option").each(function(){
	var bpval = $("#bpval").val();
	
	if($(this).val() == bpval){
		$(this).attr("selected","selected");
	}
});
/* 소분류 셀렉트 박스 유지 끝 */

/* 제목 유효성 시작 */
  $(".formstyle_write2").focus(function() {
  	$(this).css("border", "1px solid orange");
  });

  $(".formstyle_write2").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	
  	if(inputval == "") {
  		$(this).parent().parent().parent().parent().next().css("display", "block").text("필수 정보입니다.");
  	} else {
  		$(this).parent().parent().parent().parent().next().css("display", "none");
  	}
  });
  /* 제목 유효성 끝 */

  /* 제목 유효성 시작 */
  $(".formstyle_write4").focus(function() {
  	$(this).css("border", "1px solid orange");
  });

  $(".formstyle_write4").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	
  	if(inputval == "") {
  		$(this).parent().parent().parent().parent().next().css("display", "block").text("필수 정보입니다.");
  	} else {
  		$(this).parent().parent().parent().parent().next().css("display", "none");
  	}
  });
  /* 제목 유효성 끝 */

  /* 공개설정 시작 */
  $(".formstyle_write1").focus(function() {
  	$(this).css("border", "1px solid orange");
  });

  $(".formstyle_write1").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	
  	if(inputval == "게시글 공개설정") {
  		$(this).parent().parent().next().children().children().css("display", "block").text("필수 정보입니다.");
  	} else {
  		$(this).parent().parent().next().children().children().css("display", "none");
  	}
  });
  /* 공개설정 끝 */

  /* 게시글 종류 설정 시작 */
  $(".formselect2").focus(function() {
  	$(this).css("border", "1px solid orange");
  });

  $(".formselect2").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	
  	if(inputval == "게시글 종류") {
  		$(this).parent().parent().next().children().children().css("display", "block").text("필수 정보입니다.");
  	} else {
  		$(this).parent().parent().next().children().children().css("display", "none");
  	}
  });
  /* 게시글 종류 설정 끝 */

  /* 게시글 종류에 따라 하위 내용 설정 시작 */
  
  var inputval = $("#board_kind").val();
  
  if(inputval == "생산일지") {
	$(".write_ilji_table_box").css("display", "block");
  } else {
	$(".write_ilji_table_box").css("display", "none");
  }
  
  $(document).on("change","#board_kind",function(){
  	
  	var inputval = $(this).val();
  	var inputkind = $(".formselect1").val();
  	
  	if(inputval == "생산일지") {
  		$(".write_ilji_table_box").css("display", "block");
  	} else {
  		$(".write_ilji_table_box").css("display", "none");
  	}
  });
  /* 게시글 종류에 따라 하위 내용 설정 끝 */

  /* 농수산물 대분류 설정 시작 */
  $("#item_sel").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	
  	if(inputval == "대분류 선택") {
  		$("#selone").css("display", "block").text("필수 정보입니다.");
  	} else {
  		$("#selone").css("display", "none");
  	}		
  });	
  /* 농수산물 대분류 설정 끝 */

  /* 농수산물 중분류 설정 시작 */
  $("#mainproduct").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	
  	if(inputval == "중분류 선택") {
  		$("#errorTwo").css("display", "block").text("필수 정보입니다.");
  	} else {
  		$("#errorTwo").css("display", "none");
  	}		
  });
  /* 농수산물 중분류 설정 끝 */

  /* 농수산물 소분류 설정 시작 */
  $("#product").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	
  	if(inputval == "소분류 선택") {
  		$("#errorTwo").css("display", "block").text("필수 정보입니다.");
  	} else {
  		$("#errorTwo").css("display", "none");
  	}		
  });
  /* 농수산물 소분류 설정 끝 */

  /* 생산량 설정 시작 */
  $("#totalproduct").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	var regex= /^[0-9]+$/;
  	
  	if(inputval == "") {
  		$(this).parent().next().css("display", "block").text("필수 정보입니다.");
  	} else if(!regex.test(inputval)) {
  		$(this).parent().next().css("display", "block").text("숫자만 입력해 주세요.");
  	} else if(regex.test(inputval)){
  		$(this).parent().next().css("display", "none");
  	}
  });
  /* 생산량 설정 끝 */

  /* 생산일 설정 시작 */
  $("#productbrith").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	var regBirth = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
  	
  	if(inputval == "") {
  		$(this).parent().next().css("display", "block").text("필수 정보입니다.");
  	} else if(!regBirth.test(inputval)){
  		$(this).parent().next().css("display", "block").text("예시처럼 입력해 주세요.");
  	} else if(regBirth.test(inputval)){
  		$(this).parent().next().css("display", "none");
  	}
  });
  /* 생산일 설정 끝 */

  /* 판매가 설정 시작 */
  $("#productprice").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	var regex= /^[0-9]+$/;
  	
  	if(inputval == "") {
  		$(this).parent().next().css("display", "block").text("필수 정보입니다.");
  	} else if(!regex.test(inputval)) {
  		$(this).parent().next().css("display", "block").text("만원 단위로 숫자만 입력해 주세요.");
  	} else if(regex.test(inputval)){
  		$(this).parent().next().css("display", "none");
  	}
  });
  /* 판매가 설정 끝 */

  /* 판매처 설정 시작 */
  $("#productsaler").focus(function() {
  	$(this).css("border", "1px solid orange");
  });

  $("#productsaler").blur(function() {
  	$(this).css("border", "1px solid #dadada");
  	
  	var inputval = $(this).val();
  	
  	if(inputval == "") {
  		$(this).parent().next().css("display", "block").text("필수 정보입니다.");
  	} else {
  		$(this).parent().next().css("display", "none");
  	}
  });
  /* 판매처 설정 끝 */

  /* 가입버튼 클릭 시 유효성 검사 시작 */
  $(document).on("click", "#ilji_update_btn", function() {	
  	var
  	form = $("#frm_boardwrite"),
  	title = $("#write_title_p"),
  	open = $("#board_open"),
  	item = $("#item_sel"),
  	kind = $(".formselect2"),	
  	mainproduct = $("#mainproduct"),
  	product = $("#product"),	
  	totalproduct = $("#totalproduct"),
  	birth = $("#productbrith"),	
  	price = $("#productprice"),	
  	place = $("#productsaler"),	
  	content = $("#textAreaContent"),
  	filename = $("#uploadfile");

  	var btitle = $.trim(title.val());	
  	
  	if(btitle == "") {
  		title.parent().parent().parent().parent().next().css("display", "block").text("필수 정보입니다.");
  		title.focus();
  		return false;
  	} else {
  		title.parent().parent().parent().parent().next().css("display", "none");
  	}

  	var bopen = $.trim(open.val());
  	
  	if(bopen == "게시글 공개설정") {
  		open.parent().parent().next().children().children().css("display", "block").text("필수 정보입니다.");
  		open.focus();
  		return false;
  	} else {
  		open.parent().parent().next().children().children().css("display", "none");
  	}
  		
  	var bkind = $.trim(kind.val());
  	
  	if(bkind == "게시글 종류") {
  		kind.parent().parent().next().children().children().css("display", "block").text("필수 정보입니다.");
  		kind.focus();
  		return false;
  	} else if(bkind == "생산일지"){
  		kind.parent().parent().next().children().children().css("display", "none");
  		$(".write_ilji_table_box").css("display", "block");
  		item.focus();
  	} else if(bkind == "일반글"){
  		kind.parent().parent().next().children().children().css("display", "none");		
  		content.focus();
  	} 
  	
  	var bitem = $.trim(item.val());
  	var bmainproduct = $.trim(mainproduct.val());
  	var bproduct = $.trim(product.val());	
  	
  	if(bitem == "대분류 선택") {
  		$("#selone").css("display", "block").text("필수 정보입니다.");
  		item.focus();
  		return false;
  	} else {
  		$("#selone").css("display", "none");
  		totalproduct.focus();
  	}
  	
  	var btotalproduct = $.trim(totalproduct.val());
  	var regex= /^[0-9]+$/;
  	
  	if(btotalproduct == "") {
  		totalproduct.parent().next().css("display", "block").text("필수 정보입니다.");
  		totalproduct.focus();
  		return false;
  	} else if(!regex.test(btotalproduct)) {
  		totalproduct.parent().next().css("display", "block").text("숫자만 입력해 주세요.");
  		totalproduct.select();
  		return false;
  	} else if(regex.test(btotalproduct)) {
  		totalproduct.parent().next().css("display", "none");
  		$("#productbrith").focus();
  	}
  	
  	var bbirth = $.trim(birth.val());
  	var regBirth = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
  	
  	if(bbirth == "") {
  		birth.parent().next().css("display", "block").text("필수 정보입니다.");
  		birth.focus();
  		return false;
  	} else if(!regBirth.test(bbirth)) {
  		birth.parent().next().css("display", "block").text("예시처럼 입력해 주세요.");
  		birth.select();
  		return false;
  	} else if(regBirth.test(bbirth)) {
  		birth.parent().next().css("display", "none");
  		price.focus();
  	}
  	
  	var bprice = $.trim(price.val());
  	var regPrice = /^[0-9]+$/;
  	
  	if(bprice == "") {
  		price.parent().next().css("display", "block").text("필수 정보입니다.");
  		price.focus();
  		return false;
  	} else if(!regPrice.test(bprice)) {
  		price.parent().next().css("display", "block").text("만원 단위로 숫자만 입력해 주세요.");
  		price.select();
  		return false;
  	} else if(regPrice.test(bprice)) {
  		price.parent().next().css("display", "none");
  		place.focus();
  	}
  	
  	var bplace = $.trim(place.val());
  	
  	if(bplace == "") {
  		place.parent().next().css("display", "block").text("필수 정보입니다.");
  		place.focus();
  		return false;
  	} else {
  		place.parent().next().css("display", "none");
  		content.focus();
  	}
  	
  	var bcontent = $.trim(content.val());
  	
  	if(bcontent == "") {		
  		content.focus();
  	} 
  	
  	var bfilename = $.trim(filename.val());
  	
  	if(bfilename == "") {		
  		filename.focus();
  	}		

  	form.submit();
  });
  /* 가입버튼 클릭 시 유효성 검사 끝 */

  /* 파일 업로드 설정 시작 */
  $(document).on("change","#uploadfile",function(){
  	var filesize= $(this)[0].files;/* file들을 첨부할수 있으니 (배열)  */
  	if(filesize.length < 1){
  		$("#file-name").text("선택된 파일 없음");
  		$("#close_btn").css("display","none");
  	} else{ 
  		//첨부파일이 있다면 파일 사이즈랑 이름 읽어오기
  		var filename = this.files[0].name;
  		var size = this.files[0].size;
  		var maxSize = 10*1024*1024; //10MB 용량제한
  		
  		if(size>maxSize){ //용량제한걸림
  			alert("첨부파일 사이즈는 10mb이내로 등록 가능합니다.");
  			$("#file-name").text("선택된 파일없음");
  			//화면단에서는 input type ="file"용량제한하는 코드 없음
  			//그래서 경고창은 뜨지만 실제 5mb 넘는 파일이 들어가 있음 
  			//반드시 초기화를 시켜서 지워줄것!!!  안그럼 Action단에서 에러발생!
  			$("#uploadfile").val(""); //기존파일 초기화
  			$("#now-file-size").val(0); //기존파일사이즈 초기화 
  		}else{ // 첨부가능
  			$("#now-file-size").val(size);
  			$("#file-name").text(filename);
  			$("#close_btn").css("display","inline-block");
  		}				
  	}
  });
  /* 파일 업로드 설정 끝 */

  /* 일지작성 버튼 클릭 시 스마트 에디터 값 저장 시작 */
  $(document).on("click","#ilji_update_btn",function(elClickedObj){
  	var title = $("#write_title_p").val();
  	
  	//스마트에디터로 content부분 값 넘겨 받는 부분
  	oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", []);
  	if(title==""){
  		$("#write_title_p").focus();
  		$(".error").css("display","block");
  		return false;
  	} $("#ilji_write_btn").submit();
  	
  });
  /* 일지작성 버튼 클릭 시 스마트 에디터 값 저장 끝 */

  /* 파일찾기 버튼 클릭 시 팝업창 호출 시작 */
  $(document).on("click",".btn-file",function(){
  	$("#uploadfile").click();
  });
  /* 파일찾기 버튼 클릭 시 팝업창 호출 끝 */
   
  /* 파일업로드 있을 경우 파일 영역 표시 시작 */
  $(document).ready(function() {
  	var files = $("#uploadfile").val();
  	if(files != ""){
  		$("#close_btn").css("display","block");
  	} else if(files == ""){
  		$("#close_btn").css("display","none");
  	}
  });
  /* 파일업로드 있을 경우 파일 영역 표시 끝 */

  /* 파일삭제 버튼 클릭 시 처리 시작 */
  $(document).on("click","#close_btn",function(){
  	$("#uploadfile").replaceWith($("#uploadfile").clone(true));
  	$("#uploadfile").val("");
  	$("#file-name").text("선택된 파일 없음");
  	$("#close_btn").css("display","none");
  }); 
  /* 파일삭제 버튼 클릭 시 처리 끝 */
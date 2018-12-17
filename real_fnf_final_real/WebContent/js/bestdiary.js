/* 메인에서 더보기 클릭시 인기 생산일지 Top 20 Tab 메뉴 처리 시작 */
$(function () {
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index + 1,index+2);
	
	if(tab == 'a'){
		$("#tab2_best").hide();
		$("#tab1_best").show();
	    $("#t1").addClass("active").css("color", "#723d77");
	    $("#t2").removeClass("active").css("color", "#3e5dad");
	} else if(tab == 'b'){
		$("#tab2_best").show();
		$("#tab1_best").hide();
		$("#t1").removeClass("active").css("color", "#3e5dad");
		$("#t2").addClass("active").css("color", "#723d77");		
	} 
});
/* 메인에서 더보기 클릭시 인기 생산일지 Top 20 Tab 메뉴 처리 끝 */

/* 인풋 포커스와 블러 처리 시작 */
$(".sformstyle").focus(function() {
	$(this).css("border", "1px solid orange");
});

$(".sformstyle").blur(function() {
	$(this).css("border", "1px solid #dadada");	
});

$(".sformstyle1").focus(function() {
	$(this).css("border", "1px solid orange");
});

$(".sformstyle1").blur(function() {
	$(this).css("border", "1px solid #dadada");	
});

$(".sformstyle2").focus(function() {
	$(this).css("border", "1px solid orange");
});

$(".sformstyle2").blur(function() {
	$(this).css("border", "1px solid #dadada");	
});
/* 인풋 포커스와 블러 처리 끝 */

/* 농산물 게시판 검색 유효성 시작 */
$("#search_btn").click(function () {
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index + 1,index+2);
	
	var flag = $("#selectkind").val();
    var keyword = $("#search_keyword").val();

    if(keyword == "") {
    	alert("검색어를 입력해 주세요.");
    	return false;
    }
    
    location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword;
});
/* 농산물 게시판 검색 유효성 끝 */

/* 수산물 게시판 검색 유효성 시작 */
$("#searchfish_btn").click(function () {
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index + 1,index+2);
	
	var flag = $("#selectkindfish").val();
    var keyword = $("#search_keywordfish").val();

    if(keyword == "") {
    	alert("검색어를 입력해 주세요.");
    	return false;
    }
    
    location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword;
});
/* 수산물 게시판 검색 유효성 끝 */

/* 자기소개 글자수 제한 시작 */
function len_chk(){
	var frm = document.insertinfo.contents;
	
	$("#text_counter_my").html(frm.value.length);
	
	if(frm.value.length > 150){
	    alert("150자까지만 입력 가능합니다.");
		frm.value = frm.value.substring(0,150);  
	    frm.focus();
	}
}
/* 자기소개 글자수 제한 끝 */

/* 농산물정렬 선택 시작 */
function orderSelect() {
	var orderSelect = document.getElementById("selectorder");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	
	var flag = $("#selectkind").val();
    var keyword = $("#search_keyword").val();
    
    // select element에서 선택된 option의 value가 저장된다.
    var orderValue = orderSelect.options[orderSelect.selectedIndex].value;
    
    if(orderValue == "new") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=new";    	
    } else if(orderValue == "good") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=good";
    } else if(orderValue == "reply") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=reply";
    } else if(orderValue == "cnt") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=cnt";
    }
}

/* 농산물정렬 선택 끝 */

/* 수산물정렬 선택 시작 */
function orderSelectfish() {
	var orderSelectfish = document.getElementById("selectorderfish");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	
	var flag = $("#selectkindfish").val();
    var keyword = $("#search_keywordfish").val();
    
    // select element에서 선택된 option의 value가 저장된다.
    var orderValuefish = orderSelectfish.options[orderSelectfish.selectedIndex].value;
    
    if(orderValuefish == "new") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=new";    	
    } else if(orderValuefish == "good") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=good";
    } else if(orderValuefish == "reply") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=reply";
    } else if(orderValuefish == "cnt") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=cnt";
    }	
}

/* 수산물정렬 선택 끝 */

/* 농산물 게시글 종류 정렬 선택 시작 */
function kind() {
	var kindSelect = document.getElementById("selectkind1");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	
	var flag = $("#selectkind").val();
    var keyword = $("#search_keyword").val(); 
    var code = $("#code").val();
    
    // select element에서 선택된 option의 value가 저장된다.
    var kindValue = kindSelect.options[kindSelect.selectedIndex].value;
    
    if(kindValue == "all") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=all";
    } else if(kindValue == "생산일지") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=생산일지";
    } else if(kindValue == "일반글") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=일반글";
    } 
}
/* 농산물 게시글 종류 정렬 선택 끝 */

/* 수산물 게시글 종류 정렬 선택 시작 */
function kindfish() {
	var kindSelectfish = document.getElementById("selectkind1fish");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	
	var flag = $("#selectkindfish").val();
    var keyword = $("#search_keywordfish").val(); 
    var code = $("#code").val();
    
    // select element에서 선택된 option의 value가 저장된다.
    var kindValuefish = kindSelectfish.options[kindSelectfish.selectedIndex].value;
    
    if(kindValuefish == "all") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=all";
    } else if(kindValuefish == "생산일지") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=생산일지";
    } else if(kindValuefish == "일반글") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=일반글";
    } 
}
/* 수산물 게시글 종류 정렬 선택 끝 */

/* 농산물 연도 정렬 선택 시작 */
function year() {
	var yearSelect = document.getElementById("selectyear");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	
	var flag = $("#selectkind").val();
    var keyword = $("#search_keyword").val();
    var code = $("#code").val();
    var bkind = $("#bkindyear").val();
    
    // select element에서 선택된 option의 value가 저장된다.
    var yearValue = yearSelect.options[yearSelect.selectedIndex].value;
    
    if(yearValue == "all") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=all";
    } else if(yearValue == "18") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=18";
    } else if(yearValue == "19") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=19";
    } else if(yearValue == "20") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=20";
    } /*YYYY-MM-DD HH24:MI:SS*/
}
/* 농산물 연도 정렬 선택 끝 */

/* 수산물 연도 정렬 선택 시작 */
function yearfish() {
	var yearSelectfish = document.getElementById("selectyearfish");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	
	var flag = $("#selectkindfish").val();
    var keyword = $("#search_keywordfish").val();
    var code = $("#code").val();
    var bkind = $("#bkindyear").val();
    
    // select element에서 선택된 option의 value가 저장된다.
    var yearValuefish = yearSelectfish.options[yearSelectfish.selectedIndex].value;
    
    if(yearValuefish == "all") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=all";
    } else if(yearValuefish == "18") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=18";
    } else if(yearValuefish == "19") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=19";
    } else if(yearValuefish == "20") {
    	location.href="bestdiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=20";
    } /*YYYY-MM-DD HH24:MI:SS*/
}
/* 수산물 연도 정렬 선택 끝 */







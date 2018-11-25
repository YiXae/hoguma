/* 탭 메뉴 시작 */
$(function () {
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index + 1,index+2);
	
	if(tab == 'c'){
		$("#tab1").show();
		$("#tab2").hide();
		$("#tab3").hide();		
		$("#mytab1").addClass("active").css("color", "#723d77");
		$("#mytab2").removeClass("active").css("color", "#3e5dad");
		$("#mytab3").removeClass("active").css("color", "#3e5dad");
	} else if(tab == 'd'){
		$("#tab1").hide();
		$("#tab2").show();
		$("#tab3").hide();		
		$("#mytab1").removeClass("active").css("color", "##3e5dad");
		$("#mytab2").addClass("active").css("color", "#723d77");
		$("#mytab3").removeClass("active").css("color", "#3e5dad");	
	} else if(tab == 'e'){
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab3").show();		
		$("#mytab1").removeClass("active").css("color", "##3e5dad");
		$("#mytab2").removeClass("active").css("color", "#3e5dad");
		$("#mytab3").addClass("active").css("color", "#723d77");	
	}
});
/* 탭 메뉴 끝 */

/* 게시판 검색 유효성 시작 */
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
    
    location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword;
});
/* 게시판 검색 유효성 끝 */

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

/* 정렬 선택 시작 */
function orderSelect() {
	var orderSelect = document.getElementById("selectorder");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	
	var flag = $("#selectkind").val();
    var keyword = $("#search_keyword").val();
	var code = $("#code").val;
    
    // select element에서 선택된 option의 value가 저장된다.
    var orderValue = orderSelect.options[orderSelect.selectedIndex].value;
    
    if(orderValue == "전체") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword;    	
    } else if(orderValue == "new") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=new";
    } else if(orderValue == "good") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=good";
    } else if(orderValue == "reply") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=reply";
    } else if(orderValue == "cnt") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=cnt";
    }
	/*$("#selectorder > option[value="+'<c:out value="${param.selectorder}"/>'+"]").attr("selected","selected");*/
}

/* 정렬 선택 끝 */

/* 게시글 종류 정렬 선택 시작 */
function kind() {
	var kindSelect = document.getElementById("selectkind1");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	
	var flag = $("#selectkind").val();
    var keyword = $("#search_keyword").val();
    var code = $("#code").val;
    
    // select element에서 선택된 option의 value가 저장된다.
    var kindValue = kindSelect.options[kindSelect.selectedIndex].value;
    
    if(kindValue == "전체") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword;
    } else if(kindValue == "생산일지") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&bkind=생산일지";
    } else if(kindValue == "일반글") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&bkind=일반글";
    } 
}
/* 게시글 종류 정렬 선택 끝 */

/* 연도 정렬 선택 시작 */
function year() {
	var yearSelect = document.getElementById("selectyear");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	
	var flag = $("#selectkind").val();
    var keyword = $("#search_keyword").val();
    var code = $("#code").val;
/*    var regdate = $("#regdate").val;
	var regdate1 =regdate.substring(0, 4);
	var bregdate =regdate1 + "년";*/
    
    // select element에서 선택된 option의 value가 저장된다.
    var yearValue = yearSelect.options[yearSelect.selectedIndex].value;
    
    if(yearValue == "전체") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword;
    } else if(yearValue == "2018년") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&bregdate=2018년";
    } else if(yearValue == "2019년") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&bregdate=2019년";
    } else if(yearValue == "2020년") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&bregdate=2020년";
    } 
}
/* 연도 정렬 선택 끝 */

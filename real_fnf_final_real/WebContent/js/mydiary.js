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

/* my 농수산물 게시판 검색 유효성 시작 */
$("#searchmy_btn").click(function () {
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index + 1,index+2);
	var mnick = $("#nickname").val();
	
	var flag = $("#selectkindmy").val();
    var keyword = $("#search_keywordmy").val();

    if(keyword == "") {
    	alert("검색어를 입력해 주세요.");
    	return false;
    }
    
    location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword;
});
/* my 농수산물 게시판 검색 유효성 끝 */

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
    
    location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword;
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
    
    location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword;
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

/* my 농수산물정렬 선택 시작 */
function orderSelectmy() {
	var orderSelectmy = document.getElementById("selectordermy");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	var mnick = $("#nickname").val();
	
	var flag = $("#selectkindmy").val();
    var keyword = $("#search_keywordmy").val();
    
    // select element에서 선택된 option의 value가 저장된다.
    var orderValuemy = orderSelectmy.options[orderSelectmy.selectedIndex].value;
    
    if(orderValuemy == "new") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key=new";    	
    } else if(orderValuemy == "good") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key=good";
    } else if(orderValuemy == "reply") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key=reply";
    } else if(orderValuemy == "cnt") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key=cnt";
    }	
}

/* my 농수산물정렬 선택 끝 */

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
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=new";    	
    } else if(orderValue == "good") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=good";
    } else if(orderValue == "reply") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=reply";
    } else if(orderValue == "cnt") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=cnt";
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
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=new";    	
    } else if(orderValuefish == "good") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=good";
    } else if(orderValuefish == "reply") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=reply";
    } else if(orderValuefish == "cnt") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key=cnt";
    }	
}

/* 수산물정렬 선택 끝 */

/* my 농수산물 게시글 종류 정렬 선택 시작 */
function kindmy() {
	var kindSelectmy = document.getElementById("selectkind1my");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	var mnick = $("#nickname").val();
	
	var flag = $("#selectkindmy").val();
    var keyword = $("#search_keywordmy").val(); 
    var code = $("#code").val();
    
    // select element에서 선택된 option의 value가 저장된다.
    var kindValuemy = kindSelectmy.options[kindSelectmy.selectedIndex].value;
    
    if(kindValuemy == "all") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bopen=all";
    } else if(kindValuemy == "생산일지") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=생산일지";
    } else if(kindValuemy == "일반글") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=일반글";
    } else if(kindValuemy == "공개") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bopen=공개";
    } else if(kindValuemy == "비공개") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bopen=비공개";
    } 
}
/* my 농수산물 게시글 종류 정렬 선택 끝 */

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
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=all";
    } else if(kindValue == "생산일지") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=생산일지";
    } else if(kindValue == "일반글") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=일반글";
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
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=all";
    } else if(kindValuefish == "생산일지") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=생산일지";
    } else if(kindValuefish == "일반글") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind=일반글";
    } 
}
/* 수산물 게시글 종류 정렬 선택 끝 */

/* my 농수산물 연도 정렬 선택 시작 */
function yearmy() {
	var yearSelectmy = document.getElementById("selectyearmy");
	var nowUrl = window.location.href;
	var index = nowUrl.indexOf("=");
	var tab = nowUrl.substring(index+1,index+2);
	var mnick = $("#nickname").val();
	
	var flag = $("#selectkindfish").val();
    var keyword = $("#search_keywordfish").val();
    var code = $("#code").val();
    var bkind = $("#bkindyear").val();
    
    // select element에서 선택된 option의 value가 저장된다.
    var yearValuemy = yearSelectmy.options[yearSelectmy.selectedIndex].value;
    
    if(yearValuemy == "all") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=all";
    } else if(yearValuemy == "18") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=18";
    } else if(yearValuemy == "19") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=19";
    } else if(yearValuemy == "20") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&mnick="+mnick+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=20";
    } /*YYYY-MM-DD HH24:MI:SS*/
}
/* my 농수산물 연도 정렬 선택 끝 */

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
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=all";
    } else if(yearValue == "18") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=18";
    } else if(yearValue == "19") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=19";
    } else if(yearValue == "20") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=20";
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
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=all";
    } else if(yearValuefish == "18") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=18";
    } else if(yearValuefish == "19") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=19";
    } else if(yearValuefish == "20") {
    	location.href="mydiary.bizpoll?opentab="+tab+"&flag="+flag+"&keyword="+keyword+"&key="+code+"&bkind="+bkind+"&bregdate=20";
    } /*YYYY-MM-DD HH24:MI:SS*/
}
/* 수산물 연도 정렬 선택 끝 */

/* 선택 삭제 시작 */
function allChk(obj){
	
	$('input:checkbox[name="allCheck"]').change(function(){
        $('input:checkbox[name="RowCheck"]').each(function(){
            $(this).prop("checked",$('input:checkbox[name="allCheck"]').prop("checked"));
        });
    });
}
		
$("#RowCheck").click(function () {
		
	checkedLength = $(".title_td > input:checked").length;	
	
	if(checkedLength == 20) {			
		$("#allCheck").prop("checked", true);
	} else {
		$("#allCheck").prop("checked", false);				
	} 
});

/* 게시판 리스트 선택 삭제 처리 */
$(document).on("click",".del_list_btn",function() {
	var nmeCardSeq ="";
    var checkArray = new Array(); 
    var mnick = $("#mnicksel").val();   
      
    $("input[name=RowCheck]:checked").each(function(i) {   //jQuery로 for문 돌면서 check 된값 배열에 담는다
         checkArray.push($(this).val());
    });	
	
    jQuery.ajaxSettings.traditional = true;

    if(checkArray.length == 0) {
        alert("삭제할 게시글을 선택해 주세요.");
    } else {
    	
        if(confirm("삭제하시겠습니까?") == true){    //확인
            $.ajax({
	            type : 'POST',
	            url : 'mydiary_listdelete.bizpoll',
	            data : {"checkArray" : checkArray},
	            success: function pageReload() {
	            		alert("삭제되었습니다.");
	                    location.href="mydiary.bizpoll?opentab=c";
	            },
	            error: function() {
	        			alert("System Error!!!");
	        	}
            });
            
            checkArray= new Array();
            nmeCardSeq="";
            
        } else {   //취소    
            location.reload(true);
        }
    }
}); 
/* 선택 삭제 끝 */

/* 이미지 미리보기 시작 */
function readURL(input) {

    if(input.files && input.files[0]) {

      var reader = new FileReader();

      reader.onload = function(e) {

        $('#myphoto').attr('src', e.target.result);

      }

      reader.readAsDataURL(input.files[0]);

  }

}

$("#ex_file").change(function() {

   readURL(this);

});
/* 이미지 미리보기 끝 */

/* 자기소개 버튼 처리 시작 */
$(document).on("click","#myinfo_save_btn",function() {
	var formData = new FormData();
	var mnick = $("#mnicksel").val();
	
	formData.append("ex_file", $("input[name=ex_file]")[0].files[0]);
	formData.append("emailopen", $("select[name=emailopen]").val()); 
	formData.append("phoneopen", $("select[name=phoneopen]").val()); 
	formData.append("doing", $("select[name=doing]").val());
	formData.append("contents", $("textarea[name=contents]").val());
	formData.append("moreinfonick", $("input[name=moreinfonick]").val());
	
	var mintro = $("#text_content_my").val();
	
	if(mintro == "") {
		alert("소개 내용을 입력해 주세요.");
		$("#text_content_my").focus();
		return false;
	} else {
		$.ajax({
            type : 'POST',
            url : 'myintro.bizpoll',
            data: formData, 
            processData: false, 
            contentType: false,         
            success: function pageReload() {
            		
            	location.href="mydiary.bizpoll?opentab=c";
            },
            error: function() {
        			alert("System Error!!!");
        	}
        });
	}
		
});
/* 자기소개 버튼 처리 끝 */

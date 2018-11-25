/* 이메일 아이디 정규식 시작  */
$("#inputid_search").blur(function() {
	var mid = $(this).val();
	var regMid = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	
	if(mid == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(!regMid.test(mid)) {
		$(this).parent().parent().next().css("display", "block").text("이메일 형식이 아닙니다.");
	} else if(regMid.test(mid)){
		$(this).parent().parent().next().css("display", "none");		
	}
});
/* 이메일 아이디 정규식 끝  */

/* 이름 정규식 시작  */
$("#inputname_search").blur(function(){
	var name = $(this).val();
	var regName = /^[가-힣]+.{2,9}$/; // +{3,10}/; // 한글만 공백없이.3~10자리
	
	if(name == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");		
	} else if(!regName.test(name)){
		$(this).parent().parent().next().css("display", "block").text("3~10자까지의 한글, 띄어쓰기는 불가능합니다.");
	} else if(regName.test(name)){
		$(this).parent().parent().next().css("display", "none");		
	}	
});
/* 이름 정규식 끝  */

/* 전화번호 정규식 시작  */
$("#inputphone_search").blur(function() {
	var phone = $(this).val();
	var regPhone = /^01(?:0|1|[6-9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if(phone == "") {		
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(!regPhone.test(phone)){
		$(this).parent().parent().next().css("display", "block").text("전화번호를 최소 10~11자리까지 숫자로 입력해 주세요. 반드시 0으로 시작해야 합니다.");
	} else if(regPhone.test(phone)){
		$(this).parent().parent().next().css("display", "none");		
	}
}); 
/* 전화번호 정규식 끝  */

/* 아이디 찾기 버튼 클릭시 유효성 검사 시작  */
$(document).on("click", "#btn_searchid", function() {	
	var
	form = $("#frm_idsearch"),
	name = $("#inputname_search"),
	phone = $("#inputphone_search");	

	// 이름 유효성 검사
	var mname = $.trim(name.val());
	var regName = /^[가-힣]+.{2,9}$/; // +{3,10}/; // 한글만 공백없이.3~10자리
	
	if(mname == "") {
		name.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		name.focus();
		return false;
	} else if(!regName.test(mname)){
		name.parent().parent().next().css("display", "block").text("3~10자까지의 한글, 띄어쓰기는 불가능합니다.");
		name.focus();
		return false;
	} 

	// 전화번호 유효성 검사
	var mphone = $.trim(phone.val());
	var regPhone = /^01(?:0|1|[6-9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if(mphone == "") {		
		phone.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		phone.focus();
		return false;
	} else if(!regPhone.test(mphone)){
		phone.parent().parent().next().css("display", "block").text("전화번호를 최소 10~11자리까지 숫자로 입력해 주세요. 반드시 0으로 시작해야 합니다.");
		phone.focus();
		return false;
	} else if(mphone != "" && mname != "") {
		$.ajax({				
			url: "idsearch.bizpoll",
			type: "POST",
			dataType: "json",
			data: "name=" + mname + "&phone=" + mphone, // 쿼리스트링이라서 "pw=" 공백 사용할 수 없음

			success: function(data) {					
				if(data.message == "1") {						
					phone.parent().parent().next().css("display", "block").css("color", "#f46665").text("정보가 일치하는 회원이 존재하지 않습니다.");
					phone.focus();
				} else if(data.message == "-1"){
					phone.parent().parent().next().css("display", "block").css("color", "#0000ff").text("아이디를 회원가입하실 때 이용하신 이메일로 발송해 드렸습니다.");
				} 
			},				
			error: function(){
				alert("System Error!!!");
			}
		});
	}	
});
/* 아이디 찾기 버튼 클릭시 유효성 검사 끝  */

/* 비밀번호 찾기 버튼 클릭시 유효성 검사 시작  */
$(document).on("click", "#btn_searchpw", function() {	
	var
	form = $("#frm_pwsearch"),
	id = $("#inputid_search"),
	phone = $("#inputphone_search_down");
	
	var mid = $.trim(id.val());
	var regMid = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	
	if(mid == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
		id.focus();
		return false;
	} else if(!regMid.test(mid)) {
		$(this).parent().parent().next().css("display", "block").text("이메일 형식이 아닙니다.");
		id.focus();
		return false;
	} 
		
	// 전화번호 유효성 검사
	var mphone = $.trim(phone.val());
	var regPhone = /^01(?:0|1|[6-9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if(mphone == "") {		
		phone.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		phone.focus();
		return false;
	} else if(!regPhone.test(mphone)){
		phone.parent().parent().next().css("display", "block").text("전화번호를 최소 10~11자리까지 숫자로 입력해 주세요. 반드시 0으로 시작해야 합니다.");
		phone.focus();
		return false;
	} else if(mphone != "" && mid != "") {
		$.ajax({				
			url: "pwsearch.bizpoll",
			type: "POST",
			dataType: "json",
			data: "id=" + mid + "&phone=" + mphone, // 쿼리스트링이라서 "pw=" 공백 사용할 수 없음

			success: function(data) {					
				if(data.message == "1") {						
					phone.parent().parent().next().css("display", "block").css("color", "#f46665").text("정보가 일치하는 회원이 존재하지 않습니다.");
					phone.focus();
				} else if(data.message == "-1"){
					phone.parent().parent().next().css("display", "block").css("color", "#0000ff").text("비밀번호를 회원가입하실 때 이용하신 이메일로 발송해 드렸습니다.");
				} 
			},				
			error: function(){
				alert("System Error!!!");
			}
		});
	}	
});
/* 비밀번호 찾기 버튼 클릭시 유효성 검사 끝  */
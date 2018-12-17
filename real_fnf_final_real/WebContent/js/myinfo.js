/* 인풋 포커스와 블러 처리 시작 */
$(".input_login").focus(function() {
	$(this).parent().css("border", "1px solid orange");
});

$(".input_login").blur(function() {
	$(this).parent().css("border", "1px solid #dadada");	
});

/* input태그 값이 없으면 경고메세지 출력 */
$(".input_login").blur(function(){
	if($(this).val() == "") {
		/* $(".error").css("display", "block"); */
		$(this).parent().parent().next().text("필수정보 입니다.").css("display", "block");
	} else {
		/* $(".error").css("display", "none"); */
		$(this).parent().parent().next().css("display", "none");
	}
});
/* 인풋 포커스와 블러 처리 끝 */

/* 닉네임 유효성 시작 */
$("#inputnickname").blur(function(){
	var nick = $(this).val();
	var mid = $("#email_check").val();
	var regNick = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+.{2,9}$/; // +{3,10}/; // 한글만 공백없이.3~10자리
	
	if(nick == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
		$(this).focus();
	} else if(!regNick.test(nick)){
		$(this).parent().parent().next().css("display", "block").text("3~10자의 별명을 입력해 주세요.");
		$(this).focus();
	} else {	
		$.ajax({				
			url: "nickCheck.bizpoll",
			type: "POST",
			dataType: "json",
			data: "nick=" + nick+"&id="+mid,		
		
			success: function(data) {
				if(data.message == "-1"){
					$("#mag_nick_ok").css("display", "block").text("이미 사용중인 별명입니다.");
					$("#inputnickname").focus();
				} else if(data.message == "0"){
					$("#mag_nick_ok").css("display", "block").css("color", "#0000ff").text("기존 별명과 같네요 ㅎㅎ");
					$("#inputpw").focus();
				} else {
					$("#mag_nick_ok").css("display", "block").css("color", "#0000ff").text("멋진 별명이네요!");
					$("#inputpw").focus();
				} 
			},			
			error: function(){
				alert("System Error!!!");
			}
		});
	}
});
/* 닉네임 유효성 끝 */

/* 비밀번호 유효성 시작 */
$("#inputpw").blur(function() {
	var pw = $("#inputpw").val();
	var pw_ch = $("#inputpw_ch").val();
	var regPass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
	
	if(pw == "") {		
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
		$(this).focus();
	} else if(!regPass.test(pw)){
		$(this).parent().parent().next().css("display", "block").text("8~15 글자 수, 최소 1개의 대문자와 소문자 그리고 특수문자 1개 포함해야 합니다.");
		$(this).focus();
	} else {
		$(this).parent().parent().next().css("display", "none");
		$("#inputpw_ch").focus();
	}
});
/* 비밀번호 유효성 끝 */

/* 비밀번호 일치 유효성 시작 */
$("#inputpw_ch").blur(function() {
	var pw = $("#inputpw").val();
	var pw_ch = $("#inputpw_ch").val();
	
	if(pw_ch == "") {		
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
		$(this).focus();
	} else if(pw != "" && pw_ch != "") {		
		if(pw != pw_ch) {
			$(this).parent().parent().next().css("display", "block").text("비밀번호가 일치하지 않습니다.");
			$(this).focus();
		} else if(pw == pw_ch) {			
			$(this).parent().parent().next().css("display", "none");
			$("#inputname").focus();
		}
	}
});
/* 비밀번호 일치 유효성 끝 */

/* 전화번호 유효성 시작 */
$("#inputphone").blur(function() {
	var phone = $(this).val();
	var regPhone = /^01(?:0|1|[6-9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if(phone == "") {		
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
		$(this).focus();
	} else if(!regPhone.test(phone)){
		$(this).parent().parent().next().css("display", "block").text("전화번호를 최소 10~11자리까지 숫자로 입력해 주세요. 반드시 0으로 시작해야 합니다.");
		$(this).focus();
	} else if(regPhone.test(phone)){
		$(this).parent().parent().next().css("display", "none");
		$("#sample6_postcode").focus();
	}
});
/* 전화번호 유효성 끝 */

/* 우편번호 유효성 시작 */
$("#sample6_postcode").blur(function() {
	var zipcode = $(this).val();
	var add1 = $("#sample6_address").val();
	var add2 = $("#sample6_address2").val();	
	
	if(zipcode == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else {			
		$(this).parent().parent().next().css("display", "none");
	} 
}); 
/* 우편번호 유효성 끝 */

/* 상세주소 유효성 시작 */
$("#sample6_address2").blur(function() {
	var zipcode = $("#sample6_postcode").val();
	var add1 = $("#sample6_address").val();
	var add2 = $(this).val();	
	
	if(add2 == "") {		
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else {
		$(this).parent().parent().next().css("display", "none");
	} 
});
/* 상세주소 유효성 끝 */

/* 회원가입 버튼 클릭 시 유효성 시작 */
$(document).on("click", "#memberinfo_send", function() {	
	var
	form = $("#frm_meminfo"),
	mnick = $("#inputnickname"),
	mpw = $("#inputpw"),
	mpwch = $("#inputpw_ch"),
	mphone = $("#inputphone"),
	mzipcode = $("#sample6_postcode"),
	maddr1 = $("#sample6_address"),
	maddr2 = $("#sample6_address2");

	// 닉네임 유효성 검사
	var nick = $.trim(mnick.val());
	var regNick = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+.{2,9}$/; // 정규식, 영문자,숫자 포함 특수문자 사용가능.8~20자리
	
	if(nick == "") {			
		mnick.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		mnick.focus();
		return false;
	} else if(!regNick.test(nick)){
		mnick.parent().parent().next().css("display", "block").text("3~10자의 별명을 입력해 주세요.");
		mnick.select();
		return false;
	} 

	// 비밀번호 유효성 검사
	var pw = $.trim(mpw.val());
	var pw_ch = $.trim(mpwch.val());
	var regPass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
	
	if(pw == "") {		
		mpw.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		mpw.focus();
		return false;
	} else if(!regPass.test(pw)){
		mpw.parent().parent().next().css("display", "block").text("8~15 글자 수, 최소 1개의 대문자와 소문자 그리고 특수문자 1개 포함해야 합니다.");
		mpw.select();
		return false;					
	} 
	
	// 비밀번호 일치 유효성 검사
	if(pw_ch == ""){
		mpwch.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		mpwch.focus();
		return false;
	} else if(pw != "" && pw_ch != "") {
		if(pw != pw_ch) {
			mpwch.parent().parent().next().css("display", "block").text("비밀번호가 일치하지 않습니다.");
			mpwch.select();
			return false;
		} 
	} 

	// 전화번호 유효성 검사
	var phone = $.trim(mphone.val());
	var regPhone = /^01(?:0|1|[6-9])-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if(phone == "") {		
		mphone.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		mphone.focus();
		return false;
	} else if(!regPhone.test(phone)){
		mphone.select();
		mphone.parent().parent().next().css("display", "block").text("전화번호를 최소 10~11자리까지 숫자로 입력해 주세요. 반드시 0으로 시작해야 합니다.");
		return false;
	} 

	// 주소 유효성 검사
	var zipcode = $.trim(mzipcode.val());
	var add1 = $.trim(maddr1.val());
	var add2 = $.trim(maddr2.val());
	
	if(zipcode == "") {		
		mzipcode.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		mzipcode.focus();
		return false;
	} else if(add2 == "") {
		maddr2.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		maddr2.focus();
		return false;
	}	
	
	form.submit();
});
/* 회원가입 버튼 클릭 시 유효성 끝 */

/* 다음 주소 찾기 시작 */
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

         // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();     
        }
    }).open();
}
/* 다음 주소 찾기 끝 */
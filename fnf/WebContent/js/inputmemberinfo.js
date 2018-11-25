/* 인풋 포커스와 블러 처리 시작 */
$(".input_login").focus(function() {
	$(this).parent().css("border", "1px solid orange");
});

$(".input_login").blur(function() {
	$(this).parent().css("border", "1px solid #dadada");
	
	var inputval = $(this).val();
	
	if(inputval == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else {
		$(this).parent().parent().next().css("display", "none");
	}
});
/* 인풋 포커스와 블러 처리 끝 */

/* 이메일 유효성 시작 */
$("#email").blur(function() {
	var email = $(this).val();
	var regMail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	
	if(email == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(!regMail.test(email)) {
		$(this).parent().parent().next().css("display", "block").text("이메일 형식이 아닙니다.");
	} else {				
		$.ajax({				
			url: "idCheck.bizpoll",
			type: "POST",
			dataType: "json",
			data: "id=" + email,
		
			success: function(data) {
				if(data.message == "-1"){
					$("#email").parent().parent().next().css("display", "block").text("이미 사용중인 아이디 입니다.");					
				} else {
					$("#email").parent().parent().next().css("display", "block").css("color", "#0000ff").text("멋진 아이디군요!");
				}
			},					
			error: function(){
				alert("System Error!!!");
			}
		});
	}
});
/* 이메일 유효성 끝 */

/* 닉네임 유효성 시작 */
$("#inputnickname").blur(function(){
	var nick = $(this).val();	
	var regNick = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+.{2,9}$/; // +{3,10}/; // 한글만 공백없이.3~10자리
	
	if(nick == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(!regNick.test(nick)){
		$(this).parent().parent().next().css("display", "block").text("3~10자의 별명을 입력해 주세요.");
	} else if(nick != "") {	
		$.ajax({				
			url: "nickCheck.bizpoll",
			type: "POST",
			dataType: "json",
			data: "nick=" + nick,		
		
			success: function(data) {
				if(data.message == "-1"){
					$("#inputnickname").parent().parent().next().css("display", "block").text("이미 사용중인 별명입니다.");
				} else if(data.message == "1"){
					$("#inputnickname").parent().parent().next().css("display", "block").css("color", "#0000ff").text("멋진 별명이네요!");
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
	} else if(!regPass.test(pw)){
		$(this).parent().parent().next().css("display", "block").text("8~15 글자 수, 최소 1개의 대문자와 소문자 그리고 특수문자 1개 포함해야 합니다.");
	} 
});
/* 비밀번호 유효성 끝 */

/* 비밀번호 일치 유효성 시작 */
$("#inputpw_ch").blur(function() {
	var pw = $("#inputpw").val();
	var pw_ch = $("#inputpw_ch").val();
	
	if(pw_ch == "") {		
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(pw == "" && pw_ch != "") {		
		$(this).parent().parent().next().css("display", "none");
		$("#inputpw").parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(pw != "" && pw_ch != "") {		
		if(pw != pw_ch) {
			$(this).parent().parent().next().css("display", "block").text("비밀번호가 일치하지 않습니다.");
		} else if(pw == pw_ch) {			
			$(this).parent().parent().next().css("display", "block").css("color", "#0000ff").text("비밀번호가 일치합니다.");
		}
	}
});
/* 비밀번호 일치 유효성 끝 */

/* 이름 유효성 시작 */
$("#inputname").blur(function(){
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
/* 이름 유효성 끝 */

/* 생년월일 유효성 시작 */
$("#inputbirth").blur(function() {
	var birth = $(this).val();
	var regBirth = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
	
	if(birth == "") {		
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(!regBirth.test(birth)){
		$(this).parent().parent().next().css("display", "block").text("8자리 숫자로 생년월일을 입력해 주세요(예, 19900505), 0으로 시작할수 없습니다.");
	} else if(regBirth.test(birth)){
		$(this).parent().parent().next().css("display", "none");		
	} 		
});
/* 생년월일 유효성 끝 */

/* 성별 유효성 시작 */
$("#inputgender").blur(function() {
	var gender = $(this).val();
	
	if(gender == "") {		
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(gender == "성별 선택"){
		$(this).parent().parent().next().css("display", "block").text("성별을 선택해 주세요.");
	} else if(gender != "성별 선택") {
		$(this).parent().parent().next().css("display", "none");		
	}
});
/* 성별 유효성 끝 */

/* 전화번호 유효성 시작 */
$("#inputphone").blur(function() {
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
/* 전화번호 유효성 끝 */

/* 우편번호 유효성 시작 */
$("#sample6_postcode").blur(function() {
	var zipcode = $(this).val();
	var add1 = $("#sample6_address").val();
	var add2 = $("#sample6_address2").val();	
	
	if(zipcode == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(zipcode != "") {			
		$("#sample6_address2").parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(zipcode != "" && add2 != "") {	
		$(this).parent().parent().next().css("display", "none");
		$("#sample6_address2").parent().parent().next().css("display", "none");
	}
}); 
/* 우편번호 유효성 끝 */

/* 주소 유효성 시작 */
$("#sample6_address").blur(function() {
	var zipcode = $("#sample6_postcode").val();
	var add1 = $(this).val();
	var add2 = $("#sample6_address2").val();	
	
	if(add1 == "" && zipcode == "") {
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} 
});
/* 주소 유효성 끝 */

/* 상세주소 유효성 시작 */
$("#sample6_address2").blur(function() {
	var zipcode = $("#sample6_postcode").val();
	var add1 = $("#sample6_address").val();
	var add2 = $(this).val();	
	
	if(add2 == "") {		
		$(this).parent().parent().next().css("display", "block").text("필수 정보입니다.");
		$("#sample6_postcode").blur();
	} else if(add2 != "" && zipcode == "") {
		$("#sample6_postcode").parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(add2 != "" && zipcode != "") {
		$(this).parent().parent().next().css("display", "none");		
	} 
});
/* 상세주소 유효성 끝 */

/* 회원가입 버튼 클릭 시 유효성 시작 */
$(document).on("click", "#memberinfo_send", function() {	
	var
	form = $("#frm_meminfo"),
	memail = $("#email"),
	mnick = $("#inputnickname"),
	mpw = $("#inputpw"),
	mpwch = $("#inputpw_ch"),
	mname = $("#inputname"),
	mbirth = $("#inputbirth"),	
	mgender = $("#inputgender"),
	mphone = $("#inputphone"),
	mzipcode = $("#sample6_postcode"),
	maddr1 = $("#sample6_address"),
	maddr2 = $("#sample6_address2");

	//이메일 아이디 정규식 검사
	var mail = $.trim(memail.val());
	var regMail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	
	if(mail == "") {			
		memail.parent().parent().next().css("display", "block").text("필수 정보입니다.");	
		memail.focus();
		return false;
	} else if(!regMail.test(mail)){
		memail.parent().parent().next().css("display", "block").text("이메일 형식이 아닙니다.");
		memail.select();
		return false;
	} else if(regMail.test(mail)){
		mnick.focus();				
	}

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
	} else if(regNick.test(nick)){
		mpw.focus();				
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
	} else if(regPass.test(pw)){
		mpwch.focus();		
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
		} else if(pw == pw_ch) {			
			mpwch.parent().parent().next().css("display", "block").css("color", "#0000ff").text("비밀번호가 일치합니다.");
			mname.focus();
		} 
	} 

	// 이름 유효성 검사
	var name = $.trim(mname.val());
	var regName = /^[가-힣]+.{2,9}$/; // +{3,10}/; // 한글만 공백없이.3~10자리
	
	if(name == "") {
		mname.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		mname.focus();
		return false;
	} else if(!regName.test(name)){
		mname.parent().parent().next().css("display", "block").text("3~10자까지의 한글, 띄어쓰기는 불가능합니다.");
		mname.select();
		return false;
	} else if(regName.test(name)){
		mbirth.focus();		
	}

	// 생년월일 유효성 검사
	var birth = $.trim(mbirth.val());
	var regBirth = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
	
	if(birth == "") {		
		mbirth.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		mbirth.focus();
		return false;
	} else if(!regBirth.test(birth)){
		mbirth.select();
		mbirth.parent().parent().next().css("display", "block").text("8자리 숫자로 생년월일을 입력해 주세요(예, 19900505), 0으로 시작할수 없습니다.");
		return false;
	} else if(regBirth.test(birth)){
		mgender.focus();		
	}

	// 성별 유효성 검사
	var gender = $.trim(mgender.val());
	
	if(gender == "") {		
		mgender.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		mgender.focus();
		return false;
	} else if(gender == "성별 선택"){
		mgender.parent().parent().next().css("display", "block").text("성별을 선택해 주세요.");
		mgender.focus();
		return false;
	} else if(gender != "성별 선택"){
		mphone.focus();		
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
	} else if(regPhone.test(phone)){
		mzipcode.focus();		
	}

	// 주소 유효성 검사
	var zipcode = $.trim(mzipcode.val());	
	var add2 = $.trim(maddr2.val());
	
	if(zipcode == "") {		
		mzipcode.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		mzipcode.focus();
		return false;
	} else if(zipcode != "" && add2 == "") {		
		maddr2.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		maddr2.focus();
		return false;
	} else if(add2 != "" && zipcode != "") {
		maddr2.parent().parent().next().css("display", "none");	
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
            if(data.zonecode != "") {
            	$("#sample6_postcode").parent().parent().next().css("display", "none");
            }            
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
/* 다음 주소 찾기 끝 */
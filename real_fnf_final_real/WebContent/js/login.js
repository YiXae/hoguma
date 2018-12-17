/* 로그인 버튼 클릭시 아이디와 비밀번호 가입 여부 확인 시작 */
$("#btn_login_ok").click(function () {
	var id = $("#inputid_login").val();
	var pw = $("#inputpw_login").val();
	var refer = $("#referer_login").val();	
	if(id != "" && pw != "") {
		$.ajax({				
			url: "loginplay.bizpoll",
			type: "POST",
			dataType: "json",
			data: "id=" + id + "&pw=" + pw, 

			success: function(data) {					
				if(data.message == "-1"){
					location.href=refer;
				} else {
					$(".err_check_msg").css("display", "block");
					$(".err_check_msg").text("아디디 또는 비밀번호가 일치하지 않습니다.");
					return;
				}
			},
				
			error: function(){
				alert("System Error!!!");
			}
		});		
		
	} else {
		$(".err_check_msg").css("display", "block");
		return;
	}
});
/* 로그인 버튼 클릭시 아이디와 비밀번호 가입 여부 확인 끝 */
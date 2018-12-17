/* 회원탈퇴를 위한 비밀번호 일치 검사 시작 */
$("#mpw_del").blur(function(){
	var mid = $("#mid_del").val();
	var mpw = $(this).val();
		
	if(mpw == "") {
		$("#mpw_del").parent().parent().next().css("display", "block").text("필수 정보입니다.");
	} else if(mpw != "") {
		$.ajax({				
			url: "pwCheck.bizpoll",
			type: "POST",
			dataType: "json",
			data: "id=" + mid + "&pw=" + mpw, // 쿼리스트링이라서 "pw=" 공백 사용할 수 없음

			success: function(data) {					
				if(data.message == "1") {						
					$("#mpw_del").parent().parent().next().css("display", "block").css("color", "#f46665").text("현재 비밀번호가 일치하지 않습니다.");
				} 
			},			
			error: function(){
				alert("System Error!!!");
			}
		});
	}
});
/* 회원탈퇴를 위한 비밀번호 일치 검사 끝 */

/* 회원탈퇴 버튼 클릭 시 비밀번호 일치 검사 시작 */
$("#btn_del").click(function () {
	var
	id = $("#mid_del"),
	pw = $("#mpw_del");
	
	// 비밀번호 유효성 검사
	var mid = $.trim(id.val());
	var mpw = $.trim(pw.val());
	
	if(mpw == "") {			
		pw.focus();
		pw.parent().parent().next().css("display", "block").text("필수 정보입니다.");
		return false;
	} else if(mpw != "") {
		$.ajax({				
			url: "pwCheck.bizpoll",
			type: "POST",
			dataType: "json",
			data: "id=" + mid + "&pw=" + mpw, // 쿼리스트링이라서 "pw=" 공백 사용할 수 없음

			success: function(data) {					
				if(data.message == "1") {						
					pw.parent().parent().next().css("display", "block").css("color", "#f46665").text("현재 비밀번호가 일치하지 않습니다.");
					pw.select();
					return false;
				} else if(data.message == "-1"){

					var scrollHeight = 0;
					
					scrollHeight = $("body").scrollTop();
					$("body").addClass("layer-open");
					$("#modal_leavecheck").css({
						"position" : "fixed", //최상위 div 고정 
						"top" : -scrollHeight // 최상위 div에 현재 스크롤된값 = 보이는화면만큼 top값 추가
					});
					
					$("#modal_leavecheck").show();
					
					var $layer = $('.js-layer_memberdele_ok');
				    $layer.removeClass('hidden_memeberdele_ok');
				} 
			},				
			error: function(){
				alert("System Error!!!");
			}
		});
	}	
});
/* 회원탈퇴 버튼 클릭 시 비밀번호 일치 검사 끝 */

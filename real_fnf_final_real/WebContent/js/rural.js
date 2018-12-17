$("#search_to_rural").click(function() {
	var radioval = $('input[name="bigd"]:checked').val();
	//alert("라디오버튼체크값:" + radioval); 
	if(radioval=="gover"){ //생산정보 선택하고 버튼 누름
		var region = $("#location_rural").val();
		var name = $(".select_product_name:visible").val();
		var year = $("#period_rural").val();
		var regionkor = $("#location_rural option:checked").text();
		// alert("지역:"+region+",한글지역:"+regionkor+",품목:"+name+",시작년도:"+year);
		// 품목명 hidden일 때는 null로 가져옴
		if(region=="지역 선택" || name==null || name=="선택" || year=="기간 선택"){
			alert("선택이 완료되지 않았습니다.");
		} else {
			// alert("페이지이동하라고");
			location.href="rural.bizpoll?region="+region+"&regionkor="+regionkor+"&name="+name+"&year="+year+"&radioval="+radioval;
		}
	} else{ // 생산일지 선택하고 버튼 누름
		location.href="rural.bizpoll?&radioval="+radioval;
	}
});

$(".select_product_name").change(function() {
	//alert("품목명 선택함");
});

$("#ouruser_rural").click(function() { // 생산일지로 선택했을 때 ㅅㅔ부항목 선택불가
	//alert("라디오버튼 일지 클릭");
	$(".searchboxtd_rural select").attr("disabled", true);
});

$("#government_rural").click(function() { // 생산물정보 선택했을 때 세부항목 선택 가능

	//alert("라디오버튼 정부통계 클릭");
	$(".searchboxtd_rural select").attr("disabled", false);
});





/* 검색조건 오픈 시작 */
$(function () { 
    $("#search_open_rural").click(function() {
        $("#search_input_rural").toggleClass("hide_rural");
    });
});
/* 검색조건 오픈 끝 */

/* 상위 셀렉트 박스 선택시 하위 설렉트 박스 표시 시작 */
function showSub(obj) {

    if(obj == "곡류") {    
    	product1_1.style.display = "";
        product1_2.style.display = "none";
        product1_3.style.display = "none";
        product1_4.style.display = "none";
        product1_5.style.display = "none";
    } else if(obj == "두류") {
    	product1_1.style.display = "none";
        product1_2.style.display = "";
        product1_3.style.display = "none";
        product1_4.style.display = "none";
        product1_5.style.display = "none";
     } else if(obj == "과실") {
    	product1_1.style.display = "none";
        product1_2.style.display = "none";
        product1_3.style.display = "";
        product1_4.style.display = "none";
        product1_5.style.display = "none";
     } else if(obj == "채소") {
        product1_1.style.display = "none";
        product1_2.style.display = "none";
        product1_3.style.display = "none";
        product1_4.style.display = "";
        product1_5.style.display = "none";
     } else if(obj == "특용작물") {
         product1_1.style.display = "none";
         product1_2.style.display = "none";
         product1_3.style.display = "none";
         product1_4.style.display = "none";
         product1_5.style.display = "";
      }
}
/* 상위 셀렉트 박스 선택시 하위 설렉트 박스 표시  끝 */
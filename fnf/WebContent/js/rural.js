$("#search_to_rural").click(function() {
	var region = $("#location_rural").val();
	var name = $(".select_product_name:visible").val();
	var year = $("#period_rural").val();
	// alert("지역:"+region+",품목:"+name+",시작년도:"+year);
	// 품목명 hidden일 때는 null로 가져옴
	if(region=="지역 선택" || name==null || name=="선택" || year=="기간 선택"){
		alert("선택이 완료되지 않았습니다.");
	} else {
		location.href="rural.bizpoll?region="+region_name+"&name="+name+"&year="+year;
	}
});

$(".select_product_name").change(function() {
	//alert("품목명 선택함");
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
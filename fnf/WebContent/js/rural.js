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
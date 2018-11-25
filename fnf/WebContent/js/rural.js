/* 검색조건 오픈 시작 */
$(function () { 
    $("#search_open_rural").click(function() {
        $("#search_input_rural").toggleClass("hide_rural");
    });
});
/* 검색조건 오픈 끝 */

/* 상위 셀렉트 박스 선택시 하위 설렉트 박스 표시 시작 */
function showSub(obj) {

    if(obj == "곡물") {    
    	product1_1.style.display = "";
        product1_2.style.display = "none";
        product1_3.style.display = "none";
    } else if(obj == "야채") {
    	product1_1.style.display = "none";
        product1_2.style.display = "";
        product1_3.style.display = "none";
     } else if(obj == "과일") {
    	product1_1.style.display = "none";
        product1_2.style.display = "none";
        product1_3.style.display = "";
     } else {
        product1_1.style.display = "none";
        product1_2.style.display = "none";
        product1_3.style.display = "none";
     } 
}
/* 상위 셀렉트 박스 선택시 하위 설렉트 박스 표시  끝 */
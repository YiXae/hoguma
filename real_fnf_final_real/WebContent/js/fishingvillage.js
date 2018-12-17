/* 검색조건 오픈 시작 */
$(function () {    
	$("#search_open_fish").click(function () {
        $("#search_input_fish").toggleClass("hide_fish"); 
    });
});
/* 검색조건 오픈 끝 */

/* 상위 셀렉트 박스 선택시 하위 설렉트 박스 표시 시작 */
function showSub(obj) {

    if(obj == "어류") {    
    	product1_1_fish.style.display = "";
        product1_2_fish.style.display = "none";
        product1_3_fish.style.display = "none";
    } else if(obj == "연체동물") {
    	product1_1_fish.style.display = "none";
        product1_2_fish.style.display = "";
        product1_3_fish.style.display = "none";
     } else if(obj == "해조류") {
    	product1_1_fish.style.display = "none";
        product1_2_fish.style.display = "none";
        product1_3_fish.style.display = "";
     } else {
        product1_1_fish.style.display = "none";
        product1_2_fish.style.display = "none";
        product1_3_fish.style.display = "none";
     } 
}
/* 상위 셀렉트 박스 선택시 하위 설렉트 박스 표시 끝 */

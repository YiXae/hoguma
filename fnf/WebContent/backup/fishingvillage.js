/* 검색조건 오픈 jQuery 시작 */
$(function () {
    $("#search_open").click(function () {
        $("#search_input").toggleClass("hide"); 
    });
});
/* 검색조건 오픈 jQuery 끝 */

/* 상위 셀렉트 박스 선택시 하위 설렉트 박스 표시 jQuery 시작 */
function showSub(obj) {

    f = document.forms.select_product;

    if(obj == "어류") {    
    	f.product1_1.style.display = "";
        f.product1_2.style.display = "none";
        f.product1_3.style.display = "none";
    } else if(obj == "연체동물") {
    	f.product1_1.style.display = "none";
        f.product1_2.style.display = "";
        f.product1_3.style.display = "none";
     } else if(obj == "해조류") {
    	f.product1_1.style.display = "none";
        f.product1_2.style.display = "none";
        f.product1_3.style.display = "";
     } else {
        f.product1_1.style.display = "none";
        f.product1_2.style.display = "none";
        f.product1_3.style.display = "none";
     } 
}
/* 상위 셀렉트 박스 선택시 하위 설렉트 박스 표시 jQuery 끝 */
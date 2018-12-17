/* 화면전환 카운트 시작 */
var cnt = 9;
function countdown() {
	if(cnt == 0) {
		clearInterval(s);
		location.href = "index.bizpoll";
	}
	
	document.getElementById("rCnt").innerHTML = cnt;
	cnt--;		
}

var s = setInterval(countdown, 1000); // Start! 1초 단위로 카운트다운 실행
/* 화면전환 카운트 끝 */
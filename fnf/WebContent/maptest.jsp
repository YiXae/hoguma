<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!DOCTYPE html>
<html>
<head>
   
    <title>다각형에 이벤트 등록하기2</title>
    <style>
.area {
    position: absolute;
    background: #fff;
    border: 1px solid #888;
    border-radius: 3px;
    font-size: 12px;
    top: -5px;
    left: 15px;
    padding:2px;
}

.info {
    font-size: 12px;
    padding: 5px;
}
.info .title {
    font-weight: bold;
}
</style>
</head>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bb1cb38fd36490239710319b9bbb201&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<body>
<div id="map" class="area" style="width:100%;height:550px;"></div>



</body>
<script>
//행정구역 구분
$(document).ready(function(){
	$.get("map/map1.geojson", function(geojson) {
		 
	    var data = geojson.features;
	    var coordinates = [];    //좌표 저장할 배열
	    var name = '';            //행정 구 이름
	 
	    $.each(data, function(index, val) {
	 
	        coordinates = val.geometry.coordinates;
	        name = val.properties.CTP_KOR_NM;
	        
	        displayArea(coordinates, name);
	 
	    })
	})
});	 
	 
	var polygons=[];                //function 안 쪽에 지역변수로 넣으니깐 폴리곤 하나 생성할 때마다 배열이 비어서 클릭했을 때 전체를 못 없애줌.  그래서 전역변수로 만듦.
	    
	//행정구역 폴리곤
	function displayArea(coordinates, name) {
	 
	    var path = [];            //폴리곤 그려줄 path
	    var points = [];        //중심좌표 구하기 위한 지역구 좌표들
	    
	    $.each(coordinates[0], function(index, coordinate) {        //console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
	        var point = new Object(); 
	        point.x = coordinate[1];
	        point.y = coordinate[0];
	        points.push(point);
	        path.push(new daum.maps.LatLng(coordinate[1], coordinate[0]));            //new daum.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
	    })

	  
	    // 다각형을 생성합니다 
	    var polygon = new daum.maps.Polygon({
	        map : map, // 다각형을 표시할 지도 객체
	        path : path,
	        strokeWeight : 2,
	        strokeColor : '#004c80',
	        strokeOpacity : 0.8,
	        fillColor : '#fff',
	        fillOpacity : 0.7
	    });
	    
	    polygons.push(polygon);            //폴리곤 제거하기 위한 배열
	 
	    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
	    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
	    daum.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
	        polygon.setOptions({
	            fillColor : '#09f'
	        });
	 
	        customOverlay.setContent('<div class="area">' + name + '</div>');
	 
	        customOverlay.setPosition(mouseEvent.latLng);
	        customOverlay.setMap(map);
	    });
	 
	    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
	    daum.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
	 
	        customOverlay.setPosition(mouseEvent.latLng);
	    });
	 
	    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
	    // 커스텀 오버레이를 지도에서 제거합니다 
	    daum.maps.event.addListener(polygon, 'mouseout', function() {
	        polygon.setOptions({
	            fillColor : '#fff'
	        });
	        customOverlay.setMap(null);
	    });
	 
	    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 해당 지역 확대을 확대합니다.
	    daum.maps.event.addListener(polygon, 'click', function() {
	        
	        // 현재 지도 레벨에서 2레벨 확대한 레벨
	        var level = map.getLevel()-2;
	        
	        // 지도를 클릭된 폴리곤의 중앙 위치를 기준으로 확대합니다
	        map.setLevel(level, {anchor: centroid(points), animate: {
	            duration: 350            //확대 애니메이션 시간
	        }});            
	 
	        deletePolygon(polygons);                    //폴리곤 제거      
	    });
	}
	


</script>

</html>
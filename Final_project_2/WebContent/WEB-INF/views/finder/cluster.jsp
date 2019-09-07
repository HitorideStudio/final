<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Cluster Maker info</title>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    </style>
</head>
<body>
<div id="map" style="width:80%;height:800px;"></div>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e0cc7f923dfb2d33aa1685a125ad6cb&libraries=clusterer"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.55608, 126.9234), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 



var list = new Array();
var lon = new Array();
var lat = new Array();

//jstl 혼합사용
<c:forEach items="${list}" var="list">
list.push("${list.placename}"); //list[i]
list.push("${list.lon}"); //list[i+1]
list.push("${list.lat}"); //list[i+2]
list.push("${list.address}"); //list[i+3]
list.push("${list.tel}"); //list[i+4]
</c:forEach>
// 마커 클러스터러를 생성합니다 


	
	
		var clusterer = new kakao.maps.MarkerClusterer({
		    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		    minLevel: 2 // 클러스터 할 최소 지도 레벨 
		});

		
		console.log(clusterer);
		
		var overlay = new Array();
		  for(i=0;i<list.length;i+=5){
				 markers = new kakao.maps.Marker({
		       		map: map, // 마커를 표시할 지도
		        	position: new kakao.maps.LatLng(list[i+2],list[i+1]), // 마커를 표시할 위치
		        	title : list[i] // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		    	});
		   	   clusterer.addMarker( markers ); //클러스터러 마커추가

			//클릭이벤트 커스텀오버레이 내용
				var content = '<div class="wrap">' + 
			        '    <div class="info">' + 
			        '        <div class="title">' + 
			                	list[i]    + 
			        '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>' + 
			        '        </div>' + 
			        '        <div class="body">' + 
			        '            <div class="img">' +
			        '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			        '           </div>' + 
			        '            <div class="desc">' + 
			        '                <div class="ellipsis">'+ list[i+3] +'</div>' + 
			        '                <div class="jibun ellipsis">' + list[i+4] + '</div>' + 
			        '                <div><a href="http://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			        '            </div>' + 
			        '        </div>' + 
			        '    </div>' +    
			        '</div>';
			        
				clickover(i);
				overlay[i].setMap(null);
					  
		      function closeOverlay(i) {
		    	  overlay[i].setMap(null);     
		      }
		    	  			

		  }
		   	function clickover(i){
		   		overlay[i] = new kakao.maps.CustomOverlay({
				    content: content,
				    map: map,
				    position: new kakao.maps.LatLng(list[i+2],list[i+1])      
				});
				
		   	 kakao.maps.event.addListener(markers, 'click', function() {
			  	    overlay[i].setMap(map);
			  	});
			}
		 
	test(list);
	
	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다


	 
	 
</script>
</body>
</html>
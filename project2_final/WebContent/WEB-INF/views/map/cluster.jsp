<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
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
    .glyphicon {
              position: relative;
              top: 1px;
              display: block;
              font-family: 'Glyphicons Halflings';
              font-style: normal;
              font-weight: normal;
              line-height: 1;
              font-size:2.3em;
              -webkit-font-smoothing: antialiased;
              -moz-osx-font-smoothing: grayscale;}
    button{width:100px; height:60px; border:none; background:white; margin-left:50%;}
    .wimg{vertical-align:top; width:1.4em; margin-left:10px}
    </style>
</head>
<body>
   <div style="float:left;">
      <button type="button" class="glyphicon glyphicon-search " onclick="search()" />
      <button type="button" class="glyphicon glyphicon-share-alt " onclick="getLocation()" />
      <button type="button" id="favor" class="glyphicon glyphicon-star "/>
   </div>
   <div id="map" style="width:80%;height:690px; margin-left:5%; float:left;"></div>
   <br/><br/>
   <div id="favoo" style="display:none;">
   <p> <h2 style="text-align:center;">FAVORITELIST</h2> </p>
   <div id="favo" style="text-align:center;">
   </div>
   </div>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=545a5f015033824acfc1f335c12d37ca&libraries=clusterer"></script>
<script>
//즐겨찾기 toggle
 $('#favor').click(function(){
  if( $("#favoo").is(":hidden") ) {
	  $('#favoo').show();
} else {
    $("#favoo").hide()
}
 });
// map 생성   
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


      // 클러스터 생성
      var clusterer = new kakao.maps.MarkerClusterer({
          map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
          averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
          minLevel: 2 // 클러스터 할 최소 지도 레벨 
      });
	  //오버레이 변수(2)
      var j=0;
      //오버레이 생성 
      var overlay = new Array();
        for(i=0;i<list.length;i+=5){
             markers = new kakao.maps.Marker({
                   map: map, // 마커를 표시할 지도
                 position: new kakao.maps.LatLng(list[i+2],list[i+1]), // 마커를 표시할 위치
                 title : list[i] // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
             });
               clusterer.addMarker( markers ); //클러스터러 마커추가
			//리뷰 정보 조회 변수
   			var placename= "'"+list[i]+"'";
   			var place = "'"+list[i+5]+"'";
   
         //클릭이벤트 커스텀오버레이 내용
         var no = "'"+list[i+4]+"'";
         var    content = '<div class="wrap">' + 
                 '    <div class="info">' + 
                 '        <div class="title">' + 
                            list[i]    +'<a href="javascript:wishclick('+no+','+placename+')"><img src="/project2_final/resources/img/wisha.png" class="wimg" /></a>'+
                 '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>' + 
                 '        </div>' + 
                 '        <div class="body">' + 
                 '            <div class="img">' +
                 '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
                 '           </div>' + 
                 '            <div class="desc">' + 
                 '                <div class="ellipsis">'+ list[i+3] +'</div>' + 
                 '                <div id= "tel" class="jibun ellipsis" name="tel">' + list[i+4] + '</div>' + 
                 '                <div><a class="btn-example" onclick="javascript:reply('+no+','+placename+','+place+')" target="_blank" class="link">리뷰 보기</a></div>' + 
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
      // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
            function clickover(i){
               overlay[i] = new kakao.maps.CustomOverlay({
                content: content,
                map: map,
                position: new kakao.maps.LatLng(list[i+2],list[i+1])      
            });
            
             kakao.maps.event.addListener(markers, 'click', function() {
            	 closeOverlay(j);
		  	     overlay[i].setMap(map);
		  	      j = i;		
              });
         

         }    


         // 현재 위치로 이동합니다.
         function getLocation() {
           if (navigator.geolocation) {
             navigator.geolocation.getCurrentPosition(showPosition);
           } else { 
             alert("Geolocation is not supported by this browser.");
           }
         }
            function showPosition(position) {
             var moveLatLon = new kakao.maps.LatLng(position.coords.latitude,position.coords.longitude);
                
                // 지도 중심을 이동 시킵니다
                map.setCenter(moveLatLon);
               }

            //즐겨찾기 추가 및 삭제
            function wishclick(no,placename){
               var id = "${sessionScope.memId}";
               console.log(no);
               if(id == ""){
                  alert("로그인 후 사용해 주세요.")}
               else{
                   $.ajax({
                     url: "wishlist.do",
                     type: "POST",
                     data: {no : no,
                          id :id,
                          placename : placename },                          
                     success: function(data) {
                         $("#favo").html(data); 
                              }
                   
                   });
               }
            }

            //마커안에 리뷰 클릭했을 때
        	function reply(no,placename,place){
        		window.open("/project2_final/infoboard/writeForm.do?&number="+no+"&placename="+placename+"&place="+place,"window","width=800,height=800,left=600,location=no");
        		}
        	//서치로 이동
        	function search(){
        		location = "/project2_final/map/search.do";
        		}
        	
</script>
</body>
</html>
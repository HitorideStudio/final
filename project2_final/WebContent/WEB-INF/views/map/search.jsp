<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <meta charset="utf-8">
    <title>키워드로 장소검색하고 목록으로 표출하기</title>
    <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;background:#fd5757;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
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
              button{width:50px; height:30px; border:none; background:white; margin-left:50%;}
.map_wrap, .map_wrap * {padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.wimg{vertical-align:top; width:2em; margin-left:10px}
</style>
</head>

<body>
<!--메뉴 -->
<div>
<jsp:include page="/WEB-INF/views/menu/menu.jsp" />
</div>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" name="keyword" id="keyword"> 
                    <button type="submit">검색하기</button><button onclick="allMarker(); return false;">전체보기</button>
                </form>
               
            </div>
        </div>
         
        <hr>
        <ul id="placesList"></ul>
    	<div id="pagination"></div>
    </div>
</div>
 <div style="float:left;">

      <button type="button" id="favor" class="glyphicon glyphicon-star "/>
   </div>
<div id="favoo" style="display:none;">
   <p> <h2 style="text-align:center;">FAVORITELIST</h2> </p>
   <div id="favo" style="text-align:center;">
   </div>
   </div>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=545a5f015033824acfc1f335c12d37ca&libraries=services&libraries=clusterer"></script>
<script>
//즐겨찾기 toggle
$('#favor').click(function(){
 if( $("#favoo").is(":hidden") ) {
	  $('#favoo').show();
} else {
   $("#favoo").hide()
}
});

//오버레이 생성 
var overlay = new Array();

// 마커를 담을 배열입니다
var markers = [];



var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 



// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

//
var clusterer = new kakao.maps.MarkerClusterer({
	map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	markers:markers,
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 2 // 클러스터 할 최소 지도 레벨 
    
});
function allMarker(){
	 $.ajax({
	        url :'dataAll.do',	      
	        dataType:'json',
	        success : function(data) { 
				
						
						placesSearchCB(data);
						
					}
	    });
	
}

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    $.ajax({
        url :'markerdata.do',
        data:{keyword:$("#keyword").val()},
        dataType:'json',
        success : function(data) { 
			if(data==""){
				alert("검색결과가없습니다.");
				}else{
					
					placesSearchCB(data);
					}
				}
    });
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data) {
	
        // 정상적으로 검색이 완료됐으면
       
        // 검색 목록과 마커를 표출합니다
    	clusterer.clear();
        displayPlaces(data);
     	addClus();
      
        
	//클러스터러
	

      
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
	
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();


    //클러스터러
     
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].lat, places[i].lon),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
            
            //오버레이
            var number = "'"+places[i].tel+"'";
    		var placename= "'"+places[i].placename+"'";
    		
    			//클릭이벤트 커스텀오버레이 내용
    			        var    content = '<div class="wrap">' + 
    	                 '    <div class="info">' + 
    	                 '        <div class="title">' + 
    	                 	places[i].placename    +'<a href="javascript:wishclick('+number+','+placename+')"><img src="/project2_final/resources/img/wisha.png" class="wimg" /></a>'+
    	                 '            <div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>' + 
    	                 '        </div>' + 
    	                 '        <div class="body">' + 
    	                 '            <div class="img">' +
    	                 '                <img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
    	                 '           </div>' + 
    	                 '            <div class="desc">' + 
    	                 '                <div class="ellipsis">'+ places[i].address +'</div>' + 
    	                 '                <div id= "tel" class="jibun ellipsis" name="tel">' + number + '</div>' + 
    	                 '                <div><a class="btn-example" onclick="javascript:reply('+number+','+placename+')" target="_blank" class="link">리뷰 보기</a></div>' + 
    	                 '            </div>' + 
    	                 '        </div>' + 
    	                 '    </div>' +    
    	                 '</div>';
    			        //"/project2_final/infoboard/writeForm.do?&number='+list[i+4]+'&placename='+list[i]+'&place='+list[i+5]+'
    				clickover(content,places,i);
    				overlay[i].setMap(null);
				  

    				
	   

	
	




            
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, places) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, places);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, places);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].placename);

        fragment.appendChild(itemEl);
    }
   
    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

var j=0;

//오버레이제거
function closeOverlay(i) {
	overlay[i].setMap(null);  
}
//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
function clickover(content,places,i){
   overlay[i] = new kakao.maps.CustomOverlay({
    content: content,
    map: map,
    position: new kakao.maps.LatLng(places[i].lat,places[i].lon)      
});
   kakao.maps.event.addListener(markers[i],'click', function() {
		 closeOverlay(j);
		     overlay[i].setMap(map);
		     j = i;
	 });
}



// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.placename + '</h5>';

    if (places.address) {
        itemStr += '    <span>' + places.address + '</span>' +
                    '   <span class="jibun gray">' +  places.address + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.tel  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position) {
    
           var marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
           
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
    return marker;
}



// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

function addClus(){

	clusterer.addMarkers( markers );
}

function removeClus(){
	clusterer.clear();
	
}


// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
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
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
 <script>
//���ã�� ����
 function wishmove(data,i){
      console.log(no);
   var id = "${sessionScope.memId}";
   var tag = "#test"+i;
      var conf = confirm("���ã�⸦ �����Ͻðھ��?");
         if(conf){
         $.ajax({
            url: "del.do",
            type: "post",
            data: { num : data},
            success: function(data) {
            $( tag ).remove();
            }
         });
      }
   } 

 </script>
 
 <c:set var="num" value="${no}" />
 <c:set var="i" value="0" />
 <c:forEach items="${favolist}" var="favolist">
  <c:set var="i" value="${i+1}" />
  <div id="test${i}">
<li>${favolist.placename}<button type="button" name="${favolist}" style="width:10px;" onclick="javascript:wishmove('${favolist.placename}','${i}')">X</button></li>

</div>
</c:forEach>
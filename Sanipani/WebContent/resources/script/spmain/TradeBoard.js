/**
 * 
 */


$(document).ready(function(){
   refreshList1();
   $("#searchSelect2").on("change",function(){
   
      $("input[name='search']").val($("select[name='search2']").val());
      alert($("input[name='search']").val());
      $("#list2").submit();
      refreshList1();
   });
   $("#searchBtn").on("click",function(){
      $("input[name='searchText']").val($("#searchText").val()); //searchText의 value에 serchTextval의 값을 넣는다.
      $("input[name='page']").val("1");
      
      refreshList1();
   });
   
   $("#tradeBoardAddBtn").on("click",function(){
      if($("input[name='sNo']").val()>0){
      $("#actionForm").attr("action", "TradeBoardAdd");  //actionForm의 action값에  test7을 넣음.
      $("#actionForm").attr("method", "post");
      $("#actionForm").submit(); //actionForm 실행
      }else {
         alert("로그인을 하세요");
      }
   });
   
   
   $("#tradePageNo").on("click", "span", function(){
      $("input[name='page']").val($(this).attr("name"));
      
      refreshList1();
   });
   
   $("#tradeList").on("click", "tr", function(){
      $("input[name='testNo']").val($(this).attr("name"));
   
       $("#actionForm1").attr("action", "TradeBoardLook"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
      $("#actionForm1").submit();
   });
});      
      
      
   
function refreshList1(){
   var params = $("#actionForm").serialize(); //serialize 정렬해서 보여준다.
   
   $.ajax({//비동기화방식
      type : "post",
      url : "refreshTest1", 
      dataType : "json",
      data : params,
      success : function(result){
         var html = "";
         
         for(var i = 0 ; i < result.list.length ; i++){
            html += "<tr name='" + result.list[i].TRADE_WORD_NO + "'>";
            html += "<td td width='10px'>" + result.list[i].NO + "</td>";
            if(result.list[i].PICTURENAME==null){
            	html += "<td width='100px'><img src=\"resources/images/TradeStatus1/no_image.png\"/></td>";
            }else{
                html += "<td width='100px'>"+"<img src=\"resources/upload/"+result.list[i].PICTURENAME+"\"/></td>";
            }
            html += "<td width='100px'>" + result.list[i].TRADE_BOARD + "</td>";
            html += "<td width='100px'>" + result.list[i].WORD_TITLE + "</td>";
            html += "<td>" + result.list[i].BUY_PAY + "</td>";
            
            html += "<td>" + result.list[i].NICK + "</td>";
            html += "<td>" + result.list[i].WRITER_DATE + "</td>";
            html += "<td>" + result.list[i].LOOKUP + "</td>";
            
            html += "</tr>";
         }
         
         $("#tradeList").html(html);
         
      html = "";
      html += "<span name='1'>처음</span>";
      
/*       if($("input[name='page']").val() == 1){
         html += "<span name='1'>이전</span>";
      } else{
         html += "<span name='" + ($("input[name='page']").val - 1) + "'>이전</span>";
      } */
      if($("input[name='page']").val() == 1) {
            html += "<span name='1'>이전</span>";
         } else {
            html += "<span name = '" + ($("input[name='page']").val() - 1) + "'>이전</span>";
         }
      
      for(var i = result.pb.startPcount ; i <= result.pb.endPcount ; i++){
         if(i == $("input[name='page']").val()){
            html += "<span name='" + i + "'><b>" + i + "</b></span>";
         } else{
            html += "<span name='" + i + "'>" + i + "</b></span>";
         }
      }
      
      if($("input[name='page']").val() == result.pb.maxPcount){
         html += "<span name='" + result.pb.maxPcount + "'>다음</span>";
      } else{
         html += "<span name='" + ($("input[name='page']").val() * 1 + 1) + "'>다음</span>";
      }
      
      
      html += "<span name='" + result.pb.maxPcount+"'>마지막</span>";
      
      $("#tradePageNo").html(html);
         
      },
      error : function(result){
         alert("error!!");
      }
   });
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/spmain/Mainpage.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>
<style type="text/css">
.showTradeBoard{
	margin-top : 10px;
	margin-left : 115px;
	width: 900px;
	height: 1000px;
	background-color: #FFFFFF;	
}
.Auction{
	margin-top : 40px;
	width: 900px;
	height: 400px;
	
}
.TradeProgress{
	margin-top : 10px;
	width: 800px;
	height: 400px;

}
.TradeRequest{
	margin-top : 10px;
	width: 800px;
	height: 400px;

}
.AcutionComple{
	margin-top : 40px;
	width: 900px;
	height: 400px;

}
.AcutionTrade{
	margin-top : 40px;
	width: 900px;
	height: 400px;

}
.AuctionBasket{
	width: 1000px;
	height: 1000px;
}
.AuctionBasketBtn{
	display : inline-block;
	margin-top : 20px;
	width: 70px;
	height: 40px;
		background-color: #CCCCCC;
}
.TradeBasketBtn{
	display : inline-block;
	margin-left : 40px;
	margin-top : 20px;
	width: 70px;
	height:40px;
		background-color: #CCCCCC;
}


td{
	text-overflow: ellipsis;
	height: 10px;

}
table{
	text-overflow: ellipsis;
	width:900px;
	border-bottom: 1px;
}
select{
	
	margin-left: 820px;
}

th {
	background-color: #6DD66D;
	
}
tr:hover{
	background-color: #EEEEEE;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	showTrade();
	showTradeSell();
	

	
	$(".TradeBasketBtn").on("click",function(){
	
		$(".AuctionBasket").css("display","none");
		$(".TradeBasket").css("display","block");
		showTrade();
		showTradeSell();
	});
	
	$(".AuctionBasketBtn").on("click",function(){

		$(".AuctionBasket").css("display","block");
		$(".TradeBasket").css("display","none");

		showAutionBuy();
		showAutionComple();
		showAutionTrade();
	});
	
	$("#searchBtn").on("click",function(){
		$("input[name='searchText']").val($("#searchText").val()); //searchText의 value에 serchTextval의 값을 넣는다.
		$("input[name='page']").val("1");
		
		showTrade();
	});
	
	
	
	
	$("#tradePageNo").on("click", "span", function(){
		$("input[name='page']").val($(this).attr("name"));
		
		showTrade();
	});
	
	$("#tradeList").on("click", "tr", function(){
		$("input[name='TradeNo']").val($(this).attr("name"));
	
		 $("#actionForm").attr("action", "TradeRequest"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	});
	
	
	$("#searchBtn1").on("click",function(){
		$("input[name='searchText']").val($("#searchText1").val()); //searchText의 value에 serchTextval의 값을 넣는다.
		$("input[name='page']").val("1");
		
		showTradeSell();
	});
	
	$("#searchBtn2").on("click",function(){
		$("input[name='searchText']").val($("#searchText2").val()); //searchText의 value에 serchTextval의 값을 넣는다.
		$("input[name='page']").val("1");
		alert($("input[name='searchText']").val());
		showAutionBuy();
	});
	
	
	$("#searchBtn3").on("click",function(){
		$("input[name='searchText']").val($("#searchText3").val()); //searchText의 value에 serchTextval의 값을 넣는다.
		$("input[name='page']").val("1");
		
		showAutionComple();
	});
	
	
	
	$("#searchBtn4").on("click",function(){
		$("input[name='searchText']").val($("#searchText4").val()); //searchText의 value에 serchTextval의 값을 넣는다.
		$("input[name='page']").val("1");
		
		showAutionTrade();
	});
	
	
	
	$("#tradePageNo1").on("click", "span", function(){
		$("input[name='page']").val($(this).attr("name"));
		
		showTradeSell();
	});
	
	$("#tradeList1").on("click", "tr", function(){
		$("input[name='TradeNo']").val($(this).attr("name"));
	
		 $("#actionForm").attr("action", "TradeRequest"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	});
	
	
	
	
	$("#tradePageNo2").on("click", "span", function(){
		$("input[name='page']").val($(this).attr("name"));
		
		showAutionBuy();
	});
	
	$("#tradeList2").on("click", "tr", function(){
	
	
		 
		$("input[name='auctionNo']").val($(this).attr("name"));
		var ar= $("input[name='auctionNo']").val();
	    var arr = ar.split("_");
		$("input[name='auctionNo']").val(arr[0]);
		$("#actionFormAuction").attr("action", "AuctionDetailLook");
		$("#actionFormAuction").submit();
	});
	
	
	$("#tradePageNo3").on("click", "span", function(){
		$("input[name='page']").val($(this).attr("name"));
		
		showAutionComple();
	});
	
	$("#tradeList3").on("click", "tr", function(){
		
		$("input[name='auctionNo']").val($(this).attr("name"));
		var ar= $("input[name='auctionNo']").val();
	    var arr = ar.split("_");
		$("input[name='auctionNo']").val(arr[0]);
		if(arr[1]=='null'){
		$("#actionFormAuction").attr("action", "AuctionEscrow");
		$("#actionFormAuction").submit();
		}
		else{
			$("#actionFormAuction").attr("action", "AuctionRequest1");
			$("#actionFormAuction").submit();	
			
		}
	});
	
	
	
	
	
	$("#tradePageNo4").on("click", "span", function(){
		$("input[name='page']").val($(this).attr("name"));
		
		showAutionTrade();
	});
	
	
	
	$("#tradeList4").on("click", "tr", function(){
	
	
		
		$("input[name='auctionNo']").val($(this).attr("name"));
		var ar= $("input[name='auctionNo']").val();
	    var arr = ar.split("_");
		$("input[name='auctionNo']").val(arr[0]);
		alert(arr[1]);
		if(arr[1]=='null'){
		$("#actionFormAuction").attr("action", "AuctionEscrow");
		$("#actionFormAuction").submit();
		}
		else{
			$("#actionFormAuction").attr("action", "AuctionRequest1");
			$("#actionFormAuction").submit();	
			
		}
	});

});		
		
		
function showTrade(){
	var params = $("#actionForm").serialize(); //serialize 정렬해서 보여준다.
	
	$.ajax({//비동기화방식
		type : "post",
		url : "showTrade", 
		dataType : "json",
		data : params,
		success : function(result){
			var html = "";
			
			for(var i = 0 ; i < result.list.length ; i++){
				html += "<tr name='" + result.list[i].TRADE_NO + "'>";
				html += "<td>" + result.list[i].NO + "</td>";
				
				html += "<td>" + result.list[i].ID + "</td>";
				html += "<td>" + result.list[i].WORD_TITLE + "</td>";
				html += "<td>" + result.list[i].BUY_PAY + "</td>";
			
				html += "<td>" + result.list[i].TRADE_STATUS + "</td>";
				html += "<td>" + result.list[i].TRADE_DATE + "</td>";
				if(result.list[i].ESCROW_WHETHER==1){
					html += "<td>중매</td>";	
					}else {
						
						html += "<td>중매를 하지 않았습니다</td>";	
					}
				
				html += "</tr>";
			}
			
			$("#tradeList").html(html);
			
		html = "";
		html += "<span name='1'>처음</span>";
		
/* 		if($("input[name='page']").val() == 1){
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





function showTradeSell(){
	var params = $("#actionForm").serialize(); //serialize 정렬해서 보여준다.
	
	$.ajax({//비동기화방식
		type : "post",
		url : "showTradeSell", 
		dataType : "json",
		data : params,
		success : function(result){
			var html = "";
			
			for(var i = 0 ; i < result.list.length ; i++){
				html += "<tr name='" + result.list[i].TRADE_NO + "'>";
				html += "<td>" + result.list[i].NO + "</td>";
				html += "<td>" + result.list[i].ID + "</td>";							
				html += "<td>" + result.list[i].TRADE_BOARD + "</td>";						
				html += "<td>" + result.list[i].TRADE_STATUS + "</td>";
				html += "<td>" + result.list[i].TRADE_DATE + "</td>";
				if(result.list[i].ESCROW_WHETHER==1){
					html += "<td>중매</td>";	
					}else {
						
						html += "<td>중매를 하지 않았습니다</td>";	
					}
							
				html += "</tr>";
			}
			
			$("#tradeList1").html(html);
			
		html = "";
		html += "<span name='1'>처음</span>";
		
/* 		if($("input[name='page']").val() == 1){
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
		
		$("#tradePageNo1").html(html);
			
		},
		error : function(result){
			alert("error!!");
		}
	});
}


function showAutionBuy(){
	$("input[name='comple']").val("1");
	var params = $("#auctionForm").serialize(); //serialize 정렬해서 보여준다.
	
	$.ajax({//비동기화방식
		type : "post",
		url : "showAutionBuy", 
		dataType : "json",
		data : params,
		success : function(result){
			var html = "";
			
			for(var i = 0 ; i < result.list.length ; i++){
				html += "<tr name='" + result.list[i].AUCTIONWORDNO + "'>";
				html += "<td>" + result.list[i].NO + "</td>";
				html += "<td>" + result.list[i].ID + "</td>";
				html += "<td>" + result.list[i].WORDCONTENT + "</td>";
				html += "<td>" + result.list[i].STARTBUYPAY + "</td>";						
				html += "<td>" + result.list[i].BIDPRICE + "</td>";
				html += "<td>" + result.list[i].TRADE_STATUS + "</td>";
				
				html += "<td>" + result.list[i].ENDDATE + "</td>";			
				html += "</tr>";
			}
			
			$("#tradeList2").html(html);
			
		html = "";
		html += "<span name='1'>처음</span>";
		
/* 		if($("input[name='page']").val() == 1){
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
		
		$("#tradePageNo2").html(html);
			
		},
		error : function(result){
			alert("error!!");
		}
	});
}



function showAutionComple(){
	$("input[name='comple']").val("2");
	var params = $("#auctionForm").serialize(); //serialize 정렬해서 보여준다.
	

	
	
	$.ajax({//비동기화방식
		type : "post",
		url : "showAutionBuy", 
		dataType : "json",
		data : params,
		success : function(result){
			var html = "";
			
			for(var i = 0 ; i < result.list.length ; i++){
				html += "<tr name='" + result.list[i].AUCTIONNO +"_"+ result.list[i].ESCROWWHETHER +"'>";
				html += "<td>" + result.list[i].NO + "</td>";
				html += "<td>" + result.list[i].ID + "</td>";
				html += "<td>" + result.list[i].WORDCONTENT + "</td>";
				html += "<td>" + result.list[i].STARTBUYPAY + "</td>";						
				html += "<td>" + result.list[i].BIDPRICE + "</td>";
				html += "<td>" + result.list[i].TRADE_STATUS + "</td>";
				html += "<td>" + result.list[i].ENDDATE + "</td>";			
				html += "</tr>";
			}
			
			$("#tradeList3").html(html);
			
		html = "";
		html += "<span name='1'>처음</span>";
		
/* 		if($("input[name='page']").val() == 1){
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
		
		$("#tradePageNo3").html(html);
			
		},
		error : function(result){
			alert("error!!");
		}
	});
	
	
}

function showAutionTrade(){
	
	var params = $("#auctionForm").serialize(); //serialize 정렬해서 보여준다.
	

	
	
	$.ajax({//비동기화방식
		type : "post",
		url : "showAutionTrade", 
		dataType : "json",
		data : params,
		success : function(result){
			var html = "";
			
			for(var i = 0 ; i < result.list.length ; i++){
				html += "<tr name='" + result.list[i].AUCTIONNO +"_"+ result.list[i].ESCROWWHETHER +"'>";
				html += "<td>" + result.list[i].NO + "</td>";
				html += "<td>" + result.list[i].ID + "</td>";
				html += "<td>" + result.list[i].WORDCONTENT + "</td>";
				html += "<td>" + result.list[i].STARTBUYPAY + "</td>";						
				html += "<td>" + result.list[i].BIDPRICE + "</td>";
				html += "<td>" + result.list[i].TRADE_STATUS + "</td>";
				html += "<td>" + result.list[i].ENDDATE + "</td>";			
				html += "</tr>";
			}
			
			$("#tradeList4").html(html);
			
		html = "";
		html += "<span name='1'>처음</span>";
		
/* 		if($("input[name='page']").val() == 1){
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
		
		$("#tradePageNo4").html(html);
			
		},
		error : function(result){
			alert("error!!");
		}
	});
	
	
}
</script>
</head>
<body>
<div class="main">
	<div class="left"></div>
	<div class="main1">
		
		<div class="login">
			<div class="loginNull">
			</div>
			
			
<<<<<<< HEAD
			      <!--로그인 접속전  -->
      
      <c:choose>
         <c:when test="${sNo ne null}">
            <div class="loginAccess" id="loginAccess" style="display: none;">
         </c:when>
         <c:otherwise>
            <div class="loginAccess" id="loginAccess">
         </c:otherwise>
      </c:choose>   
         <form action="#" id="LoginForm" method="post" style="display:inline"><!--form도  display를 줘야한다 -->
         
            <div class="login1">
               <div class="id">
                  <b>ID:</b><input type="text" name="Id" id="Id" maxlength="15" border="1">
               </div>
            </div>
         
            <div class="login2">
               <div class="pw">
                  <b>PW:</b><input type="password" name="Pw" id="Pw"  maxlength="15" border="1">
               </div>   
            </div>
         </form>   
            <div class="login3">
               <div class="loginBtn">
                  <img alt="LoginBtn" src="resources/images/MainPageImage/Login.bmp">
               </div>
            </div>
            
            <div class="login4">
               <div class="memberLogiBtn">
                  <img alt="RegisterBtn" src="resources/images/MainPageImage/RegisterImg.bmp">
               </div>
            </div>
         
         
         </div>
      
         
         
         
         <!-- 로그인 접속후 -->
      <c:choose>
         <c:when test="${sNo ne null}">
            <div class="loginCut" id="loginCut">
         </c:when>
         <c:otherwise>
            <div class="loginCut" id="loginCut" style="display:none" >
         </c:otherwise>
      </c:choose>   
            <div class="login1_1">
               <div class="memberInfo">
                  <b><span id="memNick">${sNick}</span>님 환영합니다</b>
               </div>
            </div>
            
            <div class="login2_1">
               <div class="logout">
                  <img alt="LogoutBtn" src="resources/images/MainPageImage/Logout.bmp">
               </div>      
            </div>
            
            <div class="login3_1">
               <div class="mypage">
                  <img alt="MypageBtn" src="resources/images/MainPageImage/Mypage.bmp">
               </div>
            </div>
            
            <div class="login4_1">
               <div class="basket">
                  <img alt="BasketBtn" src="resources/images/MainPageImage/Basket.bmp">
               </div>
            </div>
            
         
         </div>
           
      </div>
      
   
      
      
      <div class="menubar">
         <div class="logo">
            <img alt="logo" src="resources/images/MainPageImage/SaniPaniLogo.png" width="226.44px" height="150px" border="2">
         </div>
         
         <div class="menuall" height="150px">
         <div height="30px"></div>
         <br/>
            <div class="auctionBoard" id="auctionBoard" height="120px">
               <img alt="AuctionImg" src="resources/images/MainPageImage/AuctionImg.bmp">
            </div>
            <div class="tradeBoard" id="tradeBoard">
               <img alt="TradeImg" src="resources/images/MainPageImage/TradeImg.bmp">
            </div>
            <div class="reportBoard">
               <img alt="ReportImg" src="resources/images/MainPageImage/ReportImg.bmp">
            </div>
            <div class="customerBoard">
               <img alt="CustomerImg" src="resources/images/MainPageImage/CustomerImg.bmp">
            </div>
            <div class="freeBoard">
               <img alt="FreeImg" src="resources/images/MainPageImage/FreeImg.bmp">
            </div>
         </div>
      </div>
		
=======
			<!--로그인 접속전  -->
		<c:choose>
			<c:when test="${sNo ne null}">
				<div class="loginAccess" id="loginAccess" style="display: none;">
			</c:when>
			<c:otherwise>
				<div class="loginAccess" id="loginAccess">
			</c:otherwise>
		</c:choose>	
			<form action="#" id="LoginForm" method="post" style="display:inline"><!--form도  display를 줘야한다 -->
			
				<div class="login1">
					<div class="id">
						<b>ID:</b><input type="text" name="Id" id="Id" maxlength="15" border="1">
					</div>
				</div>
			
				<div class="login2">
					<div class="pw">
						<b>PW:</b><input type="password" name="Pw" id="Pw"  maxlength="15" border="1">
					</div>	
				</div>
			</form>	
				<div class="login3">
					<div class="loginBtn">
						<img alt="LoginBtn" src="resources/images/MainPageImage/Login.bmp">
					</div>
				</div>
				
				<div class="login4">
					<div class="memberLogiBtn">
						<img alt="RegisterBtn" src="resources/images/MainPageImage/RegisterImg.bmp">
					</div>
				</div>
			
			
			</div>
		
			
			
			
			<!-- 로그인 접속후 -->
		<c:choose>
			<c:when test="${sNo ne null}">
				<div class="loginCut" id="loginCut">
			</c:when>
			<c:otherwise>
				<div class="loginCut" id="loginCut" style="display:none" >
			</c:otherwise>
		</c:choose>	
				<div class="login1_1">
					<div class="memberInfo">
						<b><span id="memNick">${sNick}</span>님 환영합니다</b>
					</div>
				</div>
				
				<div class="login2_1">
					<div class="logout">
						<img alt="LogoutBtn" src="resources/images/MainPageImage/Logout.bmp">
					</div>		
				</div>
				
				<div class="login3_1">
					<div class="mypage">
						<img alt="MypageBtn" src="resources/images/MainPageImage/Mypage.bmp">
					</div>
				</div>
				
				<div class="login4_1">
					<div class="basket">
						<img alt="BasketBtn" src="resources/images/MainPageImage/Basket.bmp">
					</div>
				</div>
				
			
			</div>
			  
		</div>
		
	
		
		
		<div class="menubar">
			<div class="logo">
				<img alt="logo" src="resources/images/MainPageImage/SaniPaniLogo.png" width="226.44px" height="150px" border="2">
			</div>
			
			<div class="menuall" height="150px">
			<div height="30px"></div>
			<br/>
				<div class="auctionBoard" id="auctionBoard" height="120px">
					<img alt="AuctionImg" src="resources/images/MainPageImage/AuctionImg.bmp">
				</div>
				<div class="tradeBoard" id="tradeBoard">
					<img alt="TradeImg" src="resources/images/MainPageImage/TradeImg.bmp">
				</div>
				<div class="reportBoard">
					<img alt="ReportImg" src="resources/images/MainPageImage/ReportImg.bmp">
				</div>
				<div class="customerBoard">
					<img alt="CustomerImg" src="resources/images/MainPageImage/CustomerImg.bmp">
				</div>
				<div class="freeBoard">
					<img alt="FreeImg" src="resources/images/MainPageImage/FreeImg.bmp">
				</div>
			</div>
		</div>
		<br/>
>>>>>>> branch 'master' of https://github.com/limsk1993/Sanipani
		<div class="content">
			<div class="showTradeBoard">
			
			
			<form action="#" id="actionFormAuction" method="post">
				<input type="hidden" name="auctionNo" value="" />
			</form>
			
			<form action="#" id="auctionForm" method="post">
					<c:choose>
					<c:when test="${empty param.page}"> <!-- empty 는 비어있으면. -->
						<input type="hidden" name="page" value="1" />
					</c:when>
			
					<c:otherwise>
						<input type="hidden" name="page" value="${param.page}"/>
					</c:otherwise>
				</c:choose>
					
					<input type="hidden" name="sNo" value="${sNo}"/>
					<input type="hidden" name="comple" value=""/>
					<input type="hidden" name="searchText" value="${param.searchText}"/>
			</form>
			
			<form action="#" id="actionForm" method="post">
				<c:choose>
					<c:when test="${empty param.page}"> <!-- empty 는 비어있으면. -->
						<input type="hidden" name="page" value="1" />
					</c:when>
			
					<c:otherwise>
						<input type="hidden" name="page" value="${param.page}"/>
					</c:otherwise>
				</c:choose>
				
			
				<input type="hidden" name="searchText" value="${param.searchText}"/>
				<input type="hidden" name="testNo" />
				<input type="hidden" name="TradeNo" />
				<input type="hidden" name="sNo" value="${sNo}"/>
			
				
				
			</form>
			<div class="TradeBasketBtn">거래</div>
			<div class="AuctionBasketBtn">경매</div>
			<div class="TradeBasket">
			<div class="TradeProgress">
				<h3>거래 관리</h3>
				<table >
					<thead>
						<tr>
							<th>No</th>
							<th>아이디</th>
							<th>물품정보</th>
							<th>가격</th>
							<th>거래상태</th>	
							<th>작성일</th>
							<th>중매여부</th>
						</tr>
					</thead>
				
					<tbody id="tradeList">
				
					</tbody>
				</table>
				<br/>
				<input type="text" id="searchText" value="${param.searchText}"/>
				<input type="button" value="검색" id="searchBtn"/>
				<input type="button" value="추가" id="tradeBoardAddBtn"/>
				<br/>
				
				<div id="tradePageNo"></div>
			</div>
				
				
				
				
				
					
			<div class="TradeRequest">
			<h3>내가 쓴글 거래요청 관리</h3>
			<table >
				<thead>
					<tr>
						<th>No</th>
						<th>아이디</th>
						<th>물품정보</th>
					
					
						
						<th>거래상태</th>
				
						<th>거래요청일</th>
						<th>중매여부</th>
					</tr>
				</thead>
				
				<tbody id="tradeList1">
				
				
				</tbody>
				</table>
				<br/>
				<input type="text" id="searchText1" value="${param.searchText1}"/>
				<input type="button" value="검색" id="searchBtn1"/>
				<input type="button" value="추가" id="tradeBoardAddBtn1"/>
				<br/>
				
				<div id="tradePageNo1"></div>
			</div>	
			</div>
				
				<div class="AuctionBasket"  style="display:none" >
				<div class="Auction">
				<h3>내가한 경매</h3>
					<table >
						<thead>
							<tr>
								<th>No</th>
								<th>아이디</th>
								<th>물품정보</th>					
								<th>시작경매가</th>
								<th>현재경매가</th>
								<th>경매상태</th>
								<th>종료시간</th>
							</tr>
						</thead>
				
						<tbody id="tradeList2">
				
				
						</tbody>
					</table>
					<br/>
					<input type="text" id="searchText2" value=""/>
					<input type="button" value="검색" id="searchBtn2"/>	
					<br/>
				
					<div id="tradePageNo2"></div>
				
				</div>
				
				<div class="AcutionComple">
				<h3>낙찰된 경매 내역</h3>
					<table >
						<thead>
							<tr>
								<th>No</th>
								<th>아이디</th>
								<th>물품정보</th>
								<th>시작경매가</th>
								<th>현재경매가</th>
								<th>경매상태</th>
								<th>종료시간</th>
							</tr>
						</thead>

						<tbody id="tradeList3">
					
						</tbody>
					</table>
					<br/>
					<input type="text" id="searchText3" value=""/>
					<input type="button" value="검색" id="searchBtn3"/>
					<br/>
				
					<div id="tradePageNo3"></div>
				</div>
				
				<div class="AcutionTrade">
				<h3>거래중인 경매내역</h3>
					<table >
						<thead>
							<tr>
								<th>No</th>
								<th>아이디</th>
								<th>물품정보</th>
								<th>시작경매가</th>
								<th>현재경매가</th>
								<th>경매상태</th>
								<th>종료시간</th>
							</tr>
						</thead>

						<tbody id="tradeList4">
					
						</tbody>
					</table>
					<br/>
					<input type="text" id="searchText4" value=""/>
					<input type="button" value="검색" id="searchBtn4"/>
					<br/>
				
					<div id="tradePageNo4"></div>
				</div>
			
				
				
				
				</div>
				
				
				</div>
		
		</div>
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
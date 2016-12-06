<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/spmain/Mainpage.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>

<style type="text/css">
 .tradeTable{
	vertical-align :top;
	display : inline-block;
	padding : 20px;
	width: 850px;
	height: 90%;
	background-color: #F1232F;
	

}
.tradeCategory{
	display : inline-block;
	width: 200px;
	height: 90%;
	background-color: #123FAC;
}
</style>

<style type="text/css">
.tradePictureIf{

	width : 100%;
	height : 390px;
	background-color: #F123FF;
}
.tradeContent1{
	width : 100%;
	height : 500px;
	background-color: #000131;
}
.tradeReple{
	width : 100%;
	height : 500px;
	background-color: #F1240F;

}
.tradePicture{
	vertical-align :top;
	display : inline-block;
	width : 40%;
	height : 390px;
	background-color: #FFFFFF;
}
.tradePictureMain{
	
	margin-left : 20px;
	width : 300px;
	height : 300px;
	background-color: #444444;
	
}
.tradePictureMain img{
	

	width : 300px;
	height : 300px;
	background-color: #444444;
	
}
.tradePicture1{
	margin-left : 20px;
	margin-top : 10px;
	display : inline-block;
	width : 70px;
	height : 70px;
	background-color: #444444;
	
}
.tradePicture1 img{
	width : 70px;
	height : 70px;
}
.tradePicture2{
	margin-top : 10px;
	display : inline-block;
	width : 70px;
	height : 70px;
	background-color: #444444;
	
}

.tradePicture2 img{
	width : 70px;
	height : 70px;
}

.tradePicture3{
	margin-top : 10px;
	display : inline-block;
	width : 70px;
	height : 70px;
	background-color: #444444;
	
}
.tradePicture3 img{
	width : 70px;
	height : 70px;
}
.tradePicture4{
	margin-top : 10px;
	display : inline-block;
	width : 70px;
	height : 70px;
	background-color: #444444;
	
}
.tradePicture4 img{
	width : 70px;
	height : 70px;
}

.tradeIf{
	display : inline-block;
	width : 56%;
	height : 390px;
	background-color: #F123FF;
}
	
.tradeContentTop{

	display : block;
	width : 90%;
	height : 85%;
	background-color: #FFFFFF;
	margin-left: 40px;
	margin-top: 20px;
}

.tradeContentBottom{

	margin-left: 40px;
	display : block;
	width : 90%;
	height : 50px;
	background-color: #F000FF;
}
.tradeStatusBtn{	
	margin-top : 10px;
	margin-left: 300px;
	display : inline-block;
	width : 80px;
	height : 30px;
	background-color: #FFFFFF;
}

.tradeCencelBtn{
	margin-top : 10px;
	margin-left: 20px;
	display : inline-block;
	width : 80px;
	height : 30px;
	background-color:#FFFFFF;
}
.tradeRequest{
	margin-top: 20px;
	margin-left: 40px;
	display : inline-block;
	width : 80px;
	height : 30px;
	margin-left: 650px;
	background-color: #FFFFFF;
}
.DeliveryShow{
	vertical-align: top;
	margin-top : 10px;
	margin-left: 180px;
	display : inline-block;
	width : 80px;
	height : 30px;
	background-color:#FFFFFF;
}
.DeliveryAtten{
	vertical-align: top;
	margin-top : 10px;
	margin-left: 20px;
	display : inline-block;
	width : 100px;
	height : 30px;
	background-color:#FFFFFF;
}
.tradeStatusBtn1{
	vertical-align: top;
	margin-top : 10px;
	margin-left: 20px;
	display : inline-block;
	width : 80px;
	height : 30px;
	background-color:#FFFFFF;
}
.tradeComplete{
	vertical-align: top;
	margin-top : 10px;
	margin-left: 20px;
	display : inline-block;
	width : 80px;
	height : 30px;
	background-color:#FFFFFF;
}




.reportBtn{
	
	vertical-align:top;
	width : 80px;
	height : 30px;
	background-color:#FFFFFF;
	margin-left: 410px;
		border-radius: 20px;

}





.popup{
    display: inline-block;
    width: 450px;
    height: 250px;
    background-color:#BBBBBB;
    position: absolute;
    z-index: 200;
    top: calc(75% - 50px);
    left: calc(50% - 100px);
    border: 2px solid #000000;
}
.popupMain{
	display : inline-block;
    width: 100%;
    height: 1300px;
    position: absolute;
    z-index: 100;
    background-color:#FFFFFF;
    opacity: 0.4;  
      
}
.starBar{
    margin-left : 50px;	
    margin-top:40px;		
    display : inline-block;
    width:270px;
    height: 50px;
    background-color:#FFFFFF;
}
.star{

    display : inline-block;
    width: 200px;
    height: 46px;
    background-color:#FFFFFF;
 	border: 2px solid #000000;
}
.starListOpen{
	vertical-align :top;
	display : inline-block;
 	width: 56px;
    height: 46px;
    background-color:#FFFFFF;
    border: 2px solid #000000;
}
.starBtn{
	vertical-align:top;
	margin-top:40px;		
    display : inline-block;
 	width: 23%;
    height: 50px;
    background-color:#777777;
}
.starList{
	margin-left : 50px;	
    display : inline-block;
    width: 200px;
    height: 250px;
    background-color:#FFFFFF;
 	border: 2px solid #000000;
}
.star1{

    display : inline-block;
    width: 200px;
    height: 46px;
    background-color:#FFFFFF;

}
.star2{

    display : inline-block;
    width: 200px;
    height: 46px;
    background-color:#FFFFFF;

}
.star3{

    display : inline-block;
    width: 200px;
    height: 46px;
    background-color:#FFFFFF;
 
}
.star4{

    display : inline-block;
    width: 200px;
    height: 46px;
    background-color:#FFFFFF;
 
}
.star5{

    display : inline-block;
    width: 200px;
    height: 46px;
    background-color:#FFFFFF;

}

.starList img{
	width: 200px;
    height: 46px;
}
.star img{
	width: 200px;
    height: 46px;
}
</style>
	
<script type="text/javascript">

$(document).ready(function(){	
	$(".tradePicture1").on("click",function(){
		var img = $(".tradePictureMain").children("img").prop("src");
		var img1 = $(".tradePicture1").children("img").prop("src");
		  
		   
		 
		   $(".tradePicture1").html("<img src='"+img+"' />");
		   $(".tradePictureMain").html("<img src='"+img1+"'/>");
		
		
	});
	
	$(".tradePicture2").on("click",function(){
		var img = $(".tradePictureMain").children("img").prop("src");
		var img1 = $(".tradePicture2").children("img").prop("src");
		  
		   
		 
		   $(".tradePicture2").html("<img src='"+img+"' />");
		   $(".tradePictureMain").html("<img src='"+img1+"'/>");
		
		
	});
	
	$(".tradePicture3").on("click",function(){
		var img = $(".tradePictureMain").children("img").prop("src");
		var img1 = $(".tradePicture3").children("img").prop("src");
		  
		   
		 
		   $(".tradePicture3").html("<img src='"+img+"' />");
		   $(".tradePictureMain").html("<img src='"+img1+"'/>");
		
		
	});
	
	$(".tradePicture4").on("click",function(){
		var img = $(".tradePictureMain").children("img").prop("src");
		var img1 = $(".tradePicture4").children("img").prop("src");
		  
		   
		 
		   $(".tradePicture4").html("<img src='"+img+"' />");
		   $(".tradePictureMain").html("<img src='"+img1+"'/>");
		
		
	});
	$(".tradeStatusBtn").on("click",function(){
		
		$("#actionForm").attr("action", "TradeStatus");
		$("#actionForm").submit();
	});
	$(".tradeStatusBtn1").on("click",function(){
		
		$("#actionForm").attr("action", "TradeStatus1");
		$("#actionForm").submit();
	});
	
	$(".tradeRequest").on("click",function(){
		$("#actionForm").attr("action", "TradeEscrow");
		$("#actionForm").submit();
		
	});
	
	$(".DeliveryAtten").on("click",function(){
		$("#actionForm").attr("action", "DeliIntroPage");
		$("#actionForm").submit();
		
	});
	
	$(".DeliveryShow").on("click",function(){
		$("#actionForm").attr("action", "DeliShowPage");
		$("#actionForm").submit();
		
	});
	
	$(".tradeComplete").on("click",function(){
		if(confirm("거래를 완료하시겠습니까???????")){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type:"post",
				url:"CompleteUpdate",
				dataType:"json",
				data : params,
				success : function(result){
					$(".popupMain").css("display","block");
					$(".popup").css("display","block");
					$("input[name='SellNo']").val(result.SellNo);	
						
				
				},
				error : function(result){
					alert("ERROR");
					
				}
			});
		}
	});
	
	
	$(".tradeCencelBtn").on("click",function(){
		if(confirm("거래를 취소하겠습니다???????")){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type:"post",
				url:"TradeCencelDel",
				dataType:"json",
				data : params,
				success : function(result){
					alert("취소되었습니다");	
					location.href="TradeBoard";
				
				},
				error : function(result){
					alert("ERROR");
				}
			});
		}
	});
	
	
	$("#star1").on("click",function(){
		
		var img1 = $(".star1").children("img").prop("src");
		$(".star").html("<img alt='1' src='"+img1+"' />");
		$(".starList").css("display","none");
		
	});
	$("#star2").on("click",function(){
		var img1 = $(".star2").children("img").prop("src");
		$(".star").html("<img alt='2' src='"+img1+"'/>");
		$(".starList").css("display","none");
		
	});
	$("#star3").on("click",function(){
		var img1 = $(".star3").children("img").prop("src");
		$(".star").html("<img alt='3' src='"+img1+"' />");
		$(".starList").css("display","none");
		
	});
	$("#star4").on("click",function(){
		var img1 = $(".star4").children("img").prop("src");
		$(".star").html("<img alt='4' src='"+img1+"'/>");
		$(".starList").css("display","none");
		
	});
	$("#star5").on("click",function(){
		var img1 = $(".star5").children("img").prop("src");
		$(".star").html("<img alt='5' src='"+img1+"' />");
		$(".starList").css("display","none");
	});
	
	$(".starListOpen").on("click",function(){
		$(".starList").css("display","block");
	});
	
	$(".starBtn").on("click",function(){
		
	if(	$(".star").html()!=""){
		$("input[name='Star']").val($(".star").children("img").prop("alt"));
		
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type:"post",
			url:"updateStar",
			dataType:"json",
			data : params,
			success : function(result){
		
			if(result.con6.SATIS*20+result.con6.T_COUNT*100>=200  && result.con6.SATIS*20+result.con6.T_COUNT*100<400){
				$("input[name='Rank']").val("2");
				
				
				var params = $("#actionForm").serialize();
				$.ajax({
					type:"post",
					url:"updateRank1",
					dataType:"json",
					data : params,
					success : function(result){
						$(".popupMain").css("display","block");
						$(".popup").css("display","block");
						$("#actionForm").attr("action","TradeRequest");
						$("#actionForm").submit();
					},
					error : function(result){
						alert("ERROR");
					}
				});
					
			}
			else if(result.con6.SATIS*20+result.con6.T_COUNT*100>=400 && result.con6.SATIS*20+result.con6.T_COUNT*100<600){
				$("input[name='Rank']").val("3")
				
				var params = $("#actionForm").serialize();
				$.ajax({
					type:"post",
					url:"updateRank1",
					dataType:"json",
					data : params,
					success : function(result){
						$(".popupMain").css("display","block");
						$(".popup").css("display","block");
						$("#actionForm").attr("action","TradeRequest");
						$("#actionForm").submit();
						
					},
					error : function(result){
						alert("ERROR");
					}
				});
				
				
			}
			else if(result.con6.SATIS*20+result.con6.T_COUNT*100>=600){
				$("input[name='Rank']").val("4")
				
				var params = $("#actionForm").serialize();
				$.ajax({
					type:"post",
					url:"updateRank1",
					dataType:"json",
					data : params,
					success : function(result){
				
						$(".popupMain").css("display","block");
						$(".popup").css("display","block");
						$("#actionForm").attr("action","TradeRequest");
						$("#actionForm").submit();
					},
					error : function(result){
						alert("ERROR");
					}
				});
				
			}
			else {
				$(".popupMain").css("display","block");
				$(".popup").css("display","block");
				$("#actionForm").attr("action","TradeRequest");
				$("#actionForm").submit();
				
			}
				
			
			},
			error : function(result){
				alert("ERROR");
			}
		});
		
	}
	else{
		alert("별점을 선택하여 주십쇼");
	}
		
	});
});

</script>
</head>
<body>
<div class="popupMain" style="display: none;"></div>
<div class="main">
	<div class="left"></div>
	<div class="main1">
		
		<div class="login">
			<div class="loginNull">
			</div>
			
			
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
						id:<input type="text" name="Id" id="Id" maxlength="15">
					</div>
				</div>
			
				<div class="login2">
					<div class="pw">
						pw:<input type="password" name="Pw" id="Pw"  maxlength="15">
					</div>	
				</div>
			</form>	
				<div class="login3">
					<div class="loginBtn">
					로그인
					</div>
				</div>
				
				<div class="login4">
					<div class="memberLogiBtn">
					회원가입
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
						<span id="memNick">${sNick}</span>님 환영합니다
					</div>
				</div>
				
				<div class="login2_1">
					<div class="logout">
						logout
					</div>		
				</div>
				
				<div class="login3_1">
					<div class="mypage">
						mypage
					</div>
				</div>
				
				<div class="login4_1">
					<div class="basket">
						basket
					</div>
				</div>
				
			
			</div>
			  
		</div>
		
	
		
		
		<div class="menubar">
			<div class="logo">
				logo
			</div>
			
			<div class="menuall">
				<div class="auctionBoard" id="auctionBoard">
					auction
				</div>
				<div class="auctionBoard_1" id="auctionBoard_1" style="display:none;">
					auction1
					<div class="home">가정제품</div>
					<div class="elec">전자기기</div>
					<div class="cloth">의류,신발</div>
					<div class="watch">시계</div>
					<div class="cosmetic">화장품</div>
					<div class="travel">여행용품</div>
					<div class="furni">가구</div>
					<div class="book">도서</div>
					<div class="etc">기타</div>
				</div>
				<div class="tradeBoard" id="tradeBoard">
					trade
				</div>
				<div class="tradeBoard_1" id="tradeBoard_1" style="display:none;">
					trade1
					<div class="home_1">가정제품</div>
					<div class="elec_1">전자기기</div>
					<div class="cloth_1">의류,신발</div>
					<div class="watch_1">시계</div>
					<div class="cosmetic_1">화장품</div>
					<div class="travel_1">여행용품</div>
					<div class="furni_1">가구</div>
					<div class="book_1">도서</div>
					<div class="etc_1">기타</div>
				</div>
				<div class="reportBoard">
					report
				</div>
				
				<div class="customerBoard">
					customer
				</div>
				
				<div class="freeBoard">
					free
				</div>
			</div>
		</div>
		
		<div class="content">
		
		<div class="tradeCategory">
			<div class="home">가정제품</div>
			<div class="elec">전자기기</div>
			<div class="cloth">의류,신발</div>
			<div class="watch">시계</div>
			<div class="cosmetic">화장품</div>
			<div class="travel">여행용품</div>
			<div class="furni">가구</div>
			<div class="book">도서</div>
			<div class="etc">기타</div>
		</div>
		
		<div class="tradeTable">
			<div class="tradePictureIf">
				<div class="tradePicture">
					<div class="tradePictureMain">	<img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME}"/></div>
					<div class="tradePicture1"> <img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME1}"/></div>
					<div class="tradePicture2"> <img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME2}"/></div>
					<div class="tradePicture3"> <img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME3}"/></div>
					<div class="tradePicture4"> <img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME4}"/></div>
				</div>	
			
				<div class="tradeIf">
				<div class="reportBtn"> 신고하기 </div>
				<br/>
				<br/>
				<form action="#" id="actionForm" method="post">
					<input type="hidden" name="page" value="${param.page}"/>
					<input type="hidden" name="searchText" value="${param.searchText }"/>
					<input type="hidden" name="testNo" value="${param.testNo}"/>
					<input type="hidden" name="TradeNo" value="${param.TradeNo}">
					<input type="hidden" name="Buy" value="${con.BUY_PAY}">
					<input type="hidden" name="Star" value="">
					<input type="hidden" name="SellNo" value="">
					<input type="hidden" name="Rank" value="">
					
				</form>
				
					<table border="1" width="490px">
						<tr>
							<th width="20%">제목</th>
							<th width="80%">${con.WORD_TITLE}</th>
						</tr>
						
						<tr>
							<td>물품명</td>
							<td>${con.TRADE_BOARD}
							${con.TRADE_STATUS_NO}
							${con.TRADE_STATUS_NO1}</td>
						</tr>
						
						<tr>
							<td>닉네임</td>
							<td>${con.NICK}</td>
						</tr>
						
						<tr>
							<td>가격</td>
							<td>${con.BUY_PAY}</td>
						</tr>
						
						<tr>
							<td>날짜</td>
							<td>${con.WRITER_DATE}</td>
				
						</tr>
					</table>
				</div>
				
			</div>
			<div class="tradeContent1">
				<div class="tradeContentTop">
				
						${con.WORD_CONTENTS}
				</div>
				<c:choose>
					<c:when test="${con.TRADE_STATUS_NO eq 4 }">
						<div class="tradeContentBottom" style="display: none;">
					</c:when>
					<c:otherwise>
						<div class="tradeContentBottom">
					</c:otherwise>
				</c:choose>
					<c:choose>
						<c:when test="${con.TRADE_STATUS_NO eq 2 && con.TRADE_STATUS_NO1 eq 2 || con.TRADE_STATUS_NO eq 3}">
							<div class="tradeStatus1" id="tradeStatus1" style="display: none;">
						</c:when>
			
				
						<c:otherwise>
							<div class="tradeStatus1" id="tradeStatus1" >
						</c:otherwise>
					</c:choose>
								<div class="tradeStatusBtn">거래 현황</div>
								<div class="tradeCencelBtn">거래 취소</div>
							
							</div>
					
					
					<c:choose>
						<c:when test="${con.TRADE_STATUS_NO eq 2 && con.TRADE_STATUS_NO1 eq 2 || con.TRADE_STATUS_NO eq 3}">
							<div class="tradeStatus2" id="tradeStatus2" >
						</c:when>
					
						<c:otherwise>
							<div class="tradeStatus2" id="tradeStatus2" style="display: none;">
						</c:otherwise>
					</c:choose>
								<div class="DeliveryShow">배송 조회</div>
								<div class="DeliveryAtten">배송유의사항</div>
								<div class="tradeStatusBtn1">거래 현황</div>
								<div class="tradeComplete">거래 완료</div>
							</div>
							
					
				</div>
				
			
				
			</div>
		
		</div>	
					
		</div>
	
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>

<div class="popup" style="display: none;">

		<div class="starBar">
			<div class="star"></div>
			<div class="starListOpen"></div>
		</div>
		<div class="starBtn"> 	</div>
	
		<div class="starList" style="display:none">
			<div class="star1" id="star1"><img src="resources/images/TradeStatus1/star1.png"/></div>
			<div class="star2" id="star2"><img src="resources/images/TradeStatus1/star2.png"/></div>
			<div class="star3" id="star3"><img src="resources/images/TradeStatus1/star3.png"/></div>
			<div class="star4" id="star4"><img src="resources/images/TradeStatus1/star4.png"/></div>
			<div class="star5" id="star5"><img src="resources/images/TradeStatus1/star5.png"/></div>
			
		</div>
	
	



</div>

</body>
</html>
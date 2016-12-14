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
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>

<style type="text/css">
 .tradeTable{
	vertical-align :top;
	display : inline-block;
	padding : 20px;
	width: 850px;
	height: 90%;
	background-color: #FFFFFF;
	

}
.tradeCategory{
	display : inline-block;
	width: 220px;
	height: 90%;
	background-color: #B2FFD1;
}
</style>

<style type="text/css">
.tradePictureIf{
	width : 100%;
	height : 390px;
	background-color: #B2FFD1;
}
.tradeContent1{
	width : 100%;
	height : 500px;
	background-color: #FFFFFF;
}
.tradeReple{
	width : 100%;
	height : 500px;
	background-color: #FFFFFF;

}
.tradePicture{
	vertical-align :top;
	display : inline-block;
	width : 40%;
	height : 390px;
	background-color: #B2FFD1;
}
.tradePictureMain{
	
	margin-left : 20px;
	width : 300px;
	height : 300px;
	background-color: #B2FFD1;
	
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
	background-color: #B2FFD1;
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
	background-color: #FFFFFF;
}
.tradeStatusBtn{	
	margin-top : 10px;
	margin-left: 300px;
	display : inline-block;
	width : 80px;
	height : 30px;
	background-color: #B2FFD1;
}

.tradeCencelBtn{
	margin-top : 10px;
	margin-left: 20px;
	display : inline-block;
	width : 80px;
	height : 30px;
	background-color:#B2FFD1;
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

.DeliveryAtten1{
	vertical-align: top;
	margin-top : 10px;
	margin-left: 230px;
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
	


<style type="text/css">
.popupReport{
    display: inline-block;
    width: 600px;
    height: 750px;
    background-color:#BBBBBB;
    position: absolute;
    z-index: 200;
    top: calc(45% - 50px);
    left: calc(40% - 100px);
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
.reportHead{
	  width: 100%;
    height: 50px;
    background-color:#F12C23;

}

.reportContent{
	
	width: 100%;
    height: 460px;
    background-color:#012C03;
	

}

.reportContent textarea{
	margin-left: 26px;
}

.reportSome{
	width: 100%;
    height: 180px;
    background-color:#012123;
}

.reportBtn1{
	display : inline-block;
	margin-left : 30px;
	width: 70px;
    height: 40px;
    background-color:#012FF3;

}

.reportCencelBtn{
	vertical-align :top ;
	display : inline-block;
	margin-left : 400px;
	width: 70px;
    height: 40px;
    background-color:#012FF3;

}

	
</style>

<script type="text/javascript">
$(document).ready(function(){


	$(".reportBtn").on("click", function(){
		if($("input[name='reportUser']").val()>0){
		$(".popupMain").css("display","block");
		$(".popupReport").css("display","block");
	}else{
		alert("로그인이 필요합니다");
	}
	});
	
	$(".reportCencelBtn").on("click", function(){
		$(".popupMain").css("display","none");
		$(".popupReport").css("display","none");
	});
	
	$(".reportBtn1").on("click", function(){
		var reportForm = $("#reportForm");
		alert("qwd");
		reportForm.ajaxForm(uploadResultCallBack); // insertForm을 ajaxForm형태로 바꾸겠다. uploadResultCallBack은 ajax를 호출하고나서 이 함수를 호출하겠다.
		reportForm.submit();		

	});
});

function uploadResultCallBack(data, result){ //data:json(아까param가지고 조랄한거.) result : success와 faile ajax결과
	if(result =="success"){
		var resData = eval("(" + removePre(data) + ")");  // eval는 자바스크립트의 bean으로 바꿔주는것.
		
		$("#textFile").val(resData.fileName[0]); // 이거아까20자리 맥인거 그거가져오는듯
		$("#textFile1").val(resData.fileName[1]);
		$("#textFile2").val(resData.fileName[2]);
		$("#textFile3").val(resData.fileName[3]);
		$("#textFile4").val(resData.fileName[4]);
		var params = $("#reportForm").serialize();
		
		$.ajax({
			type : "post",
			url : "insertTradeReport", // TestController에서 마들기
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res == "true"){
					$("#actionForm").attr("action", "TradeRequest");
					$("#actionForm").submit();
				} else{
					alert("저장 중 문제가 발생했습니다.");
				}
			},
			error : function(result){
				alert("ERROR!!");
			}
		});
	} else{
		alert("저장실패");
	}
	
}


function removePre(data){
	if(data.indexOf("<pre>") > -1){ // data의 indexOf(위치찾기) -1은없는경우고  -1보다 크다는건 있다는얘기
		var st = data.indexOf(">");  //  범위 지정하구있음  pre빼고 짜르겠다는 얘기.
		var ed = data.indexOf("<", st); // 
		
		return data.substring(st + 1, ed); // 값을 되돌려줌 짜른 값 pre를 되도렬줌 <>짜르고.
	} else {
		return data;
	}
}
</script>
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
	
	$(".DeliveryAtten1").on("click",function(){
		$("#actionForm").attr("action", "DeliIntroPage");
		$("#actionForm").submit();
		
	});
	
	$(".DeliveryShow").on("click",function(){
		$("#actionForm").attr("action", "DeliShowPage");
		$("#actionForm").submit();
		
	});
	
	$(".tradeComplete").on("click",function(){
		if(${con.TRADE_STATUS_NO} != 4){
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
		}
		else{
			alert("이미 완료하였습니다");
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
		<div class="content">
		
		<div class="tradeCategory">
			<div class="AuctionBoardCategory"><img alt="TabImg" src="resources/images/AuctionPageImage/TradeTab.bmp"></div>
			<div class="home_1"><img alt="HomeImg" src="resources/images/AuctionPageImage/AuctionHome.bmp"></div>
			<div class="elec_1"><img alt="elecImg" src="resources/images/AuctionPageImage/AuctionElec.bmp"></div>
			<div class="cloth_1"><img alt="clothImg" src="resources/images/AuctionPageImage/AuctionCloth.bmp"></div>
			<div class="watch_1"><img alt="watchImg" src="resources/images/AuctionPageImage/AuctionWatch.bmp"></div>
			<div class="cosmetic_1"><img alt="cosmeticImg" src="resources/images/AuctionPageImage/AuctionCosmetic.bmp"></div>
			<div class="travel_1"><img alt="travelImg" src="resources/images/AuctionPageImage/AuctionTravel.bmp"></div>
			<div class="furni_1"><img alt="furniImg" src="resources/images/AuctionPageImage/AuctionFurni.bmp"></div>
			<div class="book_1"><img alt="bookImg" src="resources/images/AuctionPageImage/AuctionBook.bmp"></div>
			<div class="etc_1"><img alt="etcImg" src="resources/images/AuctionPageImage/AuctionEtc.bmp"></div>
		</div>
		
		<div class="tradeTable">
			<div class="tradePictureIf">
				<div class="tradePicture">
						<div class="tradePictureMain">
						<c:choose>
							<c:when test="${con.PICTURENAME eq null}">
								<img alt="${con.TEST_FILE}" src="resources/images/TradeStatus1/no_image.png"/>
							</c:when>
							<c:otherwise>
								<img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME}"/>
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="tradePicture1">
						 <c:choose>
							<c:when test="${con.PICTURENAME1 eq null}">
								<img alt="${con.TEST_FILE}" src="resources/images/TradeStatus1/no_image.png"/>
							</c:when>
							<c:otherwise>
								<img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME1}"/>
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="tradePicture2"> 
						<c:choose>
							<c:when test="${con.PICTURENAME2 eq null}">
								<img alt="${con.TEST_FILE}" src="resources/images/TradeStatus1/no_image.png"/>
							</c:when>
							<c:otherwise>
								<img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME2}"/>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="tradePicture3"> 
						<c:choose>
							<c:when test="${con.PICTURENAME3 eq null}">
								<img alt="${con.TEST_FILE}" src="resources/images/TradeStatus1/no_image.png"/>
							</c:when>
							<c:otherwise>
								<img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME3}"/>
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="tradePicture4"> 
						<c:choose>
							<c:when test="${con.PICTURENAME4 eq null}">
								<img alt="${con.TEST_FILE}" src="resources/images/TradeStatus1/no_image.png"/>
							</c:when>
							<c:otherwise>
								<img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME4}"/>
							</c:otherwise>
						</c:choose>
					</div>
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
					<input type="hidden" name="TradeStatus" value="${param.TradeNo}_거래완료입금">
					
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
						<tr>
							<td>중매여부</td>
							<td>
							<c:choose>
							<c:when test="${con.ESCROW_WHETHER eq 1}">
							중매
							</c:when>
							<c:otherwise>
							중매를 하지 않았습니다
							</c:otherwise>
							</c:choose>
							</td>
						</tr>	
					</table>
				</div>
				
			</div>
			<div class="tradeContent1">
				<div class="tradeContentTop">
				
				<pre>	${con.WORD_CONTENTS}</pre>	
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
					
						<c:when test="${con.MEMBERNO ne sNo && con.ESCROW_WHETHER eq 1&&con.TRADE_STATUS_NO eq 2 && con.TRADE_STATUS_NO1 eq 2 || con.TRADE_STATUS_NO eq 3 }">
							<div class="tradeStatus2" id="tradeStatus2" >
								<div class="DeliveryShow">배송 조회</div>
								<div class="DeliveryAtten">배송유의사항</div>
								<div class="tradeStatusBtn1">거래 현황</div>
								<div class="tradeComplete">거래 완료</div>					
							</div>
						</c:when>
						
						<c:when test="${con.MEMBERNO ne sNo && con.TRADE_STATUS_NO eq 2 && con.TRADE_STATUS_NO1 eq 2 || con.TRADE_STATUS_NO eq 3}">
							<div class="tradeStatus2" id="tradeStatus2" >
								
								<div class="DeliveryAtten1">배송유의사항</div>
								<div class="tradeStatusBtn1">거래 현황</div>
								<div class="tradeComplete">거래 완료</div>
							</div>
						</c:when>
							
						<c:when test="${con.ESCROW_WHETHER eq 1&&con.TRADE_STATUS_NO eq 2 && con.TRADE_STATUS_NO1 eq 2 || con.TRADE_STATUS_NO eq 3}">
							<div class="tradeStatus2" id="tradeStatus2" >
								<div class="DeliveryShow">배송 조회</div>
								<div class="DeliveryAtten">배송유의사항</div>
								<div class="tradeStatusBtn1">거래 현황</div>
							
							</div>
						</c:when>
						
						<c:when test="${con.TRADE_STATUS_NO eq 2 && con.TRADE_STATUS_NO1 eq 2 || con.TRADE_STATUS_NO eq 3}">
							<div class="tradeStatus2" id="tradeStatus2" >
								
								<div class="DeliveryAtten1">배송유의사항</div>
								<div class="tradeStatusBtn1">거래 현황</div>
								
							</div>
						</c:when>
						
						
					
						<c:otherwise>
							<div class="tradeStatus2" id="tradeStatus2" style="display: none;"></div>
						</c:otherwise>
					</c:choose>
								
							
					
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


<div class="popupReport" style="display:none">
	<form action="fileUploadAjax" method="post" id="reportForm"  name="reportForm" enctype="multipart/form-data">
	<div class="reportHead">
			신고사례 
				<select name="reportCato">
						<option value="1">물품상태 불량</option>
						<option value="2">구성품 누락</option>
						<option value="3">욕설 및 비매너</option>
				</select>
				<input type="text" name="reportTitle"/>
	</div>
	
	<div class="reportContent">
	<textarea rows="30" cols="75"  style="resize: none;" name="reportContent"></textarea>
	</div>
	<div class="reportSome">
		
		<input type="hidden" name="reportUser" value="${sNo}"/>
		<input type="hidden" name="fraudUser" value="${con.MEMBERNO}"/>
		<input type="hidden" name="testNo" value="${param.testNo}"/>
		<input type="hidden" name="reportTitle1" value="${con.WORD_TITLE}"/>
		<input type="hidden" name="reportContent1" value="${con.WORD_CONTENTS}"/>
		<input type="hidden" name="repleNo1" value=""/>
					<input type="file" name="att1"> 
					<input type="hidden" name="textFile" id="textFile"/>
					<input type="file" name="att2"> 
					<input type="hidden" name="textFile1" id="textFile1"/>
					<input type="file" name="att3"> 
					<input type="hidden" name="textFile2" id="textFile2"/>
					<input type="file" name="att4"> 
					<input type="hidden" name="textFile3" id="textFile3"/>
					<input type="file" name="att5"> 
					<input type="hidden" name="textFile4" id="textFile4"/>
	</div>
	<div class="reportCencelBtn"></div>
	<div  class="reportBtn1">
					
					
	
	</div>
	</form>

</div>
</body>
</html>
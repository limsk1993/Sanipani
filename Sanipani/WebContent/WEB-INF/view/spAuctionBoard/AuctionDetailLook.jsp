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
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>
<style type="text/css">
.AuctionDetailLook {
	vertical-align :top;
	display : inline-block;
	padding : 20px;
	width: 690px;
	height: 90%;
	background-color: #F1232F;
}

.AuctionCategory {
	display : inline-block;
	width: 200px;
	height: 90%;
	background-color: #123FAC;
}

.AuctionPictureIf {
   width : 100%;
   height : 390px;
   background-color: #F123FF;
}
.AuctionContent{
   width : 100%;
   height : 500px;
   background-color: #000131;
}
.AuctionReply{
   width : 100%;
   height : 150px;
   background-color: #F1240F;

}
.AuctionPicture{
   vertical-align :top;
   display : inline-block;
   width : 49%;
   height : 390px;
   background-color: #FFFFFF;
}
.AuctionPictureMain{
   
   margin-left : 20px;
   width : 300px;
   height : 300px;
   background-color: #444444;
   
}
.AuctionPictureMain img{
   width : 300px;
   height : 300px;
   background-color: #444444;
}
.AuctionPicture1 {
   margin-left : 20px;
   margin-top : 10px;
   display : inline-block;
   width : 70px;
   height : 70px;
   background-color: #444444;
}
.AuctionPicture1 img{
   width : 70px;
   height : 70px;
}
.AuctionPicture2{
   margin-top : 10px;
   display : inline-block;
   width : 70px;
   height : 70px;
   background-color: #444444;
   
}

.AuctionPicture2 img{
   width : 70px;
   height : 70px;
}

.AuctionPicture3{
   margin-top : 10px;
   display : inline-block;
   width : 70px;
   height : 70px;
   background-color: #444444;
   
}
.AuctionPicture3 img{
   width : 70px;
   height : 70px;
}
.AuctionPicture4{
   margin-top : 10px;
   display : inline-block;
   width : 70px;
   height : 70px;
   background-color: #444444;
   
}
.AuctionPicture4 img{
   width : 70px;
   height : 70px;
}

.AuctionIf{
   display : inline-block;
   width : 50%;
   height : 390px;
   background-color: #F123FF;
}
   
.AuctionContentTop {
   display : block;
   width : 100%;
   height : 85%;
   background-color: #FFFFFF;
   margin-top: 10px;
}

.AuctionContentBottom1 {
   margin-top: 10px;
   display : block;
   width : 100%;
   height : 40px;
   background-color: #F000FF;
}

.AuctionContentBottom2 {
   margin-top: 10px;
   display : block;
   width : 100%;
   height : 50px;
   background-color: #F000FF;
}

.AuctionPriceRegisterBtn {
	width : 90px;
   	height : 30px;
   	background-color: #FFFFFF;
}

.AuctionPriceCancelBtn {
	width : 90px;
   	height : 30px;
   	background-color: #FFFFFF;
}

.AuctionPriceTextBox {
	width : 200px;
   	height : 30px;
   	background-color: #FFFFFF;
}

.AuctionUpdateBtn {   
   width : 80px;
   height : 30px;
   background-color: #FFFFFF;
   position: absolute;
   margin-top : 10px;
   margin-left: 440px;
}

.AuctionDeleteBtn {
   width : 80px;
   height : 30px;
   background-color:#FFFFFF;
   position: absolute;
   margin-top : 10px;
   margin-left: 540px;
}

.AuctionListBtn {
   width : 80px;
   height : 30px;
   background-color:#FFFFFF;
   position: absolute;
   margin-top : 10px;
   margin-left: 340px;
}

.AuctionRequestBtn {
   width : 80px;
   height : 30px;
   background-color:#FFFFFF;
   position: absolute;
   margin-top : 10px;
   margin-left: 240px;
}

.AuctionRequest{
   margin-top: 20px;
   margin-left: 40px;
   display : inline-block;
   width : 80px;
   height : 30px;
   margin-left: 650px;
   background-color: #FFFFFF;
}
</style>
<script type="text/javascript">

var D = 0;
var H = 0;
var M = 0;
var S = 0;

$(document).ready(function() {
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "updateAuctionLookup",
		dataType : "json",
		data : params,
		success : function(result) {
			
		},
		error : function(result) {
			alert("ERROR");
		}
	});
	
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "AuctionBoard");
		$("#actionForm").submit();
	});
	
	$("#updateBtn").on("click", function() {
		$("#actionForm").attr("action", "AuctionModify");
		$("#actionForm").submit();
	});
	
	$("#deleteBtn").on("click", function() {
		if(confirm("지우시겠습니까?")) {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "deleteAuction",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res > 0) {
						location.href = "AuctionBoard";
					} else {
						alert("삭제가 안되었습니다.");
					}
				},
				error : function(result) {
					alert("ERROR");
				}
			});
		}
	});
	
	$(".AuctionPicture1").on("click",function(){
		var img = $(".AuctionPictureMain").children("img").prop("src");
		var img1 = $(".AuctionPicture1").children("img").prop("src");
	        
	 	$(".AuctionPicture1").html("<img src='"+img+"' />");
	  	$(".AuctionPictureMain").html("<img src='"+img1+"'/>");
	});
	   
	$(".AuctionPicture2").on("click",function(){
		var img = $(".AuctionPictureMain").children("img").prop("src");
		var img1 = $(".AuctionPicture2").children("img").prop("src");
		
		$(".AuctionPicture2").html("<img src='"+img+"' />");
	  	$(".AuctionPictureMain").html("<img src='"+img1+"'/>");   
	});
	   
	$(".AuctionPicture3").on("click",function(){
	  	var img = $(".AuctionPictureMain").children("img").prop("src");
	  	var img1 = $(".AuctionPicture3").children("img").prop("src");
	      
	 	$(".AuctionPicture3").html("<img src='"+img+"' />");
		$(".AuctionPictureMain").html("<img src='"+img1+"'/>");
	});
	   
	$(".AuctionPicture4").on("click",function(){
		var img = $(".AuctionPictureMain").children("img").prop("src");
		var img1 = $(".AuctionPicture4").children("img").prop("src");
	        
		$(".AuctionPicture4").html("<img src='"+img+"' />");
	 	$(".AuctionPictureMain").html("<img src='"+img1+"'/>");   
	});
	
	$(".AuctionRequestBtn").on("click",function(){
		
		var actionForm = $("#actionForm")
		
		if($("input[name='AuctionBoardStatus']").val() == 0){
			alert("아직 경매가 마감되지 않았습니다.");
			return false;
		}

		if($("input[name='AuctionBoardStatus']").val() == 1 && $("input[name='auctionMemNo']").val() == $("input[name='auctionMemberNo']").val()) {
			$("#actionForm").attr("action", "AuctionRequest");
			$("#actionForm").submit();
		} else if ($("input[name='AuctionBoardStatus']").val() == 1) {
			alert("경매가 마감이 되어 경매요청을 할 수 없습니다.");
			return false;
		}
	});
	
	$(".AuctionPriceRegisterBtn").on("click",function(){
		var updateForm = $("#updateForm")
		
 		if($("input[name='AuctionBoardStatus']").val() == 1) {
			alert("경매가 마감이 되어 경매가를 등록할 수 없습니다.");
			return false;
		}
		
		if($("input[name='StartBuyPay']").val() * 1 > $("input[name='AuctionPrice']").val() * 1) {
			alert("시작경매가보다 가격이 적습니다.");
			return false;
		}
		
		if($("input[name='RightNowBuyPay']").val() * 1 < $("input[name='AuctionPrice']").val() * 1) {
			alert("즉시 구매가보다 클 수 없습니다.");
			return false;
		}
		
		if($("input[name='RightNowBuyPay']").val() * 1 == $("input[name='AuctionPrice']").val() * 1) {
			var params = $("#updateForm").serialize();
			
			$.ajax({
				type : "post",
				url : "updateAuctionEnd",
				dataType : "json",
				data : params,
				success : function(result) {
					if (result.res > 0) {
						if($("input[name='AuctionBoardStatus']").val() == 1 || $("input[name='AuctionStatus']").val() == 1) {
							D = 0;
							H = 0;
							M = 0;
							S = 0;
							
							$(".countTimeDay").html(D);
							$(".countTimeHour").html(H);
							$(".countTimeMinute").html(M);
							$(".countTimeSecond").html(S);
							
							clearInterval(timer);
							
							alert("경매가 종료되었습니다.");
						}
					} else {
						alert("경매가 종료되지 않았습니다.");
					}
				},
				error : function(result) {
					alert("ERROR");
				}
			});
			
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "deleteNotAuctionMember",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res > 0) {
						alert("경매 미참여자는 삭제되었습니다.");
					} else {
						alert("경매 미참여자가 삭제되지 않았습니다.");
					}
				},
				error : function(result) {
					alert("ERROR");
				}
			});
		}

		if(M < 5 && H == 0 && D == 0) {
			updateForm.ajaxForm(UpdateTime);
			updateForm.submit();
		}
		
		updateForm.ajaxForm(uploadResultCallBack);
		updateForm.submit();
	});
	
	$(".AuctionPriceCancelBtn").on("click",function(){
		var updateForm = $("#updateForm")
		
		updateForm.ajaxForm(CancelResultCallBack);
		updateForm.submit();
	});
	
	D = $("input[name='AuctionDay']").val();
	H = $("input[name='AuctionHour']").val();
	M = $("input[name='AuctionMinute']").val();
	S = $("input[name='AuctionSecond']").val();

	if($("input[name='AuctionBoardStatus']").val() == 1 || $("input[name='AuctionStatus']").val() == 1) {
		D = 0;
		H = 0;
		M = 0;
		S = 0;
		
		$(".countTimeDay").html(D);
		$(".countTimeHour").html(H);
		$(".countTimeMinute").html(M);
		$(".countTimeSecond").html(S);
		
		clearInterval(timer);
	} else {
		var timer = setInterval(function () {
			// 설정
			$(".countTimeDay").html(D);
			$(".countTimeHour").html(H);
			$(".countTimeMinute").html(M);
			$(".countTimeSecond").html(S);
			
			if(S == 0 && M == 0 && H == 0 && D == 0){
				clearInterval(timer); /* 타이머 종료 */
				
				var params = $("#updateForm").serialize();
				
				$.ajax({
					type : "post",
					url : "updateAuctionEnd",
					dataType : "json",
					data : params,
					success : function(result) {
						if (result.res > 0) {
							alert('해당 경매가 종료되었습니다.');
						} else {
							alert("경매가 종료되지 않았습니다.");
						}
					},
					error : function(result) {
						alert("ERROR");
					}
				});
				
				var params = $("#actionForm").serialize();
						
				$.ajax({
					type : "post",
					url : "deleteNotAuctionMember",
					dataType : "json",
					data : params,
					success : function(result) {
						if(result.res > 0) {
							alert("경매 미참여자는 삭제되었습니다.");
						} else {
							alert("경매 미참여자가 삭제되지 않았습니다.");
						}
					},
					error : function(result) {
						alert("ERROR");
					}
				});
				
			} else {
				S--;
				// 분처리
				if(S < 0) {
					M--;
					S = 59;
				}
				//시간처리
				if(M < 0) {
					if(H > 0) {
						H--;
						M = 59;
					}
				}
				//일자처리
				if(H < 0) {
					if(D > 0) {
						D--;
						H = 24;
					}
				}
			}
		}, 1000);
	}
});

function getAuctionInfo(data, result) {
	var params = $("#actionForm").serialize();
		
	$.ajax({
		type : "post",
		url : "getAuctionInfo",
		dataType : "json",
		data : params,
		success : function(result) {
			alert("OK");
		},
		error : function(result) {
			alert("ERROR");
		}
	});
}

function CancelResultCallBack(data, result) {
	if(confirm("취소하시겠습니까?")) {
		var params = $("#updateForm").serialize();
		
		$.ajax({
			type : "post",
			url : "updateAuctionPriceCancel",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res > 0) {
					$("#actionForm").attr("action", "AuctionBoard");
					$("#actionForm").submit();
				} else {
					alert("경매가가 취소되지 않았습니다.");
				}
			},
			error : function(result) {
				alert("ERROR");
			}
		});
	}
}

function uploadResultCallBack(data, result) { 
	if(confirm("등록하시겠습니까?")) {
		
		if( $("input[name='BidPrice']").val() < $("input[name='AuctionPrice']").val() ) {
			var params = $("#updateForm").serialize();
			
			$.ajax({
				type : "post",
				url : "updateAuctionPriceRegist",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res == "true") {
						$("#actionForm").attr("action", "AuctionDetailLook");
						$("#actionForm").submit();
					} else {
						alert("경매가가 등록되지 않았습니다.");
					}
				},
				error : function(result) {
					alert("ERROR");
				}
			});
		} else {
			alert("현재경매가보다 금액이 적습니다.");
		}
	}
}

function UpdateTime(data, result) {
	var params = $("#updateForm").serialize();
		
	$.ajax({
		type : "post",
		url : "updateAuctionAddDate",
		dataType : "json",
		data : params,
		success : function(result) {
			if (result.res > 0) {
				$("#actionForm").attr("action", "AuctionDetailLook");
				$("#actionForm").submit();
			} else {
				alert("추가시간이 등록되지 않았습니다.");
			}
		},
		error : function(result) {
			alert("ERROR");
		}
	});
}
</script>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>

</head>
<body>
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
			<div class="AuctionCategory">
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
			<div class="AuctionDetailLook">
				<div class="AuctionPictureIf">
					<div class="AuctionPicture">
						<div class="AuctionPictureMain">   <img alt="${con.PICTURENAME}" src="resources/upload/${con.PICTURENAME}"/></div>
		              	<div class="AuctionPicture1"> <img alt="${con.PICTURENAME1}" src="resources/upload/${con.PICTURENAME1}"/></div>
		              	<div class="AuctionPicture2"> <img alt="${con.PICTURENAME2}" src="resources/upload/${con.PICTURENAME2}"/></div>
		              	<div class="AuctionPicture3"> <img alt="${con.PICTURENAME3}" src="resources/upload/${con.PICTURENAME3}"/></div>
		              	<div class="AuctionPicture4"> <img alt="${con.PICTURENAME4}" src="resources/upload/${con.PICTURENAME4}"/></div>
					</div>
				
				<div class="AuctionIf" width="390" align="center">
				<br/>
				<br/>
				<form action="#" id="actionForm" method="post">
					<input type="hidden" name="page" value="${param.page}" />
					<input type="hidden" name="searchText" value="${param.searchText}" />
					<input type="hidden" name="auctionNo" value="${param.auctionNo}" />
					<input type="hidden" name="memberNo" value="${sNo}">
					<input type="hidden" name="AuctionBoardStatus" value="${con.AUCTIONBOARDSTATUS}">
					<input type="hidden" name="AuctionStatus" value="${con.AUCTIONSTATUS}">
					<input type="hidden" name="BidPrice" value="${con.BIDPRICE}">
					<input type="hidden" name="RightNowBuyPay" value="${con.RNOWBUYPAY}" />
					<input type="hidden" name="StartBuyPay" value="${con.STARTBUYPAY}" />
					<input type="hidden" name="auctionMemNo" value="${sNo}" />
				</form>
				<table border="1" width="330" height="250">
					<tr>
						<th width="30%">글번호</th>
						<th width="70%">${con.AUCTIONWORDNO}</th>
					</tr>
					
					<tr>
						<th>물품명</th>
						<td>${con.AUCTIONPRODUCTNAME}</td>
					</tr>
					
					<tr>
						<th>글제목</th>
						<td>${con.WORDTITLE}</td>
					</tr>
					
					<tr>
						<th>즉시구매가</th>
						<td>${con.RNOWBUYPAY}원</td>
					</tr>
					
					<tr>
						<th>시작경매가</th>
						<td>${con.STARTBUYPAY}원</td>
					</tr>
					
					<tr>
						<th>현재경매가</th>
						<c:choose>
							<c:when test="${empty con.BIDPRICE}">
								<td>없음</td>
							</c:when>
							<c:otherwise>
								<td>${con.BIDPRICE}원</td>
							</c:otherwise>
						</c:choose>
						<%-- <td>${con.BIDPRICE}원</td> --%>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td>${con.NICK}</td>
					</tr>
					
					<tr>
						<th>작성일</th>
						<td>${con.WRITERDATE}</td>
					</tr>
					
					<tr>
						<th>마감시간</th>
						<td>${con.ENDDATE}</td>
					</tr>
					
					<tr>
						<th>남은시간</th>
						<input type="hidden" name="AuctionRemainTime" value="${con.REMAINTIME}" />
						<input type="hidden" name="AuctionRealTime" value="${con.REALTIME}" />
						<input type="hidden" name="AuctionSecond" value="${con.SEC}" />
						<input type="hidden" name="AuctionMinute" value="${con.MIN}" />
						<input type="hidden" name="AuctionHour" value="${con.HOUR}" />
						<input type="hidden" name="AuctionDay" value="${con.DAY}" />
						<td name="AuctionRemainTime">
							<%-- ${con.REMAINTIME} --%>
							<span class="countTimeDay">${con.DAY}</span>일
							<span class="countTimeHour">${con.HOUR}</span>시간
							<span class="countTimeMinute">${con.MIN}</span>분
							<span class="countTimeSecond">${con.SEC}</span>초
						</td>
					</tr>
					
					<tr>
						<th>조회수</th>
						<td>${con.LOOKUP}</td>
					</tr>
				</table>
				</div>
			</div>
					<div class="AuctionContent1">
						<div class="AuctionContentTop">
							<textarea rows="10" cols="80" readonly="readonly" style="margin: 0px; min-width:685px; max-width:685px; min-height:186px; max-height:186px;">${con.WORDCONTENT}</textarea>
						</div>
						<input type="hidden" name="memberNo" value="${sNo}">
						<input type="hidden" name="auctionNo" value="${param.auctionNo}" />
						<input type="hidden" name="BidPrice" value="${con.BIDPRICE}"/>
						<c:choose>
							<c:when test="${sNo eq con.MEMBERNO}">
								<div class="AuctionContentBottom1" style="visibility: hidden;">
								</div>
							</c:when>
							<c:otherwise>
								<form action="#" id="updateForm" method="post">
								<div class="AuctionContentBottom1">
										<input type="hidden" name="auctionNo" value="${param.auctionNo}" />
										<input type="hidden" name="LoginmemberNo" value="${sNo}">
										<input type="hidden" name="auctionEndDATE" value="${con.ENDDATE}" />
										<input type="hidden" name="MemberNo" value="${con.MEMBERNO}"/>
										<input type="hidden" name="BidPrice" value="${con.BIDPRICE}"/>
										<input type="hidden" name="auctionMemNo" value="${sNo}" />
									<table width="690px" style="margin-top : 10px">
										<tr>
											<td>현재 경매가 :
												<c:choose>
													<c:when test="${empty con.BIDPRICE}">
														없음
													</c:when>
													<c:otherwise>
														${con.BIDPRICE}원
													</c:otherwise>
												</c:choose>
											</td>
											<td>입찰가 : <input type="text" placeholder="입찰가를 입력해주세요." class="AuctionPriceTextBox" name="AuctionPrice"/></td>
											<td style="text-align: right;"><input type="button" value="경매가 등록" name="AuctionPriceRegist"  class="AuctionPriceRegisterBtn"/></td>
											<td style="text-align: right;"><input type="button" value="경매가 취소" name="AuctionPriceCancel"  class="AuctionPriceCancelBtn"/></td>
										</tr>
									</table>
								</div>
								</form>
							</c:otherwise>
						</c:choose>
						<div class="AuctionContentBottom2">
						<input type="hidden" name="memberNo" value="${sNo}">
						<input type="hidden" name="auctionNo" value="${param.auctionNo}" />
						<input type="hidden" name="auctionMemberNo" value="${con.AUCTIONMEMBERNO}" />
						<input type="hidden" name="auctionMemberNo" value="${con.AUCTIONMEMBERNO}" />
						<input type="hidden" name="auctionMemNo" value="${sNo}" />
						<input type="hidden" name="auctionMeNo" value="${con.MEMBERNO}" />
							<c:choose>
								<c:when test="${sNo eq con.MEMBERNO}">
									<input type="button" value="목록" id="listBtn" class="AuctionListBtn"/>
									<input type="button" value="수정" id="updateBtn" class="AuctionUpdateBtn"/>
									<input type="button" value="삭제" id="deleteBtn" class="AuctionDeleteBtn"/>
								</c:when>
								<c:otherwise>
									<input type="button" value="목록" id="listBtn" class="AuctionListBtn"/>
									<input type="button" class="AuctionRequestBtn" value="경매요청">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<br/>
			<div class="AuctionReply">
				<table border="1">
					<tr>
						<th>댓글</th>
					</tr>
				</table>
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
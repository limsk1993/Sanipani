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
<script type="text/javascript">
$(document).ready(function(){
	$(".AgreeBtn").on("click",function(){
		if(confirm("계속진행하시겠습니까???????")){
			var params = $("#EscrowInsert").serialize();
			
			$.ajax({
				type : "post",
				url : "EscrowInsert", // TestController에서 마들기
				dataType : "json",
				data : params,
				success : function(result){
					if(result.res == "true"){
						$('input[type="hidden"][name="TradeNo"]').val(result.no);
						$("#EscrowInsert").attr("action", "TradeRequest");
						$("#EscrowInsert").submit();
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
		
	});
	
	$(".DisagreeBtn").on("click",function(){
		if(confirm("계속진행하시겠습니까???????")){
			var params = $("#EscrowInsert1").serialize();
			
			$.ajax({
				type : "post",
				url : "EscrowInsert", // TestController에서 마들기
				dataType : "json",
				data : params,
				success : function(result){
			
						$('input[type="hidden"][name="TradeNo"]').val(result.no);
						$("#EscrowInsert").attr("action", "TradeRequest");
						$("#EscrowInsert").submit();
					
				},
				error : function(result){
					alert("ERROR!!");
				}
			});
		} else{
			alert("저장실패");
		}
		
	});
	
});

</script>
<style type="text/css">
.EscrowContent{
	width : 600px;
	height: 800px;
	background-color: #FFFFFF;
	margin-top: 50px;
	margin-left: 266px;
	
}
.EscrowAtten{
	width :	100%;
	height: 650px;
	background-color: #DDDDDD;

	
}
.AgreeBtn{
	display: inline-block;
	width: 150px;
	height: 70px;
	background-color: #DDDDDD;
	margin-top: 30px;
	margin-left: 130px;
	
}
.DisagreeBtn{
	display: inline-block;
	width: 150px;
	height: 70px;
	background-color: #DDDDDD;
	margin-top: 30px;
	margin-left: 20px;
}

</style>

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
				<div class="EscrowContent">
					
					<div class="EscrowAtten">
					설명충
					</div>
					<div class="AgreeBtn">
					
					동의
					</div>
					<div class="DisagreeBtn">
					비동의
					</div>
				
					
					<form action="#" method="post" id="EscrowInsert">
						<input type="hidden" name="Escrow" value="1">
						<input type="hidden" name="Trade_Status_No" value="1">
						<input type="hidden" name="Member_No" value="${sNo}">
						
						<input type="hidden" name="testNo" value="${param.testNo}"/>
						<input type="hidden" name="TradeNo" value=""/>
							
					</form>
					
					<form action="#" method="post" id="EscrowInsert1">
						<input type="hidden" name="Escrow" value="0">
						<input type="hidden" name="Trade_Status_No" value="1">
						<input type="hidden" name="Member_No" value="${sNo}">
						
						<input type="hidden" name="testNo" value="${param.testNo}"/>
						<input type="hidden" name="TradeNo" value=""/>
							
					</form>
				</div>
		</div>
	
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
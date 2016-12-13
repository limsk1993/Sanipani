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
	$('#buyUser').on("click",function(){

		var params = $("#actionForm").serialize();
		
		$.ajax({
			type:"post",
			url:"StatusInsert",
			dataType:"json",
			data : params,
			success : function(result){
					
			
					alert("거래를 신청하엿습니다");
					alert(result.con3);
					if(result.con2.BUY_PAY<=result.con3){
						var params = $("#actionForm").serialize();
						
						$.ajax({
							type:"post",
							url:"updateMoneyStatus",
							dataType:"json",
							data : params,
							success : function(result){
								alert("거래를 동의하였습니다");
								$('#buyUser').hide();
							
								
								
								if(result.con2.TRADE_STATUS_NO==2&&result.con2.TRADE_STATUS_NO1==2){
									
									var params = $("#actionForm").serialize();
									
									$.ajax({
										type:"post",
										url:"TradeOtherDel",
										dataType:"json",
										data : params,
										success : function(result){
											$("#actionForm").attr("action", "TradeRequest");
											$("#actionForm").submit();
										
										},
										error : function(result){
											alert("ERROR1");
										}
									});
								
									
												
										
										
									
									
								}
									
							
							},
							error : function(result){
								alert("ERROR");
							}
						});
						
				
					}
					else {
						alert("돈없어");
					}
			
					
			
			},
			error : function(result){
				alert("ERROR");
			}
		});
		
	});
	
	
	$('#sellUser').on("click",function(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type:"post",
			url:"StatusInsert1",
			dataType:"json",
			data : params,
			success : function(result){
		
				if(result.sell == "true"){
					alert("거래를 동의하였습니다");
					$('#sellUser').hide();
					
					
					if(result.con2.TRADE_STATUS_NO==2&&result.con2.TRADE_STATUS_NO1==2){
					
						
						
									
						var params = $("#actionForm").serialize();
						
						$.ajax({
							type:"post",
							url:"TradeOtherDel",
							dataType:"json",
							data : params,
							success : function(result){
								$("#actionForm").attr("action", "TradeRequest");
								$("#actionForm").submit();
							
							},
							error : function(result){
								alert("ERROR");
							}
						});
							
						
						
					}
				} else{
					alert("저장 중 문제가 발생했습니다.");
				}
					
			
			},
			error : function(result){
				alert("ERROR");
			}
		});
		
	});
	
	$(".backBtn").on("click",function(){
		$("#actionForm").attr("action","TradeRequest");
		$("#actionForm").submit();
	});

});

</script>

<style type="text/css">
.StatusContent{
	width : 600px;
	height: 800px;
	background-color: #FFFFFF;
	margin-top: 50px;
	margin-left: 266px;
	
}

.backBtn{
	width : 80px;
	height: 30px;
	background-color: #1234FF;

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
		<div class="StatusContent">
		<form action="#" id="actionForm" method="post">
			<input type="text" name="page" value="${param.page}"/>
			<input type="text" name="sNo" value="${sNo}"/>
			<input type="text" name="searchText" value="${param.searchText }"/>
			<input type="text" name="testNo" value="${param.testNo}"/>
			<input type="text" name="TradeNo" value="${param.TradeNo}">
			<input type="text" name="Pay" value="${con1.BUY_PAY}">
			<input type="text" name="TradeStatus" value="${param.TradeNo}거래입금">
		
		
			<table border="1" width="500px">
			<tr>
					<td width="25%">구매자</td>
					<td width="75%"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td>${con.NAME}</td>
				</tr>
				
				<tr>
					<td>전화번호</td>
					<td>${con.PHONE}</td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td>${con.ADDR}  </td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>   ${con.DETAILADDR }</td>
				</tr>
				
				
				<tr>
					<td>이메일</td>
					<td>${con1.EMAIL}@${con.EMAIL2}</td>
				</tr>	
				<tr><c:choose>
					<c:when test="${con2.TRADE_STATUS_NO eq 2}">
					<td></td>
					<td><div class="buyStatus" id="buyStatus" >동의하였습니다</div>
					</td>
					</c:when>
					<c:otherwise>
					<c:choose>
							<c:when test="${con.MEMBERNO eq sNo}">
								<td><input type="button" id="buyUser" value="거래동의"></td><td></td>
							</c:when>
							<c:otherwise>
								<td></td><td></td>
							</c:otherwise>	
						</c:choose>	
						
					</c:otherwise>
					</c:choose>
					
				</tr>	
			
			</table>
			<br/>
			<br/>
			
					<table border="1" width="500px">
				<tr>
					<td width="25%">판매자</td>
					<td width="75%"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td>${con1.NAME}</td>
				
				</tr>
				
				<tr>
					<td>전화번호</td>
					<td>${con1.PHONE}</td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td>${con1.ADDR}  </td>
				</tr>
				
				<tr>
					<td>상세주소</td>
					<td>${con1.DETAILADDR }</td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td>${con1.EMAIL1}@${con1.EMAIL2}</td>
				</tr>
				
				<tr>
				
					<c:choose>
					<c:when test="${con2.TRADE_STATUS_NO1 eq 2}">
					<td></td>
					<td><div class="sellStatus" id="sellStatus" >동의하였습니다</div>
					</td>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${con1.MEMBERNO eq sNo}">
								<td><input type="button" id="sellUser" value="거래동의"></td><td></td>
							</c:when>
							<c:otherwise>
								<td></td><td></td>
							</c:otherwise>	
						</c:choose>	
					</c:otherwise>
					</c:choose>
				</tr>		
			
			</table>
	
		</form>
		
		<div class="backBtn">뒤로가기</div>
		</div>	
		</div>
	
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
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
	$("#deliveryOkBtn").on("click",function(){
		if(confirm("계속진행하시겠습니까???????")){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "DeliveryUpdate", // TestController에서 마들기
				dataType : "json",
				data : params,
				success : function(result){
					if(result.res == "true"){
				
						$('input[name="deliveryName"]').val(result.con.DELIVERY_NAME);	
						$('input[name="deliveryNo1"]').val(result.con.DELIVERY_NO);	
						
					} 
						else{
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
		
		
	$(".backBtn1").on("click",function(){
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
input[type="text"]{

	width : 300px;
}
img{
	width: 180px;
	height: 50px;
}
.Dname input[type="text"]{
	
	width : 88px;

}
.Dname{
	display :inline-block;
}
.Dno{
	display :inline-block;
}

.backBtn1{
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
			<input type="text" name="Pay" value="">
					<table border="1" width="600px">
				<tr>
					<td width="15%">판매자</td>
					<td width="70%"></td>
					<td width="15%"></td>
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
					<td>배송여부</td>
					<td><c:if test="${con2.TRADE_STATUS_NO eq 3 }">
						${con2.TRADE_STATUS}
					</c:if></td>
					<td></td>
				</tr>
				<tr>
					<td>운송장번호</td>
					<td>
					<div class="Dname"><input type="text" name="deliveryName" readonly="readonly" value="${con2.DELIVERY_NAME}"></div>
					<div class="Dno"><input type="text" name="deliveryNo1" readonly="readonly" value="${con2.DELIVERY_NO}"></div></td>
					<td></td>
				</tr>	
				<tr>
					<td></td>
					<c:choose>
						<c:when test="${con1.MEMBERNO eq sNo}">
							<td>
								<select name="selectDelivery">
									<option value="1">우체국택배</option>
									<option value="2">CJ택배</option>
									<option value="3">한진택배</option>
									<option value="4">현대택배</option>
									<option value="5">로젠택배</option>
								</select>
								<input type="text" name="deliveryNo" placeholder ="운송장번호를 입력하세요" ></td>
								<td><input type="button" id="deliveryOkBtn" value="배송완료"></td>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</tr>
				
				
				
					
			
			</table>
			
			</form>
			<br/>
			<br/>
			<table border="1" width="600px">
				<tr>
					<td width="15%">구매자</td>
					<td width="70%"></td>
					<td width="15%"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td>${con.NAME}</td>
					<td></td>
				</tr>
				
				<tr>
					<td>전화번호</td>
					<td>${con.PHONE}</td>
					<td></td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td>${con.ADDR}  </td>
					<td></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>   ${con.DETAILADDR }</td>
					<td></td>
				</tr>
				
				
				<tr>
					<td>이메일</td>
					<td>${con.EMAIL}@${con.EMAIL2}</td>
					<td></td>
				</tr>
				
			
			
			</table>
				
			<br/>
			<div class="backBtn1">뒤로가기</div>
			<br/>
		<a href="https://parcel.epost.go.kr/auth.EpostLogin.parcel"><img src="resources/images/TradeStatus1/우체국.PNG"/></a>
		<a href="https://www.doortodoor.co.kr/parcel/pa_004.jsp"><img src="resources/images/TradeStatus1/cj.PNG"/></a>
		<a href="https://www.hlc.co.kr/home/personal/inquiry/track"><img src="resources/images/TradeStatus1/hd.PNG"/></a>
		<a href="http://www.hanjin.co.kr/Delivery_html/inquiry/personal_inquiry.jsp"><img src="resources/images/TradeStatus1/hj.PNG"/></a>
		<a href="http://www.ilogen.com/d2d/delivery/invoice_search.jsp"><img src="resources/images/TradeStatus1/lj.PNG"/></a>
		
		</div>	                                                    
		</div>
	
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
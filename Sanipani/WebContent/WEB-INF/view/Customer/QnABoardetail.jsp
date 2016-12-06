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
<link rel="stylesheet" type="text/css" href="resources/css/spmain/QnApage.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>
<script type="text/javascript">
$(document).ready(function(){
/* 	$("#QnAdeleteBtn").on("click", function(){
		var params = $("#actionForm2").serialize();
		
		$.ajax({
			
		});
	}); */
	$(".bar").on("click", function(){
		location.href = "cusBoard";
	})
	$(".bar2").on("click", function(){
		location.href = "QnABoard";
	})
	$("#QnAmodifyBtn").on("click",function(){
		$("#actionForm2").attr("action", "QnAFix");
		$("#actionForm2").submit();
	});
	$("#QnAdeleteBtn").on("click", function(){
		
		var params =$("#actionForm2").serialize();
		
		$.ajax({
			type : "post",
			url : "QnAdelete",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res > 0) {
					$("#actionForm2").attr("action", "QnABoard");
					$("#actionForm2").submit();
				}else {
					alert("삭제실패");
				}
			},
			error : function(result){
				alert("ERROR");
			}
		});
	});
});
</script>
</head>
<body><div class="main">
	<div class="left"></div>
	<div class="main1">
		<div class="menubar1">
	</div>
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
		<div class="bar">
			QNA 게싯판
			</div>
			<div class="bar1">
				<div class="bar1_1">
				고객센터
				</div>
				<div class="bar1_2">
				환불 / 거래취소
				</div>
				<div class="bar1_3">
				주문 / 결제
				</div>
				<div class="bar1_4">
				쿠폰 / 사니파니머니
				</div>
				<div class="bar1_5">
				회원 서비스
				</div>
				
			</div>
				
		<div class="content2"> 		 
			<div class="bar2">
				자주 묻는 질문
			</div>
				<div class="bar2_1">
					<form action="#" id="actionForm2" method="post">
					<input type="hidden" name="page" value="${param.page}"/>
					<input type="hidden" name="searchText" value="${param.searchText}"/>
					<input type="text" name="testNo2" value="${param.testNo2}"/>
					</form>
				
					<table border="1">
						<thead>
							<tr>
								<th>번호</th>
								<td>${con.QNA_WORDNUMBER}</td> 
							</tr>
							<tr>
								<th>내용</th>
								<td>${con.QNA_WRITER}</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td>${con.QNA_WRITEDATE}</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>${con.QNA_CONTENT}</td>
							</tr>
							<tr>
								<th>답변</th>
								<td>${con.QNA_REPLY}</td>
							</tr>
						</thead>	
					</table>
					<div>
					<input type="button" value="글삭제" id="QnAdeleteBtn"/>
					<input type="button" value="글수정" id="QnAmodifyBtn"/>
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
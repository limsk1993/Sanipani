<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/spmain/Mainpage.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/spmain/Mainpage.css" />
<style type="text/css">
.ReportCategory {
	display: inline-block;
	width: 200px;
	height: 90%;
	background-color: #123FAC;
}

.RepContent {
	vertical-align: top;
	display: inline-block;
	padding: 20px;
	width: 690px;
	height: 90%;
	background-color: #F1232F;
}
.BlkList{
	display: block;
	   margin-top: 5px;
	   height:40px;
	   background-color: #409991;
}

.RepList{
	display: block;
	   margin-top: 5px;
	   height:40px;
	   background-color: #409991;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#listBtn").on("click", function() {//목록
			$("#actionForm").attr("action", "BlackList");
			$("#actionForm").submit();
		});

		$("#deleteBtn").on("click", function() {//삭제
			if (confirm("삭제하시겠습니까?")) {
				var params = $("#actionForm").serialize();

				$.ajax({
					type : "post",
					url : "deleteBlackList",
					datatype : "json",
					data : params,
					success : function(result) {
						if (result.res > 0) {
							location.href = "BlackList";
						} else {
							alert("삭제를 실패");
						}
					},
					error : function(result) {
						alert("ERROR");
					}
				})
			}
		});
		$(".BlkList").on("click",function(){
			location.href="BlackList";
		});
		
		$(".RepList").on("click",function(){
			location.href="ReportBoard";
		});
	});
</script>
</head>
<body>
	<div class="main">
		<div class="left"></div>
		<div class="main1">

			<div class="login">
				<div class="loginNull"></div>


				<!--로그인 접속전  -->

				<c:choose>
					<c:when test="${sNo ne null}">
						<div class="loginAccess" id="loginAccess" style="display: none;">
					</c:when>
					<c:otherwise>
						<div class="loginAccess" id="loginAccess">
					</c:otherwise>
				</c:choose>
				<form action="#" id="LoginForm" method="post"
					style="display: inline">
					<!--form도  display를 줘야한다 -->

					<div class="login1">
						<div class="id">
							id:<input type="text" name="Id" id="Id" maxlength="15">
						</div>
					</div>

					<div class="login2">
						<div class="pw">
							pw:<input type="password" name="Pw" id="Pw" maxlength="15">
						</div>
					</div>
				</form>
				<div class="login3">
					<div class="loginBtn">로그인</div>
				</div>

				<div class="login4">
					<div class="memberLogiBtn">회원가입</div>
				</div>


			</div>




			<!-- 로그인 접속후 -->
			<c:choose>
				<c:when test="${sNo ne null}">
					<div class="loginCut" id="loginCut">
				</c:when>
				<c:otherwise>
					<div class="loginCut" id="loginCut" style="display: none">
				</c:otherwise>
			</c:choose>
			<div class="login1_1">
				<div class="memberInfo">
					<span id="memNick">${sNick}</span>님 환영합니다
				</div>
			</div>

			<div class="login2_1">
				<div class="logout">logout</div>
			</div>

			<div class="login3_1">
				<div class="mypage">mypage</div>
			</div>

			<div class="login4_1">
				<div class="basket">basket</div>
			</div>


		</div>

	</div>




	<div class="menubar">
		<div class="logo">logo</div>

		<div class="menuall">
			<div class="auctionBoard" id="auctionBoard">auction</div>
			<div class="auctionBoard_1" id="auctionBoard_1"
				style="display: none;">
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
			<div class="tradeBoard" id="tradeBoard">trade</div>
			<div class="tradeBoard_1" id="tradeBoard_1" style="display: none;">
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
			<div class="reportBoard">report</div>

			<div class="customerBoard">customer</div>

			<div class="freeBoard">free</div>
		</div>
	</div>

	<div class="content">	
		<div class="ReportCategory">
			<div class="RepList">신고 접수 목록</div>
			<div class="BlkList">블랙리스트 목록</div>
		</div>
		<div class="RepContent">

			<form action="#" id="actionForm" method="post">
				<input type="hidden" name="page" value="${param.page}" /> 
				<input type="hidden" name="searchText" value="${param.searchText}" /> 
				<input type="hidden" name="ReportNo" value="${param.ReportNo}" />
				<input type="hidden" name="BLACKLISTNO" value="${con.BLACKLISTNO}" />
				<input type="hidden" name="MEMBERNO" value="${con.MEMBERNO}" />
			</form>



			<table border="1">
				<tr>
					<th>아이디</th>
					<td>${con.ID}</td>
					<th>닉네임</th>
					<td>${con.NICK}</td>					 					
				</tr>
				<tr>
					<th>날짜</th>
 					<td>${con.BDATE}</td>
 					<th>신고유형</th>
					<td>${con.REPORTCATEGORYNAME}</td>
				</tr>
			</table>
			<c:choose>
				<c:when test="${sGrade eq 0}">
					<input type="button" value="목록" id="listBtn" /> 
					<input type="button" value="삭제" id="deleteBtn" /> 
				</c:when>
				<c:otherwise>
					<input type="button" value="목록" id="listBtn">
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	</div>
	<div class="right">

		<div class="ad"></div>
	</div>
	</div>
</body>
</html>
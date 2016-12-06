<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
   
.BlackList {
	vertical-align: top;
	display: inline-block;
	padding: 20px;
	width: 690px;
	height: 90%;
	background-color: #F1232F;
	text-align: center;	
}

.ReportCategory {
	display: inline-block;
	width: 200px;
	height: 90%;
	background-color: #123FAC;
}

</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/spmain/Mainpage.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	refreshList();
	
	$("#searchBtn").on("click", function() {
		$("input[name='searchText']").val($("#searchText").val());
		$("input[name='page']").val("1");

		refreshList();
	});

	$("#insertBtn").on("click", function() {

		$("#actionForm").attr("action", "InsRep");//추가
		$("#actionForm").submit();
	});

	$("#pagingArea").on("click", "span", function() {
		$("input[name='page']").val($(this).attr("name"));

		refreshList();
	});

	$("#tb1").on("click", "tr", function() {
		$("input[name='ReportNo']").val($(this).attr("name"));
		$("#actionForm").attr("action", "DetailBlk");//내용
		$("#actionForm").submit();

		//alert($(this).attr("name"));
	});
	
	$(".BlkList").on("click",function(){
		location.href="BlackList";
	});
	
	$(".RepList").on("click",function(){
		location.href="ReportBoard";
	});
});

	function refreshList() {
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
					type : "post",
					url : "RefreshBlackList",
					datatype : "json",
					data : params,
					success : function(result) {
						var html = "";
						
						for (var i = 0; i < result.list.length; i++) {
							html += "<tr name='" + result.list[i].BNO + "'>";
							html += "<td>" + result.list[i].BLACKLISTRNO + "</td>";//블랙리스트번호													
							html += "<td>" + result.list[i].NICK + "</td>"//블랙리스트닉네임
							html += "<td>" + result.list[i].BDATE + "</td>";//날짜					
							html += "<td>" + result.list[i].REPORTCATEGORYNAME + "</td>";//신고유형				
							html += "<td>" + result.list[i].REPORTWORDNO + "</td>";//거래글번호. 임시로 신고글번호 가져옴
							/* html += "<td>" + result.list[i].LOOKUP + "</td>";//조회 */
								
							html += "</tr>";
						}
						$("#tb1").html(html);

						html = "";

						html += "<span name='1'>처음</span>";

						if ($("input[name='page']").val() == 1) {
							html += "<span name ='1'>이전</span>";
						} else {
							html += "<span name = '"
									+ ($("input[name='page']").val() - 1)
									+ "'>이전</span>";
						}

						for (var i = result.pb.startPcount; i <= result.pb.endPcount; i++) {
							if (i == $("input[name='page']").val()) {
								html += "<span name = '" + i + "'><b>" + i
										+ "</b></span>";
							} else {
								html += "<span name = '" + i + "'>" + i
										+ "</span>";
							}

						}

						if ($("input[name='page']").val() == result.pb.maxPcount) {
							html += "<span name= '" + result.pb.maxPcount + "'>다음</span>";
						} else {
							html += "<span name= '"
									+ ($("input[name='page']").val() * 1 + 1)
									+ "'>다음</span>";
						}

						html += "<span name= '" + result.pb.maxPcount + "'>마지막</span>";

						$("#pagingArea").html(html);

					},
					error : function(result) {
						alert("error!");
					}
				});
	}
</script>
<link rel="stylesheet" type="text/css"
	href="resources/css/spmain/Mainpage.css" />

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
		<div class="BlackList">
			<h2>블랙리스트 목록</h2>
			<form action="#" id="actionForm" method="post">
				<c:choose>
					<c:when test="${empty param.page}">
						<input type="hidden" name="page" value="1">
					</c:when>
					<c:otherwise>
						<input type="hidden" name="page" value="${param.page}" />
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="searchText" value="${param.searchText}" />
				<input type="hidden" name="ReportNo" />
			</form>

			<table border="1">
				<thead>
					<tr>
						<th width="100px">번호</th>
						<th width="100px">닉네임</th>
						<th width="122px">날짜</th>
						<th width="122px">신고유형</th>
						<th width="122px">거래글번호</th>												
					</tr>
				</thead>
				<tbody id="tb1">
				</tbody>
			</table>
		<br />
		
		<input type="text" id="searchText" value="${param.searchText}" />
		<input type="button" value="검색" id="searchBtn" />
		<input type="button" value="신고" id="insertBtn" />

		
		<div id="pagingArea"></div>
		</div>

	</div>
	</div>
	<div class="right">
		<div class="ad"></div>
	</div>
	</div>
</body>
</html>
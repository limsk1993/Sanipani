<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.RerportTitle{
	width: 100px;
	height: 10px;
}
.ReportList {
	vertical-align: top;
	display: inline-block;
	padding: 20px;
	width: 690px;
	height: 90%;
	background-color: #F1232F;
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
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#listBtn").on("click", function() {
			$("#actionForm").attr("action", "ReportBoard");
			$("#actionForm").submit();
		});

		$("#saveBtn").on("click", function() {
			var insertRepForm = $("#insertRepForm");

			insertRepForm.ajaxForm(uploadResultCallBack);//ajax를 실행하고나서 uploadResultCallBack라는 함수를 호출하겠다.
			insertRepForm.submit(); // 폼 자체가 실행할때 ajax로 구동을 하겠다. 기존엔 ajax로 이동한것.

		});
	});

	function uploadResultCallBack(data, result) { //json 받은것 .
		if (result == "success") {
			var resData = eval("(" + removePre(data) + ")"); // eval = 데이터를 용도에 맞춰 분리시켜줌. 원래는 자바스크립트 bean을 만들어줄려고 있는 기능.

			$("#RepPic").val(resData.fileName[0]);//textFile에 업로드된 파일네임 갖다넣음

			var params = $("#insertRepForm").serialize(); //파일업로드를 하고난 후 글 저장을 하겠다.

			$.ajax({
				type : "post",
				url : "insertReport",
				datatype : "json",
				data : params,
				success : function(result) {
					if (result.res == "true") {
						location.href = "ReportBoard";
					} else {
						alert("저장 중 문제가 발생했습니다.");
					}
				},
				error : function(result) {
					alert("ERROR!!");
				}
			});

		} else {
			alert("저장실패");
		}
	}

	function removePre(data) {
		if (data.indexOf("<pre>") > -1) { // pre가 있다면 pre를 지우고 안에있는 내용을 가져오겠다.
			var st = data.indexOf(">");
			var ed = data.indexOf("<", st);

			return data.substring(st + 1, ed);
		} else {
			return data;
		}
	}
	
	$(".BlkList").on("click",function(){
		location.href="BlackList";
	});
	
	$(".RepList").on("click",function(){
		location.href="ReportBoard";
	});
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
			<div class="home">신고 접수 목록</div>
			<div class="elec">블랙리스트 목록</div>
		</div>
		<div class="ReportList">
		<form action="#" id="actionForm" method="post">
			<input type="hidden" name="page" value="${param.page}" /> 
			<input type="hidden" name="searchText" value="${param.searchText}" />
		</form>
		
		<form action="fileUploadAjax" id="insertRepForm" method="post" enctype="multipart/form-data" text-align="center">
			<input type="hidden" name="MEMNO" value="${sNo }"/>
			제목<input type="text" class="ReportTitle" name="ReportTitle"/> <br/>
			피해사례<select name="ReportCategory">
  			<option value="1">물품상태 불량</option>
  			<option value="2">구성품 누락</option>
  			<option value="3">욕설 및 비매너</option>
			</select>
			<br />
			가해자 닉네임 <input type="text" class="FraudNick" name="FraudNick" <%-- value="${con.REPORTTARGET}" --%>/>
			<br />
			물품 <input type="text" class="ProductName" name="ProductName"/>
			<br />
			내용 <textarea rows="10" cols="80" name="Reportcontent" style="margin: 0px; width: 619px; height: 195px;"></textarea>
			<br/>
			 파일 <input type="file" name="RepPic" />
			 <input type="hidden" name="textFile" id="textFile"/>
			
		</form>
		<input type="button" value="목록" id="listBtn" />
		<input type="button" value="저장" id="saveBtn" />
	</div>
	</div>
	</div>
	<div class="right">
		<div class="ad"></div>
	</div>
	</div>
</body>
</html>
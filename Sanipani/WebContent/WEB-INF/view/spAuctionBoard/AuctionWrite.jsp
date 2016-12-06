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
.AuctionWrite {
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
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#listBtn").on("click", function() {
		$("#actionForm").attr("action", "AuctionBoard");
		$("#actionForm").submit();
	});
	
	$("#saveBtn").on("click", function() {
		var insertForm = $("#insertForm")
		
		insertForm.ajaxForm(uploadResultCallBack);
		insertForm.submit();
	});
});

function uploadResultCallBack(data, result) {
	if(result == "success") {
		var resData = eval("(" + removePre(data) + ")");
		
		$("#auctionFile1").val(resData.fileName[0]);
		$("#auctionFile2").val(resData.fileName[1]);
		$("#auctionFile3").val(resData.fileName[2]);
		$("#auctionFile4").val(resData.fileName[3]);
		$("#auctionFile5").val(resData.fileName[4]);
		
		var params = $("#insertForm").serialize();
		
		$.ajax({
			type : "post",
			url : "insertAuction",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res == "true") {
					location.href = "AuctionBoard";
				} else {
					alert("저장 중 문제가 발생했습니다.");
				}
			},
			error : function(result) {
				alert("ERROR!!");
			}
		});
	} else {
		alert("저장 실패");
	}
}

function removePre(data) {
	if(data.indexOf("<pre>") > -1) { // pre가 있으면 pre를 없애고 안에 내용만 가져옴
		var st = data.indexOf(">"); // start지점 <pre>
		var ed = data.indexOf("<", st); 
		
		return data.substring(st + 1, ed);
	} else {
		return data;
	}
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
			<div class="AuctionWrite">
			<h2>경매게시판 글쓰기 </h2>
			<form action="#" id="actionForm" method="post">
				<input type="hidden" name="page" value="${param.page}" />
				<input type="hidden" name="searchText" value="${param.searchText}" />
			</form>
			<form action="fileUploadAjax" 
				  id="insertForm"
				  method="post"
				  enctype="multipart/form-data">
				  <input type="hidden" name="UserNo" value="${sNo}"/>
				  <table border="1">
				  
				  	<tr>
				  		<td>
				  			물품명
				  		</td>
				  		<td>
				  			<input type="text" name="AuctionproductName" style="margin: 0px; width: 580px; height: 15px;"/>
				  		</td>
				  	</tr>
				  	
				  	<tr>
				  		<td>
				  			제목
				  		</td>
				  		<td>
				  			<input type="text" name="Auctiontitle" style="margin: 0px; width: 580px; height: 15px;"/>
				  		</td>
				  	</tr>
				  	
				  	<tr>
				  		<td>
				  			내용
				  		</td>
				  		<td>
				  			<textarea rows="10" cols="80" name="AuctionContents"" style="margin: 0px; width: 580px; height: 195px;"></textarea>
				  		</td>
				  	</tr>
				  	
				  	<tr>
				  		<td>
				  			시작경매가
				  		</td>
				  		<td>
				  			<input type="text" name="StartAuctionPrice" style="margin: 0px; width: 150px; height: 15px;"/>
				  		</td>
				  	</tr>
				  	
				  	<tr>
				  		<td>
				  			즉시구매가
				  		</td>
				  		<td>
				  			<input type="text" name="NowAuctionPrice" style="margin: 0px; width: 150px; height: 15px;"/>
				  		</td>
				  	</tr>
				  	
				  	<tr>
				  		<td>
				  			물품사진
				  		</td>
				  		<td>
				  			<input type="file" name="att1" />
				  			<input type="hidden" name="auctionFile1" id="auctionFile1" />
				  			<br/>
				  			<input type="file" name="att2" />
				  			<input type="hidden" name="auctionFile2" id="auctionFile2" />
				  			<br/>
				  			<input type="file" name="att3" />
				  			<input type="hidden" name="auctionFile3" id="auctionFile3" />
				  			<br/>
				  			<input type="file" name="att4" />
				  			<input type="hidden" name="auctionFile4" id="auctionFile4" />
				  			<br/>
				  			<input type="file" name="att5" />
				  			<input type="hidden" name="auctionFile5" id="auctionFile5" />
				  		</td>
				  	</tr>
				  	
				  </table>
			</form>
			<input type="button" value="저장" id="saveBtn" />
			<input type="button" value="목록" id="listBtn" />
			</div>
		</div>
	
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
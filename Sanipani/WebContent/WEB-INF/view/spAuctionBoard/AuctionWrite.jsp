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
	background-color: #FFFFFF;
}
.AuctionCategory {
	display : inline-block;
	width: 220px;
	height: 90%;
	background-color: #B2FFD1;
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
					if("${param.catogery}"==1){
						location.href = "AuctionBoard";
						}
						else if("${param.catogery}"==2){
							location.href = "AuctionBoard1";
						}
						else if("${param.catogery}"==3){
							location.href = "AuctionBoard2";
						}
						else if("${param.catogery}"==4){
							location.href = "AuctionBoard3";
						}
						else if("${param.catogery}"==5){
							location.href = "AuctionBoard4";
						}
						else if("${param.catogery}"==6){
							location.href = "AuctionBoard5";
						}
						else if("${param.catogery}"==7){
							location.href = "AuctionBoard6";
						}
						else if("${param.catogery}"==8){
							location.href = "AuctionBoard7";
						}
						else if("${param.catogery}"==9){
							location.href = "AuctionBoard8";
						}
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
		<div class="AuctionCategory">
			<div class="AuctionBoardCategory"><img alt="TabImg" src="resources/images/AuctionPageImage/AuctionTab.bmp"></div>
			<div class="home"><img alt="HomeImg" src="resources/images/AuctionPageImage/AuctionHome.bmp"></div>
			<div class="elec"><img alt="elecImg" src="resources/images/AuctionPageImage/AuctionElec.bmp"></div>
			<div class="cloth"><img alt="clothImg" src="resources/images/AuctionPageImage/AuctionCloth.bmp"></div>
			<div class="watch"><img alt="watchImg" src="resources/images/AuctionPageImage/AuctionWatch.bmp"></div>
			<div class="cosmetic"><img alt="cosmeticImg" src="resources/images/AuctionPageImage/AuctionCosmetic.bmp"></div>
			<div class="travel"><img alt="travelImg" src="resources/images/AuctionPageImage/AuctionTravel.bmp"></div>
			<div class="furni"><img alt="furniImg" src="resources/images/AuctionPageImage/AuctionFurni.bmp"></div>
			<div class="book"><img alt="bookImg" src="resources/images/AuctionPageImage/AuctionBook.bmp"></div>
			<div class="etc"><img alt="etcImg" src="resources/images/AuctionPageImage/AuctionEtc.bmp"></div>
		</div>
			<div class="AuctionWrite">
			<h2>경매게시판 글쓰기 </h2>
			<form action="#" id="actionForm" method="post">
				<input type="hidden" name="page" value="${param.page}" />
				<input type="hidden" name="searchText" value="${param.searchText}" />
				<input type="hidden" name="AuctionCategory" value="${param.catogery}" />
			</form>
			<form action="fileUploadAjax" 
				  id="insertForm"
				  method="post"
				  enctype="multipart/form-data">
				  <input type="hidden" name="UserNo" value="${sNo}"/>
				  <input type="hidden" name="AuctionCategory" value="${param.catogery}" />
				  <table>
				  
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
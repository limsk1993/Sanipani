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
<style type="text/css">
.sample {
	display : inline-block;
	background-color: #FFFFFF;
	vertical-align : top;
	width: 200px;
	height: 220px;
	margin: 1em;
	font-size: 12px;
}

.AuctionProductPicture {
	display : inline-block;
	margin-top : 5px;
	margin-left: 5px;
	width : 149px;
	height: 150px;
}

.AuctionProductName {
	display : inline-block;
	vertical-align : top;
	margin-top : 3px;
	margin-left: 5px;
}

.AuctionNowPrice {
	display : inline-block;
	vertical-align : top;
	margin-top : 3px;
	margin-left: 5px;
}

.AuctionRemainTime {
	display : inline-block;
	vertical-align : top;
	margin-top : 3px;
	margin-left: 5px;
}

.AuctionProductPicture img {
	width : 190px;
	height: 150px;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	/* <input type="button" value="저장" id="NoticeSaveBtn" />
		<input type="button" value="취소" id="NoticeCancelBtn" /> */
/* 		<input type="button" value="수정" name="NoticeUpdate" />
		<input type="button" value="삭제" name="NoticeDelete" />
		<input type="button" value="뒤로가기" name="NoticeHome" /> */
	$("#NoticeSaveBtn").on("click", function() {
		var params = $("#insertForm").serialize();
		
		$.ajax({
			type : "post",
			url : "insertNotice",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res == "true") {
					$("#NoticeForm").attr("action", "Mainpage");
					$("#NoticeForm").submit();
				} else {
					alert("저장 중 문제가 발생했습니다.");
				}
			},
			error : function(result) {
				alert("ERROR!!");
			}
		});
	});
		
	$("#NoticeCancelBtn").on("click", function() {
		$("#NoticeForm").attr("action", "MainNoticeDetailLook");
		$("#NoticeForm").submit();
	});
		
});

function uploadResultCallBack(result) { 
	if(result == "success") {
		/* var resData = eval("(" + removePre(data) + ")");
		
		if(resData.fileName[0] != null) {
			$("#auctionFile").val(resData.fileName[0]);
		} */
		
		var params = $("#updateForm").serialize();
		
		$.ajax({
			type : "post",
			url : "updateNotice",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res > 0) {
					$("#NoticeForm").attr("action", "MainNoticeDetailLook");
					$("#NoticeForm").submit();
				} else {
					alert("수정 중 문제가 발생했습니다.");
				}
			},
			error : function(result) {
				alert("ERROR!!");
			}
		});
	} else {
		alert("수정 실패");
	}
}

function removePre(data) {
	if(data.indexOf("<pre>") > -1) { 
		var st = data.indexOf(">");
		var ed = data.indexOf("<", st); 
		
		return data.substring(st + 1, ed);
	} else {
		return data;
	}
}
</script>
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
			<div class="AuctionWrite">
			<h2>공지사항 글쓰기 </h2>
			<form action="#" id="NoticeForm" method="get">
				<input type="hidden" name="NoticeNo" value="${con.NOTICENO}" />
			</form>
			<form action="fileUploadAjax" 
				  id="insertForm"
				  method="post"
				  enctype="multipart/form-data">
				  <input type="hidden" name="UserNo" value="${sNo}"/>
				  <input type="hidden" name="NoticeNo" value="${con.NOTICENO}" />
				  <table border="1">
				  	<tr>
				  		<td>
				  			제목
				  		</td>
				  		<td>
				  			<input type="text" name="Noticetitle" style="margin: 0px; width: 580px; height: 15px;" />
				  		</td>
				  	</tr>
				  	
				  	<tr>
				  		<td>
				  			내용
				  		</td>
				  		<td>
				  			<textarea rows="10" cols="80" name="NoticeContents" style="margin: 0px; width: 580px; height: 195px;"></textarea>
				  		</td>
				  	</tr>
				  	
				  	<!-- <tr>
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
				  	</tr> -->
				  	
				  </table>
			</form>
			<input type="button" value="저장" id="NoticeSaveBtn" />
			<input type="button" value="취소" id="NoticeCancelBtn" />
			</div>
		</div>
	
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
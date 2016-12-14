
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
<script type="text/javascript" src ="resources/script/jquery/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/QnApage.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#QnAbackBtn").on("click", function(){
	
		$("#actionForm2").attr("action", "QnABoardetail");
		$("#actionForm2").submit();
	});
	$("#QnAmodBtn").on("click", function(){
		var QnAupdateForm = $("#QnAupdateForm");
		
		QnAupdateForm.ajaxForm(QnAupload);
		
		QnAupdateForm.submit();
	});
	

});

function QnAupload(data, result){
	if(result == "success"){
		var resData = eval("(" + removePre(data) + ")");
		
		if(resData.fileName[0] != null){
			$("#testFile").val(resData.fileName[0]);
		}
		
		var params = $("#QnAupdateForm").serialize();
	
	$.ajax({
		type : "post",
		url : "QnAupdate",
		dataType : "json",
		data : params,
		success : function(result){
			if(result.res > 0) {
				$("#actionForm2").attr("action", "QnABoard");
				$("#actionForm2").submit();
			} else {
				alert("수정실패..");
			}
		},
		error : function(result){
			alert("ERROR");
		}
	});
	
	}else{
		alert("ㅅㅅㅅ");
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
				사니파니머니
				</div>
				<div class="bar1_5">
				회원 서비스
				</div>
				
			</div>
				
		<div class="content2"> 		 
			<div class="bar2">
				<b>고객센터 >> 자주묻는질문(수정)</b>
			</div>
				<div class="qnabar2">
<form action="#" id="actionForm2" method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchText" value="${param.searchText }"/>
	<input type="text" name="testNo2" value="${param.testNo2}" />
</form>

<form action="fileUploadAjax" id="QnAupdateForm" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="testNo2" value="${param.testNo2}" />
		<div class="title">
		제목
	    <input type="text" name="QNATITLE" value="${con.QNA_TITLE}" />
	    </div>
	    <div class="Writecontent">
	        내용
	    <textarea cols="70" rows="15" style="resize:none;" name="QNACONTENT">${con.QNA_CONTENT}</textarea>	
		
		</div>	
											
		
				
				


</div>
	<div class="replycontent">
		답변<textarea cols="70" rows="8" style="resize:none;" name="QNAREPLY">${con.QNA_REPLY}</textarea>
	</div>
</form>	
		<input type="button" value="수정" id="QnAmodBtn"/>
		<input type="button" value="취소" id="QnAbackBtn"/>
		</div>
			</div>	
	 </div>
	 
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
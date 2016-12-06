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
<script type="text/javascript" src="resources/script/nice-select/jquery.nice-select.js"></script>
<script type="text/javascript" src ="resources/script/jquery/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/QnApage.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/nice-select/nice-select.css"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#Category").niceSelect();
	
	$("#QnAinsBtn").on("click", function(){
		var CusActionForm2 = $("#CusActionForm2");
		
		
		CusActionForm2.ajaxForm(QnAadd);
		
		CusActionForm2.submit();
	});
	$("#QnACanBtn").on("click", function(){
		history.go(-1)();
	});
	
	
});
function QnAadd(data, result){
	if(result == "success"){
		var resData = eval("(" + removePre(data) + ")");
		
		$("#textFile").val(resData.fileName[0]);
		
		var params = $("#CusActionForm2").serialize();
		
		$.ajax({
			type : "post",
			url  : "QnAinsert",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res == "true"){
					location.href = "CusBoard";
				} else{
					alert("저장 실패 !");
				}
			
			},
				error : function(result){
					alert("ERROR");
		}	
		});	
	} else {
		alert("저장 실패!");
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
				쿠폰 / 사니파니머니
				</div>
				<div class="bar1_5">
				회원 서비스
				</div>
				
			</div>
				
		<div class="content2"> 		 
			<div class="bar2">
				QNA 작성ㅋ
			</div>
				<div class="qnabar">
				<form action="fileUploadAjax" id="CusActionForm2" method="post" enctype="multipart/form-data">
					<div class="category"> 
					
				 
						<select class="small" name="Category" id="Category">
							<option value="1" selected="selected">환불 /거래 취소</option><!-- 처음에 선택되는값  -->
							<option value="2" >주문/결제</option>
							<option value="3" >쿠폰/사니파니머니</option>
							<option value="4" >회원서비스</option>
						</select>
					</div>	
					
					<div class="title">
						제목
						<input type="text" name="QnATitle" >
					</div>
					<div class="title" >
						내용
					</div> 
					<div class="Writecontent">
						
						<textarea cols="70" rows="20" style="resize:none;" name="QnABoardContent">
						</textarea>	
						
					</div>
					</form>
					
					
					
				</div>
			<div class="Writebar">
			<input type="button" id="QnAinsBtn" value="작성">
			<input type="button" id="QnACanBtn" value="취소">
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
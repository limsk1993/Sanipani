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
 table{
 	width : 800px;
 	margin-left: 20px;
 }
 td{
 	vertical-align: top;

 }
 .TradeContent{
 	width: 100%;
 	height: 100%;
 	overflow : auto;
 	background-color: #FFFFFF;
 }
 .tradeTable{
	vertical-align :top;
	display : inline-block;
	padding : 20px;
	width: 850px;
	height: 90%;
	background-color: #F1232F;
	

}
.tradeCategory{
	display : inline-block;
	width: 200px;
	height: 90%;
	background-color: #123FAC;
}
img{
	width: 100px;
 	height: 100px;
}
</style><script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "TradeBoard");
		$("#actionForm").submit();
	});
	$("#fileDelBtn").on("click",function(){
		$("#showFile").empty();
		$("#testFile").val("");
		
	});
	$("#fileDelBtn1").on("click",function(){
		$("#showFile1").empty();
		$("#testFile1").val("");
		
	});
	$("#fileDelBtn2").on("click",function(){
		$("#showFile2").empty();
		$("#testFile2").val("");
		
	});
	$("#fileDelBtn3").on("click",function(){
		$("#showFile3").empty();
		$("#testFile3").val("");
		
	});
	$("#fileDelBtn4").on("click",function(){
		$("#showFile4").empty();
		$("#testFile4").val("");
		
	});
	
	$("#backBtn").on("click", function(){
		$("#actionForm").attr("action", "test5");
		$("#actionForm").submit();
	});
	$("#saveBtn").on("click", function(){

		
		var insertForm = $("#insertForm");
		
		insertForm.ajaxForm(uploadResultCallBack); // insertForm을 ajaxForm형태로 바꾸겠다. uploadResultCallBack은 ajax를 호출하고나서 이 함수를 호출하겠다.
		insertForm.submit();
		
		
		
		
		
	});
});

function uploadResultCallBack(data, result){ //data:json(아까param가지고 조랄한거.) result : success와 faile ajax결과
	if(result =="success"){
		
		var resData = eval("(" + removePre(data) + ")");  // eval는 자바스크립트의 bean으로 바꿔주는것.
		
			$("#testFile").val(resData.fileName[0]); // 이거아까20자리 맥인거 그거가져오는듯
			$("#testFile1").val(resData.fileName[1]);
			$("#testFile2").val(resData.fileName[2]);
			$("#testFile3").val(resData.fileName[3]);
			$("#testFile4").val(resData.fileName[4]);
			
		
		
		var params = $("#insertForm").serialize();
		
		$.ajax({
			type : "post",
			url : "updateTrade", // TestController에서 마들기
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res == "true"){
					$("#actionForm").attr("action", "TradeBoardLook");
					$("#actionForm").submit();
				} else{
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
	
}


function removePre(data){
	if(data.indexOf("<pre>") > -1){ // data의 indexOf(위치찾기) -1은없는경우고  -1보다 크다는건 있다는얘기
		var st = data.indexOf(">");  //  범위 지정하구있음  pre빼고 짜르겠다는 얘기.
		var ed = data.indexOf("<", st); // 
		
		return data.substring(st + 1, ed); // 값을 되돌려줌 짜른 값 pre를 되도렬줌 <>짜르고.
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
		
		<div class="content" >
		<div class="tradeCategory">
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
		
		<div class="tradeTable">
		<form action="#" id="actionForm" method="post">
			<input type="hidden" name="page" value="${param.page }"/>
			<input type="hidden" name="searchText" value="${param.searchText}"/>
				<input type="hidden" name="testNo" value="${param.testNo}"/>
		</form>	
		
			<h2>거래게시판 수정</h2>
			<form action="fileUploadAjax" id="insertForm" method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td width="20%">물품명 </td>
					<td width="80%"> <input type="text" name="TradeProductName" value="${con.TRADE_BOARD}"></</td>
				</tr>
				
				<tr>
					<td>제목 </td>
					<td><input type="text"  name="TradeTitle" value="${con.WORD_TITLE}"> </td>
				</tr>
				
				<tr>
					<td>닉네임</td>
					<td>${sNick}<input type="hidden"  name="TradeName" value="${sNick}">
						<input type="hidden"  name="TradeMemberNo" value="${sNo}">
						<input type="hidden"  name="TradeCategoryNo" value=1>
						<input type="hidden"  name="TradeCategoryName" value="가정제품">					
					 													</td>
				</tr>
				
				<tr>
					<td>거래 가격: </td>
					<td> <input type="text" name="TradePrice" value="${con.BUY_PAY}"></td>
				</tr>
				
				<tr height="500px">
					<td>내용 </td>
					<td><textarea name="TradeContent" >${con.WORD_CONTENTS}</textarea></td>
				</tr>
				
				
				
				<tr>
				
					<td>물품 사진 등록:</td>
					<td>
			
					
					<div class="showFile">					
					<input type="file" name="att1"> 
					<input type="text" name="testFile" id="testFile" value="${con.PICTURENAME}"/>
					<input type="button" value="파일삭제" id="fileDelBtn"/>
					</div>
					<Br/>
					
					<div class="showFile1">
					<input type="file" name="att2"> 
					<input type="text" name="testFile1" id="testFile1" value="${con.PICTURENAME1}"/>
					<input type="button" value="파일삭제" id="fileDelBtn1"/>
					</div>
					<Br/>
					
					<div class="showFile2">
					<input type="file" name="att3"> 
					<input type="text" name="testFile2" id="testFile2" value="${con.PICTURENAME2}"/>
					<input type="button" value="파일삭제" id="fileDelBtn2"/>
					</div>
					<Br/>
					
					<div class="showFile3">
					<input type="file" name="att4"> 
					<input type="text" name="testFile3" id="testFile3" value="${con.PICTURENAME3}"/>
					<input type="button" value="파일삭제" id="fileDelBtn3"/>
					</div>
					<Br/>
					
					<div class="showFile4">
					<input type="file" name="att5"> 
					<input type="text" name="testFile4" id="testFile4" value="${con.PICTURENAME4}"/>
					<input type="button" value="파일삭제" id="fileDelBtn4"/>
					</div>
					
				
					</td>
					
				</tr>
			
			</table>
			<input type="hidden" name="testNo" value="${param.testNo}"/>
			</form>
			<input type="button" value="저장" id="saveBtn"/>
			</div>
			
		</div>
	
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
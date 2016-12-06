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
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#listBtn").on("click", function(){
		$("#actionForm").attr("action", "TradeBoard");
		$("#actionForm").submit();
	});
	
	
	
	$("#saveBtn").on("click", function(){
		var insertForm = $("#insertForm");
		
		insertForm.ajaxForm(uploadResultCallBack); // insertForm을 ajaxForm형태로 바꾸겠다. uploadResultCallBack은 ajax를 호출하고나서 이 함수를 호출하겠다.
		insertForm.submit();		
		$("#saveBtn").hide();
	});
});

function uploadResultCallBack(data, result){ //data:json(아까param가지고 조랄한거.) result : success와 faile ajax결과
	if(result =="success"){
		var resData = eval("(" + removePre(data) + ")");  // eval는 자바스크립트의 bean으로 바꿔주는것.
		
		$("#textFile").val(resData.fileName[0]); // 이거아까20자리 맥인거 그거가져오는듯
		$("#textFile1").val(resData.fileName[1]);
		$("#textFile2").val(resData.fileName[2]);
		$("#textFile3").val(resData.fileName[3]);
		$("#textFile4").val(resData.fileName[4]);
		var params = $("#insertReport").serialize();
		
		$.ajax({
			type : "post",
			url : "insertTrade", // TestController에서 마들기
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res == "true"){
					location.href = "TradeBoard";
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
		</form>	
		
			<h2>거래게시판 글쓰기</h2>
			<form action="fileUploadAjax" id="insertForm" method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td width="20%">물품명 </td>
					<td width="80%"> <input type="text" name="TradeProductName"></</td>
				</tr>
				
				<tr>
					<td>제목 </td>
					<td><input type="text"  name="TradeTitle"> </td>
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
					<td> <input type="text" name="TradePrice"></td>
				</tr>
				
				<tr height="500px">
					<td>내용 </td>
					<td><textarea name="TradeContent" cols="90" rows="40" style="resize: none;"></textarea></td>
				</tr>
				
				
				
				<tr>
					<td>물품 사진 등록:</td>
					<td><input type="file" name="att1"> 
					<input type="text" name="textFile" id="textFile"/>
					<input type="file" name="att2"> 
					<input type="text" name="textFile1" id="textFile1"/>
					<input type="file" name="att3"> 
					<input type="text" name="textFile2" id="textFile2"/>
					<input type="file" name="att4"> 
					<input type="text" name="textFile3" id="textFile3"/>
					<input type="file" name="att5"> 
					<input type="text" name="textFile4" id="textFile4"/>
					
					</td>
					
				</tr>
			</table>
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
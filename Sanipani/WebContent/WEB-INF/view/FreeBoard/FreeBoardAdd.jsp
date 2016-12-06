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
<link rel="stylesheet" type="text/css" href="resources/css/freeBoard/FreeBoard.css"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#AddFreeBoardBtn").on("click",function(){
		var insertForm = $("#AddFreeForm");
		
		insertForm.ajaxForm(FreeBoardAdd); // insertForm을 ajaxForm형태로 바꾸겠다. uploadResultCallBack은 ajax를 호출하고나서 이 함수를 호출하겠다.
		insertForm.submit();
	});
	$("#CancelBtn").on("click",function(){
		history.go(-1)();
	});
});

function FreeBoardAdd(data, result){
	if(result =="success"){
		var resData = eval("(" + removePre(data) + ")");  // eval는 자바스크립트의 bean으로 바꿔주는것.
		
		$("#textFile").val(resData.fileName[0]); // 이거아까20자리 맥인거 그거가져오는듯
		
		var params = $("#AddFreeForm").serialize();
		
		$.ajax({
			type : "post",
			url : "InsertFreeBoard", // TestController에서 마들기
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res == "true"){
					location.href = "FreeBoard";
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
		
		<div class="content">
			<div>
				<div class="freeboardword_1">
					자유게시판글쓰기
				</div>
			</div>
				<form action="fileUploadAjax" id="AddFreeForm" method="post" enctype="multipart/form-data">
					<div>
						<div class="freeboardword_2">
							제목:<input type="text" name="FreeBoardTitle">
							 <input type="hidden" name="sId" value="${sId}"> 
						</div>
					</div>
					<div class="freeboardword_2">내용
					</div>
					<div class="freeboardword_3">
						<textarea cols="94" rows="33" style="resize: none;" name="FreeBoardContent"></textarea>
					</div>
	<!-- 				<div class="freeboardword_4">
						첨부파일:<input type="file" name="att1">
						<input type="hidden" name="textFile" id="textFile"/>
					</div> -->
				</form>
			<div class="freeboardword_6">
				<input type="button" value="등록" id="AddFreeBoardBtn"/>
			</div>
			<div class="freeboardword_7">
				<input type="button" value="취소" id="CancelBtn"/>
			</div>
		</div>
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="page" value="${param.page }"/>
	<input type="hidden" name="searchText" value="${param.searchText}"/>
</form>	

<!-- <form action="fileUploadAjax" id="insertForm" method="post" enctype="multipart/form-data">다수의 파일이 한개로 되면 multipart data라고함.
	내용 <input type="text" name="textCon"/>위에서 ajaxForm으로 해줘서 action값을 지정해줘야됨. 
	<br />
	파일<input type="file" name="att1"/>
	<input type="hidden" name="textFile" id="textFile"/>
</form>
<input type="button" value="저장" id="saveBtn"/> -->

</body>
</html>
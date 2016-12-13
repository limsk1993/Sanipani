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
<link rel="stylesheet" type="text/css" href="resources/css/spMypage/MyPage.css"/>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#myPageMain").on("click",function(){
		$("#actionForm").attr("action", "MyPage"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	});
	
	$("#change").on("click",function(){
		var insertForm = $("#AddFreeForm");
		
		insertForm.ajaxForm(ChangeInfo); // insertForm을 ajaxForm형태로 바꾸겠다. uploadResultCallBack은 ajax를 호출하고나서 이 함수를 호출하겠다.
		insertForm.submit();
	});
	
	$("#MemberBye").on("click",function(){
		$("#actionForm").attr("action", "MyPage6"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	});
	
	$("#passChange").on("click",function(){
		$("#actionForm").attr("action", "MyPage3"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	});
	
	
	
});

function ChangeInfo(data, result){
	if(result =="success"){
		var resData = eval("(" + removePre(data) + ")");  // eval는 자바스크립트의 bean으로 바꿔주는것.
		
		 $("#textFile").val(resData.fileName[0]);  // 이거아까20자리 맥인거 그거가져오는듯
		
		var params = $("#AddFreeForm").serialize();
		
		$.ajax({
			type : "post",
			url : "updateUserInfo", // TestController에서 마들기
			dataType : "json",
			data : params,
			success : function(result){
				$("#actionForm").attr("action", "MyPage"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
				$("#actionForm").submit();
					
				
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
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="sNo" value="${sNo}"/>
</form>
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
		
		<div class="content10">
				<div class="menu">
				<br/>
				<h2 align="center">마이페이지</h2>
					<div class="menu2">
					<br/>
						<div class="mypageBtn" id="myPageMain"><h3 align="center">내 정보조회</h3></div>
						<br/>
						<div class="updateBtn" id="myPageFix"><h3 align="center">내 정보수정</h3></div>
						<br/>
						<div class="pwBtn" id="passChange"><h3 align="center">비밀번호 수정</h3></div>
						<br/>
						<div class="pointBtn"><h3 align="center">포인트결제</h3></div>
						<br/>
						<div class="basketBtn"><h3 align="center">장비구니</h3></div>
						<br/>
						<div class="memoutBtn" id="MemberBye"><h3 align="center">회원탈퇴</h3></div>
						
					</div>	
			</div>
				
				<div class="content1_1" >
					<div class="content1_2">
						<div>
							<h3>
							핸드폰번호변경
							</h3>
								<div>
								<form action="fileUploadAjax" id="AddFreeForm" method="post" enctype="multipart/form-data">
									<input type="text" style="width: 300px; height:20px; font-size:20px" name="Phone" value="${con.PHONE }"/>
								</div>
						</div>
						<div>
							<br/>
							<h3>
							주소변경
							</h3>
								<div>
									<input type="text" style="width: 300px; height:20px; font-size:20px" name="Address" value="${con.ADDR }" />
								</div>
						</div>
						<div>
							<br/>
							<h3>
							이메일변경
							</h3>
								<div>
									<input type="text" style="width: 300px; height:20px; font-size:20px" name="Email1" value="${con.EMAIL1 }"/>
								</div>
							<input type="hidden" name="sNo" value="${sNo}"/>
							</form>
							
						</div>
						<div>
							<br/>
							<input type="button" value="변경완료" id="change"/>
						</div>
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
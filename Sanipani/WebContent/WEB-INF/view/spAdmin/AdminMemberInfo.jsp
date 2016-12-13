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
<link rel="stylesheet" type="text/css" href="resources/css/spAdmin/spAdmin.css"/>

<script type="text/javascript">
$(document).ready(function(){

	
	$("#updateBtn").on("click", function(){
		MemberGradeNum();
	});
	
	$("#CancelBtn").on("click",function(){
		history.go(-1)();	
	});
	
	
	function MemberGradeNum(){
		var params = $("#actionForm2").serialize();
		
		$.ajax({
			type : "post",
			url : "MemberGradeNum", 
			dataType : "json",
			data : params,
			success : function(result){
				$("#actionForm").attr("action", "AdminMember");  
				$("#actionForm").submit();
			},
			error : function(result){
				alert("error!!");
			}
		});
	}
	
});
</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<c:choose>
		<c:when test="${empty param.page}"> <!-- empty 는 비어있으면. -->
			<input type="hidden" name="page" value="1" />
		</c:when>
		<c:otherwise>
			<input type="hidden" name="page" value="${param.page}"/>
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="page" value="1" />
	<input type="hidden" name="SearchContent" value="${param.SearchContent}"/>
	<input type="hidden" name="testNo" />
	<input type="hidden" name="search2" />
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
		
		<div class="content">
			<div class="AdminMember_1">
			 고객정보관리
			</div>
			<div class="AdminMemberInfo_1">
				<div class="AdminMemberInfo_3">
						<div class="AdminMemberInfo_2">회원번호:${con.MEMBERNO }</div>
						<div class="AdminMemberInfo_2">이름:${con.NAME }</div>
						<div class="AdminMemberInfo_2">아이디:${con.ID }</div>
						<div class="AdminMemberInfo_2">닉네임:${con.NICK }</div>
						<div class="AdminMemberInfo_2">전화번호:${con.PHONE }</div>
						<div class="AdminMemberInfo_2">이메일:${con.EMAIL1 }</div>
				<form action="#" id="actionForm2" method="post">
					<input type="hidden" name="testNo" value="${param.testNo}"/>
						<div class="AdminMemberInfo_2">회원등급<input type="text" name="MemberGradeNum" value="${con.GRADE_NO }"/></div>
				</form>
						<div class="AdminMemberInfo_2">
						<input type="button" value="수정" id="updateBtn"/>
						<input type="button" value="취소" id="CancelBtn"/>
						</div>
				</div>
				<div class="AdminMemberInfo_3">
					<div class="AdminMemberInfo_4">
					등급별 정보
					</div>
					<div class="AdminMemberInfo_4">
					0:운영자
					</div>
					<div class="AdminMemberInfo_4">
					1:일반
					</div>
					<div class="AdminMemberInfo_4">
					2:프리미엄
					</div>
					<div class="AdminMemberInfo_4">
					3:VIP
					</div>
					<div class="AdminMemberInfo_4">
					4:VVIP
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
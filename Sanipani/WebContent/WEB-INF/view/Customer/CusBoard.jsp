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
<link rel="stylesheet" type="text/css" href="resources/css/spmain/QnApage.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>
<script type="text/javascript">
$(document).ready(function(){
	refreshCusBoard();
	
	/* $("#searchBtn").on("click",function(){
		$("input[name='searchText']").val($("#searchText").val()); //searchText의 value에 serchTextval의 값을 넣는다.
		$("input[name='page']").val("1");
		
		refreshCusBoard();
	}); */
	
	$("#pagingArea").on("click", "span", function(){
		$("input[name='page']").val($(this).attr("name"));
		
		refreshCusBoard();
	});
$(".bar").on("click", function(){
	location.href="CusBoard";
});
$(".bar1_1").on("click", function(){
	location.href="CusBoard";
});
$(".bar1_2").on("click", function(){
	location.href="CusRefund";
});
$(".bar1_3").on("click", function(){
	location.href="Cuscall";
});
$(".bar1_4").on("click", function(){
	location.href="CusCoupon";
});
$(".bar1_5").on("click", function(){
	location.href="CusService";
});
$(".bar2").on("click", function(){
	location.href="QnABoard";
});
$(".barQ").on("click", function(){
	location.href="QnAlist";
});

$(".barBtn").on("click", function(){
	location.href="QnAWriten";
});

$("#tb").on("click", "tr", function(){
	$("input[name='testNo']").val($(this).attr("name"));
	$("#actionForm").attr("action", "CusBoardetail");
	$("#actionForm").submit();
	
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "Cuslookup",
		dataType : "json",
		data : params,
		success : function(result){
			
		},
		error : function(result){
			alert("실패");
		}
	});
});

$("#tb2").on("click", "tr", function(){
	$("input[name='testNo2']").val($(this).attr("name"));
	$("#actionForm2").attr("action", "QnABoardetail");
	$("#actionForm2").submit();
	
	var params = $("#actionForm2").serialize();
	
	$.ajax({
		type : "post",
		url : "QnAlookup",
		dataType : "json",
		data : params,
		success : function(result){
			
		},
		error : function(result){
			alert("실패");
		}
	});
});
/* 	$("#tb").on("click", "tr", function(){
		$("input[name='testNo']").val($(this).attr("name"));
		$("#actionForm").attr("action", "test6"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	}); */
});
	function refreshCusBoard(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "refreshCusBoard", 
			dataType : "json",
			data : params,
			success : function(result){
				var html = "";
				
				for(var i = 0 ; i < result.list.length ; i++){
					html += "<tr name='" + result.list[i].CUSTOMER_NO + "'>";
					html += "<td>" + result.list[i].CUSTOMER_NO + "</td>";
					html += "<td>" + result.list[i].CUSTOMER_WORDTITLE + "</td>";
					html += "<td>" + result.list[i].CUSTOMER_WORDCONTENT + "</td>";
					html += "<td>" + result.list[i].CUSTOMER_WRITER + "</td>";
					html += "<td>" + result.list[i].CUSTOMER_WRITERDATE + "</td>";
					html += "<td>" + result.list[i].CUSTOMER_LOOKUP + "</td>";
					html += "</tr>";
				}
				
				$("#tb").html(html);

				
			html = "";
			html += "<span name='1'>처음</span>";
			
	/* 		if($("input[name='page']").val() == 1){
				html += "<span name='1'>이전</span>";
			} else{
				html += "<span name='" + ($("input[name='page']").val - 1) + "'>이전</span>";
			} */
			if($("input[name='page']").val() == 1) {
	            html += "<span name='1'>이전</span>";
	         } else {
	            html += "<span name = '" + ($("input[name='page']").val() - 1) + "'>이전</span>";
	         }
			
			for(var i = result.pb.startPcount ; i <= result.pb.endPcount ; i++){
				if(i == $("input[name='page']").val()){
					html += "<span name='" + i + "'><b>" + i + "</b></span>";
				} else{
					html += "<span name='" + i + "'>" + i + "</b></span>";
				}
			}
			
			if($("input[name='page']").val() == result.pb.maxPcount){
				html += "<span name='" + result.pb.maxPcount + "'>다음</span>";
			} else{
				html += "<span name='" + ($("input[name='page']").val() * 1 + 1) + "'>다음</span>";
			}
			
			
			html += "<span name='" + result.pb.maxPcount+"'>마지막</span>";
			
			$("#pagingArea").html(html);
				
			},
			error : function(result){
				alert("error!!");
			}
		});
	}
		

$(document).ready(function(){
	refreshQnaBoard();
	
	/* $("#searchBtn").on("click",function(){
		$("input[name='searchText']").val($("#searchText").val()); //searchText의 value에 serchTextval의 값을 넣는다.
		$("input[name='page']").val("1");
		
		refreshCusBoard();
	}); */
	
	$("#pagingArea2").on("click", "span", function(){
		$("input[name='page']").val($(this).attr("name"));
		
		refreshQnaBoard();
	});
	
/* 	$("#tb2").on("click", "tr", function(){
		$("input[name='testNo']").val($(this).attr("name"));
		$("#actionForm").attr("action", "test6"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	}); */
});
	function refreshQnaBoard(){
		var params = $("#actionForm2").serialize();
		
		$.ajax({
			type : "post",
			url : "refreshQnaBoard", 
			dataType : "json",
			data : params,
			success : function(result){
				var html = "";
				
				for(var i = 0 ; i < result.list2.length ; i++){
					html += "<tr name='" + result.list2[i].QNA_WORDNUMBER + "'>";
					html += "<td>" + result.list2[i].QNA_WORDNUMBER + "</td>";
					html += "<td>" + result.list2[i].QNA_TITLE + "</td>";
					html += "<td>" + result.list2[i].QNA_CONTENT + "</td>";
					html += "<td>" + result.list2[i].QNA_WRITER + "</td>";
					html += "<td>" + result.list2[i].QNA_WRITEDATE + "</td>";
					html += "<td>" + result.list2[i].QNA_LOOKUP + "</td>";
					html += "</tr>";
				}
				
				$("#tb2").html(html);

				
			html = "";
			html += "<span name='1'>처음</span>";
			
	/* 		if($("input[name='page2']").val() == 1){
				html += "<span name='1'>이전</span>";
			} else{
				html += "<span name='" + ($("input[name='page2']").val - 1) + "'>이전</span>";
			} */
			if($("input[name='page']").val() == 1) {
	            html += "<span name='1'>이전</span>";
	         } else {
	            html += "<span name = '" + ($("input[name='page']").val() - 1) + "'>이전</span>";
	         }
			
			for(var i = result.pb2.startPcount ; i <= result.pb2.endPcount ; i++){
				if(i == $("input[name='page']").val()){
					html += "<span name='" + i + "'><b>" + i + "</b></span>";
				} else{
					html += "<span name='" + i + "'>" + i + "</b></span>";
				}
			}
			
			if($("input[name='page']").val() == result.pb2.maxPcount){
				html += "<span name='" + result.pb2.maxPcount + "'>다음</span>";
			} else{
				html += "<span name='" + ($("input[name='page']").val() * 1 + 1) + "'>다음</span>";
			}
			
			
			html += "<span name='" + result.pb2.maxPcount+"'>마지막</span>";
			
			$("#pagingArea2").html(html);
				
			},
			error : function(result){
				alert("error!!");
			}
		});
	}
	


</script>
</head>
<body>
<div class="main">
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

			<div class="bar">
			<b>고객센터</b>
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
				자주 묻는 질문
				
			</div>	
				<div class="bar2_1">
				<form action="#" id="actionForm2" method="get">
	<c:choose>
		<c:when test="${empty param.page}"> <!-- empty 는 비어있으면. -->
			<input type="hidden" name="page" value="1" />
		</c:when>
		<c:otherwise>
			<input type="hidden" name="page" value="${param.page}"/>
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="page" value="1" />
	<input type="hidden" name="searchText" value="${param.searchText}"/>
	<input type="hidden" name="testNo2" />
</form>
	 <table >
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody id="tb2">
		</tbody>					  
			  </table>

				</div>
	<c:choose>
		<c:when test="${sGrade eq 0 }">			
			<div class="barBtn">
			  <!-- 글쓰기 버튼 -->
			 <!-- <input type="button" value="글쓰기" id="writeBtn"/> -->
			 글쓰기 버튼
			</div>
		</c:when>
			<c:otherwise>
				<div class="barBtn" style="display:none">
				</div>
			</c:otherwise>
			
	</c:choose>
						
			<div class="barQ">		
			내 문의 내역
			</div>
			<div class="barQ_1">
			<form action="#" id="actionForm" method="get">
	<c:choose>
		<c:when test="${empty param.page}"> <!-- empty 는 비어있으면. -->
			<input type="hidden" name="page" value="1" />
		</c:when>
		<c:otherwise>
			<input type="hidden" name="page" value="${param.page}"/>
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="page" value="1" />
	<input type="hidden" name="searchText" value="${param.searchText}"/>
	<input type="hidden" name="testNo" />
</form>
	 <table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody id="tb">
		</tbody>					  
			  </table>
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
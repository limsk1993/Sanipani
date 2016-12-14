<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/nice-select/jquery.nice-select.js"></script>
<script type="text/javascript" src="resources/script/spmain/Mainpage.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/freeBoard/FreeBoard.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/nice-select/nice-select.css"/>
<style type="text/css">
table img{
	width : 100px;
	height: 100px;
}
td{
	text-overflow: ellipsis;
	height: 50px;
}
table{
	text-overflow: ellipsis;
	width:900px;
	border-bottom: 1px;
}
select{
	margin-left: 820px;
}

th {
	background-color: #6DD66D;
}
tr:hover{
	background-color: #EEEEEE;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#searchSelect").niceSelect();
	$("#searchSelect2").niceSelect();
	refreshFreeBoard();
	console.log($("#Id").val());
	$("#FreeBoardAdd").on("click",function(){
		
		if($("input[name='idCheck']").val()==""){
			alert("로그인 하세요");
			$("#Id").focus();
		}
		else{
		$("#actionForm").attr("action", "FreeBoardAdd");  
		$("#actionForm").submit();
		}
	});
	
	$("#pagingArea").on("click", "span", function(){
		$("input[name='page']").val($(this).attr("name"));
		refreshFreeBoard();
	});
	$("#tb").on("click", "tr", function(){
		$("input[name='testNo']").val($(this).attr("name"));
		$("#actionForm").attr("action", "FreeBoardDetail"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
		FreeBoardLookUp();
/* 		FreeBoardLookUp(); */
	});
	$("#SearchBoard").on("click", function(){
		$("input[name='SearchContent']").val($("#SearchContent").val()); //searchText의 value에 serchTextval의 값을 넣는다.
		$("input[name='page']").val("1");
		$("input[name='search']").val($("select[name='search']").val());
		$("#list").submit();
		refreshFreeBoard();
	});
	$("#searchSelect2").on("change",function(){
		$("input[name='search2']").val($("select[name='search2']").val());
		$("input[name='page']").val("1");
		$("#list2").submit();
		refreshFreeBoard();
	});
	
	function FreeBoardLookUp(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "FreeBoardLookUp", 
			dataType : "json",
			data : params,
			success : function(result){
			
			},
			error : function(result){
				alert("error!!");
			}
		});
	}
	

	
	function refreshFreeBoard(){
		
		var params = $("#actionForm").serialize();
		$.ajax({
			type : "post",
			url : "refreshFreeBoard", 
			dataType : "json",
			data : params,
			success : function(result){
				var html = "";
				
				
				for(var i = 0 ; i < result.list.length ; i++){
					html += "<tr name='" + result.list[i].FREE_NUM + "'>";
					html += "<td height='35' align='center'>" + result.list[i].FREE_NUM + "</td>";
					html += "<td>" + result.list[i].FREE_TITLE + "</td>";
					html += "<td align='center'>" + result.list[i].MEM_NO + "</td>";
					html += "<td align='center'>" + result.list[i].FREE_DATE + "</td>";
					html += "<td align='center'>" + result.list[i].FREE_LOOKUP + "</td>";
					
					/* html += "<td>" + result.list[i].FREE_PICTURE + "</td>"; */
					html += "</tr>";
				}
				
				$("#tb").html(html);
				
				html = "";
				html += "<span name='1'>처음&nbsp</span>";
				
		/* 		if($("input[name='page']").val() == 1){
					html += "<span name='1'>이전</span>";
				} else{
					html += "<span name='" + ($("input[name='page']").val - 1) + "'>이전</span>";
				} */
				if($("input[name='page']").val() == 1) {
		            html += "<span name='1'>이전&nbsp</span>";
		         } else {
		            html += "<span name = '" + ($("input[name='page']").val() - 1) + "'>이전&nbsp</span>";
		         }
				
				for(var i = result.pb.startPcount ; i <= result.pb.endPcount ; i++){
					if(i == $("input[name='page']").val()){
						html += "<span name='" + i + "'><b>" + i + "&nbsp</b></span>";
					} else{
						html += "<span name='" + i + "'>" + i + "&nbsp</b></span>";
					}
				}
				
				if($("input[name='page']").val() == result.pb.maxPcount){
					html += "<span name='" + result.pb.maxPcount + "'>다음&nbsp</span>";
				} else{
					html += "<span name='" + ($("input[name='page']").val() * 1 + 1) + "'>다음&nbsp</span>";
				}
				
				
				html += "<span name='" + result.pb.maxPcount+"'>마지막</span>";
				
				$("#pagingArea").html(html);
				
				
	
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
	<input type="hidden" name="SearchContent" value="${param.SearchContent}"/>
	<input type="hidden" name="testNo" />
	<input type="hidden" name="search" />
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
		<input type="hidden" name="idCheck" value="${sNo}">
			<div class="freetitle">
					<h2>자유게시판</h2>
				<div class="freetitle_2">
					 <form action="#" name="list2" method="post">
						 <select class="small" name="search2" id="searchSelect2">
							<option value="fast" selected="selected">최신순</option>
							<option value="old">늙은순</option>
						</select>
					</form> 
				</div>
			</div>
			<div class="freecontent">
			<table>  <!-- border="1" -->
				<thead>
					<tr>
						<th width='80' height='70' align='center'>글번호</th>
						<th width="540" height="40">제목</th>
						<th width='120' height='40' align='center'>작성자</th>
						<th width='220' height='40'>등록날짜</th>
						<th width='80' height='40' align='center'>조회수</th>
						
					<!-- 	<th>첨부자료</th> -->
					</tr>
				</thead>
				<tbody id="tb">
				</tbody>
			</table>
			</div>
			<div class="freenumber">
				<div class="freenumber_1">
					<div id="pagingArea"></div>
				</div>
				<!-- <div class="freenumber_2">
					<input type="button" value="글쓰기" id="FreeBoardAdd"/>
				</div> -->
			</div>
			<div class="freesearch">
				<div class="freesearch_1">
					<form action="#" name="list" method="post">
						 <select class="small" name="search" id="searchSelect">
							<option value="title" selected="selected">제목</option>
							<option value="content">내용</option>
							<option value="id">작성자</option>
						</select>
					</form>
				</div>
				<div class="freesearch_2">
					<input type="text" style="width: 300px; height:20px; font-size:20px"  id="SearchContent" value="${param.SearchContent}">
					<input type="button" value="검색" id="SearchBoard">
					<input type="button" value="글쓰기" id="FreeBoardAdd"/>
				</div>
<!-- 				<div class="freesearch_3">
					<input type="button" value="검색" id="SearchBoard">
				</div> -->
			</div>
		</div>
	
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>


</body>
</html>
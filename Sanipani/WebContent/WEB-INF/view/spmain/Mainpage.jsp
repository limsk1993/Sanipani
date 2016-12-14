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
	height: 230px;
	margin: 1em;
	font-size: 12px;
	border: 1px solid #000000;
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
	refreshList();
	NoticeList();
	refreshTradeList();
	refreshFreeBoard();
	
	$(".sampleMain").on("click", ".sample", function() {
		$("input[name='auctionNo']").val($(this).attr("name"));
		$("#actionForm").attr("action", "AuctionDetailLook");
		$("#actionForm").submit();
	});
	
	$("#NoticeCon").on("click", "tr", function() {
		$("input[name='NoticeNo']").val($(this).attr("name"));
		console.log($("input[name='NoticeNo']").val());
		$("#NoticeForm").attr("action", "MainNoticeDetailLook");
		$("#NoticeForm").submit();
	});
	
	$("#NoticeWrite").on("click", function() {
		$("#NoticeForm").attr("action", "NoticeWrite");
		$("#NoticeForm").submit();
	});
	
	$("#tradeList").on("click", "tr", function(){
		$("input[name='testNo']").val($(this).attr("name"));
	
		$("#TradeForm").attr("action", "TradeBoardLook"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#TradeForm").submit();
	});
	
	$("#FreeList").on("click", "tr", function(){
		$("input[name='testNo']").val($(this).attr("name"));
		$("#FreeForm").attr("action", "FreeBoardDetail"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#FreeForm").submit();
	});
});

function refreshList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "refreshAuction",
		dataType : "json",
		data : params,
		success : function(result) {
			var html = "";
			
			for(var i = 0 ; i < 5 ; i++) {
				
				html += "<div class='sample' name='" + result.list[i].AUCTIONWORDNO + "'>";
				
				html += "<input type='hidden' name='auctionNo' value='" + result.list[i].AUCTIONWORDNO + "' />";
				
				if(result.list[i].PICTURENAME == null) {
		            html += "<div class='AuctionProductPicture'>등록된 사진이 없습니다</div><br/>";
		        } else {
		            html += "<div class='AuctionProductPicture'><img src=\"resources/upload/" + result.list[i].PICTURENAME + "\"/></div><br/>";
		        }
				
				html +=	"<div class='AuctionProductName'> 물품명 : " + result.list[i].AUCTIONPRODUCTNAME + "</div><br/>";
				
				if(result.list[i].BIDPRICE == null) {
					html +=	"<div class='AuctionNowPrice'>현재 입찰자가 없습니다.</div><br/>";
				} else {
					html +=	"<div class='AuctionNowPrice'> 현재 입찰가 : " + result.list[i].BIDPRICE + "</div><br/>";
				}
				
				html +=	"<div class='AuctionRemainTime'> 남은 시간 : " + result.list[i].REMAINTIME + "</div>";
				
				html += "</div>";
			}
			
			$(".sampleMain").html(html);
			
			html = "";
		},
		error : function(result) {
			alert("error!!");
		}
	});
}

function NoticeList() {
	var params = $("#NoticeForm").serialize();
	
	$.ajax({
		type : "post",
		url : "refreshNotice",
		dataType : "json",
		data : params,
		success : function(result) {
			var html = "";
			
			for(var i = 0 ; i < result.list.length ; i++) {
				html += "<tr name='" + result.list[i].NOTICENO + "'>";
				html +=	"<td>" + result.list[i].NOTICENO + "</td>";
				html +=	"<td>" + result.list[i].NOTICETITLE + "</td>";
				html +=	"<td>" + result.list[i].NICK + "</td>";;
				html +=	"<td>" + result.list[i].NOTICEWRITERDATE + "</td>";
				html += "</tr>";
			}
			
			$("#NoticeCon").html(html);
			
			
			html = "";
		},
		error : function(result) {
			alert("error!!");
		}
	});
}

function refreshTradeList() {
	var params = $("#TradeForm").serialize(); //serialize 정렬해서 보여준다.
	
	$.ajax({//비동기화방식
		type : "post",
		url : "refreshTest1", 
		dataType : "json",
		data : params,
		success : function(result){
			var html = "";
			
			for(var i = 0 ; i < result.list.length ; i++){
				html += "<tr name='" + result.list[i].TRADE_WORD_NO + "'>";
				html += "<td>" + result.list[i].NO + "</td>";
				if(result.list[i].PICTURENAME==null){
				html += "<td></td>";
				}else{
					html += "<td>"+"<img src=\"resources/upload/"+result.list[i].PICTURENAME+"\"/></td>";
				}
				html += "<td>" + result.list[i].TRADE_BOARD + "</td>";
				html += "<td>" + result.list[i].WORD_TITLE + "</td>";
				html += "<td>" + result.list[i].BUY_PAY + "</td>";
				html += "<td></td>";
				html += "<td>" + result.list[i].NICK + "</td>";
				html += "<td>" + result.list[i].WRITER_DATE + "</td>";
				html += "<td>" + result.list[i].LOOKUP + "</td>";
				
				html += "</tr>";
			}
			
			$("#tradeList").html(html);
			
			html = "";
		},
		error : function(result){
			alert("error!!");
		}
	});
}

function refreshFreeBoard(){
	
	var params = $("#FreeForm").serialize();
	$.ajax({
		type : "post",
		url : "refreshFreeBoard", 
		dataType : "json",
		data : params,
		success : function(result){
			var html = "";
			
			
			for(var i = 0 ; i < 5 ; i++){
				html += "<tr name='" + result.list[i].FREE_NUM + "'>";
				html += "<td>" + result.list[i].FREE_NUM + "</td>";
				html += "<td>" + result.list[i].FREE_TITLE + "</td>";
				html += "<td>" + result.list[i].MEM_NO + "</td>";
				html += "<td>" + result.list[i].FREE_DATE + "</td>";
				html += "<td>" + result.list[i].FREE_LOOKUP + "</td>";
				
				/* html += "<td>" + result.list[i].FREE_PICTURE + "</td>"; */
				html += "</tr>";
			}
			
			$("#FreeList").html(html);
			
			html = "";
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
		
	
		
		
		<div class="menubar" height="150px">
			<div class="logo" height="150px">
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
		
		<div class="content">
			<div class="EndApproachAuction">
				<h2>마감 임박 경매</h2>
			</div>
				<form action="#" id="actionForm" method="get">
					<c:choose>
						<c:when test="${empty param.page}">
							<input type="hidden" name="page" value="1" />
						</c:when>
						<c:otherwise>
							<input type="hidden" name="page" value="${param.page}" />
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="searchText" value="${param.searchText}" />
					<input type="hidden" name="auctionNo" />
					<input type="hidden" name="FreeNo" />
				</form>
			<div class="sampleMain">
			</div>
			
 			<div class="NoticeBoard">
				<h2>공지사항</h2>
				<form action="#" id="NoticeForm" method="get">
					<c:choose>
						<c:when test="${empty param.page}">
							<input type="hidden" name="page" value="1" />
						</c:when>
						<c:otherwise>
							<input type="hidden" name="page" value="${param.page}" />
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="searchText" value="${param.searchText}" />
					<input type="hidden" name="NoticeNo" value="" />
				</form>
				<table border="1" background="#FFFFFF">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody id="NoticeCon">
					</tbody>
				</table>
			<br/>
			<input type="button" id="NoticeWrite" value="공지사항 글쓰기" />
			<div class="RecentWordLook">
				<h2>최신 글보기</h2>
				<h3>거래</h3>
				<form action="#" id="TradeForm" method="post">
					<c:choose>
						<c:when test="${empty param.page}"> <!-- empty 는 비어있으면. -->
							<input type="hidden" name="page" value="1" />
						</c:when>
				
						<c:otherwise>
							<input type="hidden" name="page" value="${param.page}"/>
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="catogery" value="1" />
					<input type="hidden" name="page" value="1" />
					<input type="hidden" name="searchText" value="${param.searchText}"/>
					<input type="hidden" name="testNo" />
					<input type="hidden" name="sNo" value="${sNo}"/>
				</form>

				<table border="1">
					<thead>
						<tr>
							<th>No</th>
							<th>물품사진</th>
							<th>물품명</th>
							<th>내용</th>
							<th>가격</th>
							<th>거래상태</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
				
				<tbody id="tradeList">
				
				
				</tbody>
			
				</table>
				<h3>자유</h3>
				<form action="#" id="FreeForm" method="post">
					<c:choose>
						<c:when test="${empty param.page}">
							<input type="hidden" name="page" value="1" />
						</c:when>
						<c:otherwise>
							<input type="hidden" name="page" value="${param.page}" />
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="searchText" value="${param.searchText}" />
					<input type="hidden" name="testNo" />
				</form>
					<table border="1">
					<thead>
						<tr>
							<th>글번호</th>
							<th width="300" height="50">제목</th>
							<th>작성자</th>
							<th>등록날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody id="FreeList">
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
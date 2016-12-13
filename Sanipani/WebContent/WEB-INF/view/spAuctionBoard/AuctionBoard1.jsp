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
.AuctionTable {
	vertical-align :top;
	display : inline-block;
	padding : 20px;
	width: 690px;
	height: 90%;
	background-color: #B2FFD1;
	margin-left: 80px;
}
.AuctionCategory {
	display : inline-block;
	width: 200px;
	height: 90%;
	background-color: #B2FFD1;
}
.auctionBoard{
	bottom : 0px;
  	display: inline-block;
  	width:19%;
  	height: 100px;
  	background-color: #333333;
}
.auctionBoard_1{
   vertical-align : top;
   display: inline-block;
   width:19%;
   height: 425px;
   background-color: #333333;

}
.tradeBoard{
   vertical-align : top;
   display: inline-block;
   width:19%;
   height: 100px;
   background-color: #444444;
}
.tradeBoard_1{
   vertical-align : top;
   display: inline-block;
   width:19%;
   height : 425px;
   background-color: #444444;
}
.reportBoard{
   vertical-align : top;
   display: inline-block;
   width:19%;
   height: 100px;
   background-color: #123111;
}
.customerBoard{
   vertical-align : top;
   display: inline-block;
   width:19%;
   height: 100px;
   background-color: #459811;
}
.freeBoard{
   vertical-align : top;
   display: inline-block;
   width:19%;
   height: 100px;
   background-color: #459991;
}
.menuall{
   vertical-align : top;
   display: inline-block;
   width:78%;
   height: 100%;
   background-color: #FFFFFF;
   margin-left: 5px;
}
.menubar{
   display : block;
   width:100%;
   height : 150px;
   background-color: #FFFFFF;
   padding-top: 10px;
   padding-bottom: 10px;
}
.memberInfo{
   margin-top:20px;
   margin-left:100px;
   width:80%;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	refreshList();
	
	$("#searchBtn").on("click", function() {
		$("input[name='searchText']").val($("#searchText").val());
		$("input[name='page']").val("1");
		
		refreshList();
	});
	
	$("#insertBtn").on("click", function() {
		if($("input[name='sNo']").val() > 0) {
			$("#actionForm").attr("action", "AuctionWrite");
			$("#actionForm").submit();
		} else {
			alert("로그인 후 글을 쓰실 수 있습니다.");
			return false;
		}
	});
	
	$("#pagingArea").on("click", "span", function() {
		$("input[name='page']").val($(this).attr("name"));
		
		refreshList();
	});
	
	$("#tb").on("click", "tr", function() {
		$("input[name='auctionNo']").val($(this).attr("name"));
		$("#actionForm").attr("action", "AuctionDetailLook");
		$("#actionForm").submit();
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
			
			for(var i = 0 ; i < result.list.length ; i++) {
				html += "<tr name='" + result.list[i].AUCTIONWORDNO + "'>";
				html +=	"<td>" + result.list[i].AUCTIONWORDNO + "</td>";
				if(result.list[i].PICTURENAME == null) {
					html += "<td width='100px'><img src=\"resources/images/TradeStatus1/no_image.png\"/></td>";
		        } else {
		            html += "<td>" + "<img src=\"resources/upload/" + result.list[i].PICTURENAME + "\"/></td>";
		        }
				html +=	"<td>" + result.list[i].AUCTIONPRODUCTNAME + "</td>";
				html +=	"<td>" + result.list[i].WORDTITLE + "</td>";
				if(result.list[i].BIDPRICE == null) {
					html +=	"<td>현재 입찰자가 없습니다.</td>";
				} else {
					html +=	"<td>" + result.list[i].BIDPRICE + "</td>";
				}
				html +=	"<td>" + result.list[i].NICK + "</td>";;
				html +=	"<td>" + result.list[i].REALENDDATE + "</td>";
				html += "</tr>";
			}
			
			$("#tb").html(html);
			
			html = "";
			
			html += "<span name='1'>처음</span>";
			
			if($("input[name='page']").val() == 1) {
				html += "<span name='1'>이전</span>";
			} else {
				html += "<span name = '" + ($("input[name='page']").val() - 1) + "'>이전</span>";
			}
			
			for(var i = result.pb.startPcount ; i <= result.pb.endPcount ; i++) {
				if (i == $("input[name='page']").val()) {
					html += "<span name = '" + i + "'><b>" + i + "</b></span>";
				} else {
					html += "<span name = '" + i + "'>" + i + "</span>";
				}
			}
			
			if($("input[name='page']").val() == result.pb.maxPcount) {
				html += "<span name = '" + result.pb.maxPcount + "'>다음</span>";
			} else {
				html += "<span name = '" + ($("input[name='page']").val() * 1 + 1) + "'>다음</span>";
			}
			
			html += "<span name='" + result.pb.maxPcount + "'>마지막</span>";
			
			$("#pagingArea").html(html);
		},
		error : function(result) {
			alert("error!!");
		}
	});
}


</script>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>

</head>
<body>
<div class="main">
<input type="hidden" name="sNo" value="${sNo}" />
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
		<div class="AuctionCategory">
			<div class="AuctionBoardCategory"><img alt="TabImg" src="resources/images/AuctionPageImage/AuctionTab.bmp"></div>
			<div class="home"><img alt="HomeImg" src="resources/images/AuctionPageImage/AuctionHome.bmp"></div>
			<div class="elec"><img alt="elecImg" src="resources/images/AuctionPageImage/AuctionElec.bmp"></div>
			<div class="cloth"><img alt="clothImg" src="resources/images/AuctionPageImage/AuctionCloth.bmp"></div>
			<div class="watch"><img alt="watchImg" src="resources/images/AuctionPageImage/AuctionWatch.bmp"></div>
			<div class="cosmetic"><img alt="cosmeticImg" src="resources/images/AuctionPageImage/AuctionCosmetic.bmp"></div>
			<div class="travel"><img alt="travelImg" src="resources/images/AuctionPageImage/AuctionTravel.bmp"></div>
			<div class="furni"><img alt="furniImg" src="resources/images/AuctionPageImage/AuctionFurni.bmp"></div>
			<div class="book"><img alt="bookImg" src="resources/images/AuctionPageImage/AuctionBook.bmp"></div>
			<div class="etc"><img alt="etcImg" src="resources/images/AuctionPageImage/AuctionEtc.bmp"></div>
		</div>
			<div class="AuctionTable">
			<h2>경매게시판 </h2>
			<form action="#" id="actionForm" method="get">
				<c:choose>
					<c:when test="${empty param.page}">
						<input type="hidden" name="page" value="1" />
					</c:when>
					<c:otherwise>
						<input type="hidden" name="page" value="${param.page}" />
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="catogery" value="2" />
				<input type="hidden" name="searchText" value="${param.searchText}" />
				<input type="hidden" name="auctionNo" />
			</form>
			<table border="1">
				<thead>
					<tr>
						<th>글번호</th>
						<th>물품사진</th>
						<th>물품명</th>
						<th>제목</th>
						<th>현재경매가</th>
						<th>작성자</th>
						<th>마감일</th>
					</tr>
				</thead>
				<tbody id="tb">
				</tbody>
			</table>
			<br/>
			<input type="hidden" name="memberNo" value="${params.MEMBERNO}" />
			<input type="text" id="searchText" value="${param.searchText}" />
			<input type="button" value="검색" id="searchBtn" />
			<input type="button" value="글쓰기" id="insertBtn" />
			<br/>
			<div id="pagingArea"></div>
			</div>
		</div>
	
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
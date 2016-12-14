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
<script type="text/javascript" src="resources/script/spmain/TradeBoard.js"></script>
<style type="text/css">
.tradeTable{
	vertical-align :top;
	display : inline-block;
	padding : 20px;
	width: 830px;
	height: 90%;

}
.tradeCategory{
	display : inline-block;
	width: 220px;
	height: 90%;
	 background-color: #B2FFD1;
	 border-radius: 20px;
	 overflow: hidden;
	 margin-top:20px; 
}
table img{
	width : 100px;
	height: 100px;
}
td{
	text-overflow: ellipsis;
	height: 100px;

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
		<div class="tradeCategory">
			<div class="AuctionBoardCategory"><img alt="TabImg" src="resources/images/AuctionPageImage/TradeTab.bmp"></div>
			<div class="home_1"><img alt="HomeImg" src="resources/images/AuctionPageImage/AuctionHome.bmp"></div>
			<div class="elec_1"><img alt="elecImg" src="resources/images/AuctionPageImage/AuctionElec.bmp"></div>
			<div class="cloth_1"><img alt="clothImg" src="resources/images/AuctionPageImage/AuctionCloth.bmp"></div>
			<div class="watch_1"><img alt="watchImg" src="resources/images/AuctionPageImage/AuctionWatch.bmp"></div>
			<div class="cosmetic_1"><img alt="cosmeticImg" src="resources/images/AuctionPageImage/AuctionCosmetic.bmp"></div>
			<div class="travel_1"><img alt="travelImg" src="resources/images/AuctionPageImage/AuctionTravel.bmp"></div>
			<div class="furni_1"><img alt="furniImg" src="resources/images/AuctionPageImage/AuctionFurni.bmp"></div>
			<div class="book_1"><img alt="bookImg" src="resources/images/AuctionPageImage/AuctionBook.bmp"></div>
			<div class="etc_1"><img alt="etcImg" src="resources/images/AuctionPageImage/AuctionEtc.bmp"></div>
		</div>
		<div class="tradeTable">
		<div class="tradeTag"><h2>거래게시판 </h2></div>
	
		<form action="#" name="list2" method="post">
			    <select class="small" name="search2" id="searchSelect2">
				<option value="1" selected="selected">최신순</option>
				<option value="2">가격순</option>
			</select>
		</form> 
				<form action="#" id="actionForm" method="get">
				<c:choose>
					<c:when test="${empty param.page}"> <!-- empty 는 비어있으면. -->
						<input type="hidden" name="page" value="1" />
					</c:when>
			
					<c:otherwise>
						<input type="hidden" name="page" value="${param.page}"/>
					</c:otherwise>
				</c:choose>
					<input type="hidden" name="search" />
				<input type="hidden" name="catogery" value="9" />
			
				<input type="hidden" name="searchText" value="${param.searchText}"/>
				<input type="hidden" name="testNo" />
				<input type="hidden" name="sNo" value="${sNo}"/>
				<input type="hidden" name="sRank" value="${sGrade}"/>
			</form>
			<form action="#" id="actionForm1" method="get">
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

			<table >
				<thead>
					<tr>
						<th>No</th>
						<th>물품사진</th>
						<th>물품명</th>
						<th>내용</th>
					
						<th>가격</th>
						
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				
				<tbody id="tradeList">
				
				
				</tbody>
			
			</table>
		
			<br/>
			<input type="text" id="searchText" value="${param.searchText}"/>
			<input type="button" value="검색" id="searchBtn"/>
			<input type="button" value="추가" id="tradeBoardAddBtn"/>
			<br/>
			<div id="tradePageNo"></div>
		</div>
	
		
		
		</div>
		
		
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
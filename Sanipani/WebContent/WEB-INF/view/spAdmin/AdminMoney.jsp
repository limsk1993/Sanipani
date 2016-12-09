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

<script type="text/javascript">
$(document).ready(function(){

	
	$("#searchBtn").on("click",function(){
		$("input[name='searchText']").val($("#searchText").val()); //searchText의 value에 serchTextval의 값을 넣는다.
		$("input[name='searchDate']").val($("#searchDate").val());
		$("input[name='searchUseDate']").val($("#searchUseDate").val());
		
		$("input[name='page']").val("1");
		
		refreshList1();
	});
	
	
	
	
	$("#tradePageNo").on("click", "span", function(){
		$("input[name='page']").val($(this).attr("name"));
		
		refreshList1();
	});
	
	
	
	$("#tradeList").on("click", ".moneyRefund", function(){
	
		      if(confirm("환불하겠습니까?")){
		         $("input[name='moneyNo']").val($(this).attr("name"));
		      
		         var ar= $("input[name='moneyNo']").val();
		         
		         var arr = ar.split("_");
		       
		         $("input[name='moneyNo']").val(arr[0]);
		         $("input[name='UserNo']").val(arr[3]);
		         alert($("input[name='UserNo']").val());
				
				  if(arr[1]!=0){
					  $("input[name='moneyRefund']").val(arr[1]);
				
				  }
				  else if(arr[2]!=0){
					  $("input[name='moneyRefund']").val(arr[2]);	
					
				  }
				 
				 
		         var params = $("#moneyForm").serialize();
					
					$.ajax({
						type:"post",
						url:"insertMoneyRefund",
						dataType:"json",
						data : params,
						success : function(result){
						
							alert("완료");
								
						
						},
						error : function(result){
							alert("ERROR");
						}
					});
		      }
		      else{
		         
		      }
		   });
		 
		
	  
});		
		
		
	
function refreshList1(){
	var params = $("#moneyForm").serialize(); //serialize 정렬해서 보여준다.
	
	$.ajax({//비동기화방식
		type : "post",
		url : "getAdminMoney", 
		dataType : "json",
		data : params,
		success : function(result){
			var html = "";
			
			for(var i = 0 ; i < result.list.length ; i++){
				html += "<tr name='" + result.list[i].SA_PA_MO_NO + "'>";
				html += "<td>" + result.list[i].NO + "</td>";
	
				html += "<td>" + result.list[i].ID + "</td>";
				html += "<td>" + result.list[i].CHARGE_PRICE + "</td>";
				html += "<td>" + result.list[i].CHARGE_DATE + "</td>";
				
				html += "<td>" + result.list[i].EXCHANGE_PRICE + "</td>";
				html += "<td>" + result.list[i].EXCHANGE_DATE + "</td>";
				
				html += "<td class='moneyRefund' name='" + result.list[i].SA_PA_MO_NO+"_"+result.list[i].CHARGE_PRICE+"_"+result.list[i].EXCHANGE_PRICE +"_"+result.list[i].MEMBERNO+"'>" + '환불' + "</td>";
				html += "</tr>";
			}
			
			$("#tradeList").html(html);
			
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
		
		$("#tradePageNo").html(html);
			
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
	
		<h2>거래게시판 </h2>
			<form action="#" id="actionForm" method="get">
				<c:choose>
					<c:when test="${empty param.page}"> <!-- empty 는 비어있으면. -->
						<input type="hidden" name="page" value="1" />
					</c:when>
			
					<c:otherwise>
						<input type="hidden" name="page" value="${param.page}"/>
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="catogery" value="1" />
				
				<input type="hidden" name="searchText" value="${param.searchText}"/>
				<input type="hidden" name="testNo" />
				
			</form>
			<form action="#" id="moneyForm" method="post">
			<c:choose>
					<c:when test="${empty param.page}"> <!-- empty 는 비어있으면. -->
						<input type="hidden" name="page" value="1" />
					</c:when>
			
					<c:otherwise>
						<input type="hidden" name="page" value="${param.page}"/>
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="sNo" value="${sNo}"/>
				<input type="hidden" name="searchDate"/>
				<input type="hidden" name="searchUseDate"/>
				<input type="hidden" name="searchText" value=""/>
				<input type="hidden" name="moneyNo" value=""/>
				<input type="hidden" name="moneyRefund" value=""/>
				<input type="hidden" name="UserNo" value=""/>
			</form>

			<table border="1">
				<thead>
					<tr>
						<th>No</th>
						<th>아이디</th>
						<th>충전금액</th>
						<th>충전날짜</th>
					
						<th>사용금액</th>
						<th>사용날짜</th>
						<th>환전</th>
						
					</tr>
				</thead>
				
				<tbody id="tradeList">
				
				
				</tbody>
			
			</table>
		
			<br/>
			<input type="text" id="searchText" value="${param.searchText}" placeholder="아이디 입력"/>
			<input type="text" id="searchDate" value="" placeholder="충전날짜 YY/MM/DD"/>
			<input type="text" id="searchUseDate" value="" placeholder="사용날짜 YY/MM/DD"/>
			
			<input type="button" value="검색" id="searchBtn"/>
			<input type="button" value="추가" id="tradeBoardAddBtn"/>
			<br/>
			<div id="tradePageNo"></div>
		
	
		
		
		</div>
		
		
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
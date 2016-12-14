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
<style type="text/css">
#freeboardContent{
	margin-left : 250px;
}
#freeboardContent_3{
	display: inline-block;
	margin-left : 2%;
	width:768px;
	height:330px;
	background-color: #FCFFFF;
	word-break:break-all;
	overflow-y: auto;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	refreshFreeReple();
	
	
	$("body").on("click", "#pagingArea span", function(){
		$("input[name='page']").val($(this).attr("name"));
	});
	
	
	$("#RepleBtn").on("click",function(){
		
			
		if($("input[name='idCheck1']").val()==""){
			$("#Id").focus();
			alert("로그인해주세요");
		}else{
			var insertForm = $("#AddRepleForm");
			insertForm.ajaxForm(InsertFreeReple); // insertForm을 ajaxForm형태로 바꾸겠다. uploadResultCallBack은 ajax를 호출하고나서 이 함수를 호출하겠다.
			insertForm.submit();
		} 
	});
	
	
	$("#pagingArea").on("click", "span", function(){
		$("input[name='page']").val($(this).attr("name"));
		refreshFreeReple();
	});
	
	
	$("#FreeFixBtn").on("click", function(){
		$("#actionForm").attr("action", "FreeBoardMod"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	});
	

	
	
	$("#tb").on("click", ".RepleDel", function(){
		if(confirm("정말삭제할꺼야?")){
			$("input[name='testNo1']").val($(this).attr("name"));
			console.log($("input[name='testNo1']").val());
			RepleDelete();
			/* $("#actionForm").submit();
			RepleDelete();  */
		}
		else{
			
		}
	});
		

 	$("#DeleteFreeBtn").on("click",function(){
		var deletes = confirm("정말삭제할꺼야?");
			if(deletes){
				DeleteFreeBoard();
			}
			else{
				
			}
	}); 
	
	
	/*  게시판댓글 추가 */
	function InsertFreeReple(data, result){
		if(result =="success"){
			var resData = eval("(" + removePre(data) + ")");  // eval는 자바스크립트의 bean으로 바꿔주는것.
			
			$("#textFile").val(resData.fileName[0]); // 이거아까20자리 맥인거 그거가져오는듯
			
			var params = $("#AddRepleForm").serialize();
			
			$.ajax({
				type : "post",
				url : "InsertFreeReple", // TestController에서 마들기
				dataType : "json",
				data : params,
				success : function(result){
					if(result.res == "true"){
						refreshFreeReple();
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
	
	
	function DeleteFreeBoard(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "DeleteFreeBoard", 
			dataType : "json",
			data : params,
			success : function(result){
				alert("삭제되었씁니다.");
				location.href="FreeBoard";
			},
			error : function(result){
				alert("error!!");
			}
		});
	}
	
	function RepleDelete(){
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "RepleDelete", 
			dataType : "json",
			data : params,
			success : function(result){
				alert("삭제되었습니다");
				refreshFreeReple();
			},
			error : function(result){
				alert("error!!");
			}
		});
	}
	
	
	
	
	function refreshFreeReple(){
		var params = $("#AddRepleForm").serialize();
		
		$.ajax({
			type : "post",
			url : "refreshFreeBoardReple", 
			dataType : "json",
			data : params,
			success : function(result){
				
				var html = "";
			
				for(var i = 0 ; i < result.list.length ; i++){
					html += "<tr>";
					html += "<td>" + result.list[i].MEMBER_NUM + "</td>";
					html += "<td>" + result.list[i].FREE_DATE + "</td>";
					html += "<td>" + result.list[i].FREEBOARD_CONTENT + "</td>";
					if(result.list[i].MEMBER_NUM == "${sId}"){
						html += "<td class='RepleDel' name='" + result.list[i].FREEREPLE_NUM + "' value='result.list[i].RNUM'>" + '삭제' + "</td>";
					}else{
						"<td>" + "</td>"
					}
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
				var inp = document.getElementsByTagName('textarea');
				  for (var i=0;i<inp.length;i++)
				  {
				   inp[i].value ='';
				  }
				$("#pagingArea").html(html);
				
				
	
			},
			error : function(result){
				alert("error!!");
			}
		});
	}
});

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
<form action="#" id="actionForm" method="get">
	<input type="hidden" name="testNo" value="${param.testNo}"/>
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="testNo1" />
</form>

<%-- <form action="#" id="actionForm" method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchText" value="${param.searchText }"/>
	<input type="hidden" name="testNo" value="${param.testNo}"/>
</form> --%>

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
			<div class="freeboardContent">
				<div>
					
						<h2>
						&nbsp&nbsp${con.FREE_TITLE}  
						</h2>
						<h3>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${con.MEM_NO} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${con.FREE_DATE }
						</h3>
						
						
					
				</div>
				<%-- <div>
					<div class="freeboardContent_2">
						<h3>
							${con.FREE_DATE }
						</h3>
					</div>
				</div> --%>
			<%-- 	<div>
					<div class="freeboardContent_2">
					작성일:${con.FREE_DATE }
					</div>
				</div> --%>
				<div>
					<div class="freeboardContent_3" id="freeboardContent_3" >
					${con.FREE_CONTENT }
					</div>
				</div>
					<div>
					
						<c:choose>
							<c:when test="${con.MEM_NO == sId}">
								<input type="button" value="글수정" id="FreeFixBtn">
								<input type="button" value="글삭제" id="DeleteFreeBtn">
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>

					</div>
					
				<div class="freeboardContent_4">
					<form action="fileUploadAjax" id="AddRepleForm" method="post" enctype="multipart/form-data">
									<input type="hidden" name="page" value="${param.page}" />
									<input type="hidden" name="searchText" value="${param.searchText}"/>
									<textarea cols="30" rows="3" style="resize: none;" name="FreeRepleContent" ></textarea>
									<input type="hidden" name="sId" value="${sId}" />
									<input type="button" value="댓글 입력" id="RepleBtn" />
									<input type="hidden" name="testNo" value="${param.testNo}"/>
									
					</form>	
					<table border="1">
						<thead>
							<tr>
								<th>작성자</th>
								<th>등록날짜</th>
								<th>내용</th>
								
							</tr>
						</thead>
						<tbody id="tb">
							
						</tbody>
					</table>
					
				
				</div>
			</div>
			<div id="pagingArea"></div> 
		
		</div>
	</div>
	<div class="right">
		
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="resources/script/spmain/Mainpage.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/spmain/Mainpage.css"/>

<style type="text/css">
 .tradeTable{
	vertical-align :top;
	display : inline-block;
	padding : 20px;
	width: 850px;
	height: 90%;
	background-color: #F1232F;
	

}
.tradeCategory{
	display : inline-block;
	width: 200px;
	height: 90%;
	background-color: #123FAC;
}
</style>

<style type="text/css">
.tradePictureIf{

	width : 100%;
	height : 390px;
	background-color: #F123FF;
}
.tradeContent1{
	width : 100%;
	height : 500px;
	background-color: #000131;
}
.tradeReple{
	width : 100%;
	height : 500px;
	background-color: #F1240F;

}
.tradePicture{
	vertical-align :top;
	display : inline-block;
	width : 40%;
	height : 390px;
	background-color: #FFFFFF;
}
.tradePictureMain{
	
	margin-left : 20px;
	width : 300px;
	height : 300px;
	background-color: #444444;
	
}
.tradePictureMain img{
	

	width : 300px;
	height : 300px;
	background-color: #444444;
	
}
.tradePicture1{
	margin-left : 20px;
	margin-top : 10px;
	display : inline-block;
	width : 70px;
	height : 70px;
	background-color: #444444;
	
}
.tradePicture1 img{
	width : 70px;
	height : 70px;
}
.tradePicture2{
	margin-top : 10px;
	display : inline-block;
	width : 70px;
	height : 70px;
	background-color: #444444;
	
}

.tradePicture2 img{
	width : 70px;
	height : 70px;
}

.tradePicture3{
	margin-top : 10px;
	display : inline-block;
	width : 70px;
	height : 70px;
	background-color: #444444;
	
}
.tradePicture3 img{
	width : 70px;
	height : 70px;
}
.tradePicture4{
	margin-top : 10px;
	display : inline-block;
	width : 70px;
	height : 70px;
	background-color: #444444;
	
}
.tradePicture4 img{
	width : 70px;
	height : 70px;
}

.tradeIf{
	display : inline-block;
	width : 56%;
	height : 390px;
	background-color: #F123FF;
}
	
.tradeContentTop{

	display : block;
	width : 90%;
	height : 85%;
	background-color: #FFFFFF;
	margin-left: 40px;
	margin-top: 20px;
}

.tradeContentBottom{

	margin-left: 40px;
	display : block;
	width : 90%;
	height : 50px;
	background-color: #F000FF;
}
.tradeUpdateBtn{	
	margin-top : 10px;
	margin-left: 550px;
	display : inline-block;
	width : 80px;
	height : 30px;
	background-color: #FFFFFF;
}

.tradeDeleteBtn{
	margin-top : 10px;
	margin-left: 20px;
	display : inline-block;
	width : 80px;
	height : 30px;
	background-color:#FFFFFF;
}
.tradeRequest{
	margin-top: 20px;
	margin-left: 40px;
	display : inline-block;
	width : 80px;
	height : 30px;
	margin-left: 650px;
	background-color: #FFFFFF;
}



.reportBtn{
	
	vertical-align:top;
	width : 80px;
	height : 30px;
	background-color:#FFFFFF;
	margin-left: 410px;
	border-radius: 20px;

}





.WriteBtn{
	width : 80px;
	height : 30px;
	background-color: #FFFFFF;
	border-radius: 20px;
	margin-left: 725px;
}
.repleContent{
	width : 100%;
	height :	100%;
  word-break:break-all;
   overflow-y: auto;
}
.reportBtn1{
	width : 70px;
	height : 30px;
	background-color: #FFFFFF;
	border-radius: 20px;
	margin-left: 80px;
}
.repleDelBtn{
	width : 70px;
	height : 30px;
	background-color: #FFFFFF;
	border-radius: 20px;
	margin-left: 80px;
}
</style>
<style type="text/css">
.popupReport{
    display: inline-block;
    width: 600px;
    height: 750px;
    background-color:#BBBBBB;
    position: absolute;
    z-index: 200;
    top: calc(45% - 50px);
    left: calc(40% - 100px);
    border: 2px solid #000000;
}
.popupMain{
	display : inline-block;
    width: 100%;
    height: 1300px;
    position: absolute;
    z-index: 100;
    background-color:#FFFFFF;
    opacity: 0.4;  
      
}
.reportHead{
	  width: 100%;
    height: 50px;
    background-color:#F12C23;

}

.reportContent{
	
	width: 100%;
    height: 460px;
    background-color:#012C03;
	

}

.reportContent textarea{
	margin-left: 26px;
}

.reportSome{
	width: 100%;
    height: 180px;
    background-color:#012123;
}

.reportBtn1{
	display : inline-block;
	margin-left : 30px;
	width: 70px;
    height: 40px;
    background-color:#012FF3;

}

.reportCencelBtn{
	vertical-align :top ;
	display : inline-block;
	margin-left : 400px;
	width: 70px;
    height: 40px;
    background-color:#012FF3;

}

	
</style>

<script type="text/javascript">
$(document).ready(function(){	
	showReple();
	$(".tradePicture1").on("click",function(){
		var img = $(".tradePictureMain").children("img").prop("src");
		var img1 = $(".tradePicture1").children("img").prop("src");
		  
		   
		 
		   $(".tradePicture1").html("<img src='"+img+"' />");
		   $(".tradePictureMain").html("<img src='"+img1+"'/>");
		
		
	});
	
	$(".tradePicture2").on("click",function(){
		var img = $(".tradePictureMain").children("img").prop("src");
		var img1 = $(".tradePicture2").children("img").prop("src");
		  
		   
		 
		   $(".tradePicture2").html("<img src='"+img+"' />");
		   $(".tradePictureMain").html("<img src='"+img1+"'/>");
		
		
	});
	
	$(".tradePicture3").on("click",function(){
		var img = $(".tradePictureMain").children("img").prop("src");
		var img1 = $(".tradePicture3").children("img").prop("src");
		  
		   
		 
		   $(".tradePicture3").html("<img src='"+img+"' />");
		   $(".tradePictureMain").html("<img src='"+img1+"'/>");
		
		
	});
	
	$(".tradePicture4").on("click",function(){
		var img = $(".tradePictureMain").children("img").prop("src");
		var img1 = $(".tradePicture4").children("img").prop("src");
		  
		   
		 
		   $(".tradePicture4").html("<img src='"+img+"' />");
		   $(".tradePictureMain").html("<img src='"+img1+"'/>");
		
		
	});
	$(".tradeUpdateBtn").on("click",function(){
		
		$("#actionForm").attr("action", "TradeUpdate");
		$("#actionForm").submit();
	});
	
	
	$(".tradeRequest").on("click",function(){
		$("#actionForm").attr("action", "TradeEscrow");
		$("#actionForm").submit();
		
	});
	
	$(".tradeDeleteBtn").on("click",function(){
		if(confirm("삭제하시겠습니까???????")){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type:"post",
				url:"deleteTrade",
				dataType:"json",
				data : params,
				success : function(result){
			
						location.href="TradeBoard";
						
				
				},
				error : function(result){
					alert("ERROR");
				}
			});
		}
	});
	$(".repleDelBtn").on("click",function(){
		
		
		alert("qwd");		
	
	});
	
	$(".WriteBtn").on("click",function(){
		
		if(confirm("작성???????")){
			var params = $("#repleForm").serialize();
			
			$.ajax({
				type:"post",
				url:"insertReple",
				dataType:"json",
				data : params,
				success : function(result){
				
					$("#actionForm").attr("action", "TradeBoardLook");
					$("#actionForm").submit();
						
				
				},
				error : function(result){
					alert("ERROR");
				}
			});
		}
	});
	

	$("#RepleList").on("click", ".RepleDel", function(){
	      if(confirm("정말삭제할꺼야?")){
	         $("input[name='repleNo']").val($(this).attr("name"));
	         console.log($("input[name='repleNo']").val());
	         var params = $("#repleForm").serialize();
				
				$.ajax({
					type:"post",
					url:"updateDelReple",
					dataType:"json",
					data : params,
					success : function(result){
					
						$("#actionForm").attr("action", "TradeBoardLook");
						$("#actionForm").submit();
							
					
					},
					error : function(result){
						alert("ERROR");
					}
				});
	      }
	      else{
	         
	      }
	   });
	
	

	$("#RepleList").on("click", ".repleReport", function(){
		$(".popupMain").css("display","block");
		$(".popupReport").css("display","block");
		$("input[name='fraudUser']").val($(this).attr("name"));
		 var ar= $("input[name='fraudUser']").val();
		 var arr = ar.split("_");
		 $("input[name='fraudUser']").val(arr[1]);
		 $("input[name='repleNo120   ']").val(arr[0]);
	   });
	
});	
	
	
	
	
	function showReple(){
		var params = $("#actionForm").serialize(); //serialize 정렬해서 보여준다.
		
		$.ajax({//비동기화방식
			type : "post",
			url : "showReple", 
			dataType : "json",
			data : params,
			success : function(result){
				var html = "";
				
				for(var i = 0 ; i < result.list1.length ; i++){
					
					
					
					html +="<tr>";
					html +="<td width='20%''>"+result.list1[i].NICK+"</td>";
					html +="<td width='20%'>"+result.list1[i].WRITER_DATE+"</td>";
				
					html +="<td width='40%'></td>";
					if($("input[name='sNo']").val()!=null){
						html += "<td class='repleReport' name='" + result.list1[i].T_COMMENT_NO + "_"+result.list1[i].MEMBERNO+"'>" + '신고하기' + "</td>";
				
						}else{
							html+="<td></td>";
						}
					html +="</tr>";
				
					html +="<tr>";	
					html +="<td colspan='4' height='80px'><div class='repleContent'>"+result.list1[i].T_COMMENT_CONTENT+"</div></td>";					
					html +="</tr>";
				   
					html +="<tr>";	
					html +="<td colspan='3'></td>";
					if(result.list1[i].MEMBERNO==$("input[name='sNo']").val()){
					html += "<td class='RepleDel' name='" + result.list1[i].T_COMMENT_NO + "' value='result.list1[i].T_COMMENT_NO'>" + '삭제' + "</td>";
			
					}else{
						html+="<td></td>";
					}
					html +="<tr/>";
				}
				
				$("#RepleList").html(html);
				

			
					
			
 	
				
			},
			error : function(result){
				alert("error!!");
			}
		});
	}

</script>


<script type="text/javascript">
$(document).ready(function(){


	$(".reportBtn").on("click", function(){
		$(".popupMain").css("display","block");
		$(".popupReport").css("display","block");
	});
	
	$(".reportCencelBtn").on("click", function(){
		$(".popupMain").css("display","none");
		$(".popupReport").css("display","none");
	});
	
	$(".reportBtn1").on("click", function(){
		var reportForm = $("#reportForm");
		alert("qwd");
		reportForm.ajaxForm(uploadResultCallBack); // insertForm을 ajaxForm형태로 바꾸겠다. uploadResultCallBack은 ajax를 호출하고나서 이 함수를 호출하겠다.
		reportForm.submit();		

	});
});

function uploadResultCallBack(data, result){ //data:json(아까param가지고 조랄한거.) result : success와 faile ajax결과
	if(result =="success"){
		var resData = eval("(" + removePre(data) + ")");  // eval는 자바스크립트의 bean으로 바꿔주는것.
		
		$("#textFile").val(resData.fileName[0]); // 이거아까20자리 맥인거 그거가져오는듯
		$("#textFile1").val(resData.fileName[1]);
		$("#textFile2").val(resData.fileName[2]);
		$("#textFile3").val(resData.fileName[3]);
		$("#textFile4").val(resData.fileName[4]);
		var params = $("#reportForm").serialize();
		
		$.ajax({
			type : "post",
			url : "insertReport", // TestController에서 마들기
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res == "true"){
					location.href = "TradeBoard";
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
<div class="popupMain" style="display:none"></div>
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
		
		<div class="tradeCategory">
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
		
		<div class="tradeTable">
			<div class="tradePictureIf">
				<div class="tradePicture">
					<div class="tradePictureMain">	<img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME}"/></div>
					<div class="tradePicture1"> <img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME1}"/></div>
					<div class="tradePicture2"> <img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME2}"/></div>
					<div class="tradePicture3"> <img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME3}"/></div>
					<div class="tradePicture4"> <img alt="${con.TEST_FILE}" src="resources/upload/${con.PICTURENAME4}"/></div>
				</div>	
			
				<div class="tradeIf">
				<div class="reportBtn">신고하기</div>
				<br/>
				<br/>
				<form action="#" id="actionForm" method="post">
					<input type="hidden" name="page" value="${param.page}"/>
					<input type="hidden" name="searchText" value="${param.searchText }"/>
					<input type="hidden" name="testNo" value="${param.testNo}"/>
				</form>
					<table border="1" width="490px">
						<tr>
							<th width="20%">제목</th>
							<th width="80%">${con.WORD_TITLE}</th>
						</tr>
						
						<tr>
							<td>물품명</td>
							<td>${con.TRADE_BOARD}${con1.TRADE_NO}</td>
						</tr>
						
						<tr>
							<td>닉네임</td>
							<td>${con.NICK}</td>
						</tr>
						
						<tr>
							<td>가격</td>
							<td>${con.BUY_PAY}</td>
						</tr>
						
						<tr>
							<td>날짜</td>
							<td>${con.WRITER_DATE}</td>
						</tr>
					</table>
				</div>
				
			</div>
			<div class="tradeContent1">
				<div class="tradeContentTop">
						${con.WORD_CONTENTS}
				</div>
				<div class="tradeContentBottom">
					
					<c:choose>
						<c:when test="${sNo eq con.MEMBERNO}">
							<div class="tradeUpdateBtn">수정</div>
							<div class="tradeDeleteBtn">삭제</div>
						</c:when>
						<c:when test="${con1.TRADE_NO ne null}">
						
						</c:when>
						<c:otherwise>
							<div class="tradeRequest">거래요청</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="tradeReple">
				<form action="#" method="post" id="repleForm" >
				<input type="text" name="sNo" value="${sNo}">
				<input type="text" name="testNo" value="${param.testNo}"/>
				<input type="text" name="repleNo" value=""/>
				
				<table border="1" width="820px">
					<tr>
						<td>댓글
						</td>
					</tr>
					<tr>
						<td height="80px">
						<textarea rows="5" cols="112" name="repleContent" style="resize: none;"></textarea>
						</td>
					</tr>
					<tr>
						<td>
						<div class="WriteBtn" >글쓰기</div>
						</td>
					</tr>
					
				</table>
				</form>
				<br/>
				<table border="1" width="820px">
					<tbody id="RepleList">
					
				
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

<div class="popupReport" style="display:none">
	<form action="fileUploadAjax" method="post" id="reportForm"  name="reportForm" enctype="multipart/form-data">
	<div class="reportHead">
			신고사례 
				<select name="reportCato">
						<option value="1">물품상태 불량</option>
						<option value="2">구성품 누락</option>
						<option value="3">욕설 및 비매너</option>
				</select>
				<input type="text" name="reportTitle"/>
	</div>
	
	<div class="reportContent">
	<textarea rows="30" cols="75"  style="resize: none;" name="reportContent"></textarea>
	</div>
	<div class="reportSome">
		<input type="hidden" name="reportUser" value="${sNo}"/>
		<input type="hidden" name="fraudUser" value="${con.MEMBERNO}"/>
		<input type="hidden" name="testNo" value="${param.testNo}"/>
		<input type="hidden" name="repleNo1" value=""/>
					<input type="file" name="att1"> 
					<input type="hidden" name="textFile" id="textFile"/>
					<input type="file" name="att2"> 
					<input type="hidden" name="textFile1" id="textFile1"/>
					<input type="file" name="att3"> 
					<input type="hidden" name="textFile2" id="textFile2"/>
					<input type="file" name="att4"> 
					<input type="hidden" name="textFile3" id="textFile3"/>
					<input type="file" name="att5"> 
					<input type="hidden" name="textFile4" id="textFile4"/>
	</div>
	<div class="reportCencelBtn"></div>
	<div  class="reportBtn1">
					
					
	
	</div>
	</form>

</div>
</body>
</html>
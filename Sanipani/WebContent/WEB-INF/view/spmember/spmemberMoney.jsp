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
.MoneyContent1{
	margin-top : 100px;
	margin-left : 200px;
	width: 800px;
	height: 400px;
	background-color: #FFFFFF;

}

.MoneyContent2{
	margin-top : 50px;
	margin-left : 200px;
	width: 800px;
	height: 400px;
	background-color: #FFFFFF;

}
.MoneyTitle{
	width: 800px;
	height: 40px;

	font-size: 20pt;
	font-weight: bold;
}
.MoneyPlusInsert{
	vertical-align: top;
	display:inline-block;
	width: 300px;
	height: 40px;

}
.MoneyMinusInsert{
	vertical-align: top;
	display:inline-block;
	width: 300px;
	height: 40px;

}
.MoneyPlusInsert input[type="text"]{
	width: 300px;
	height: 34px;

	font-size: 15pt;
}

.MoneyMinusInsert input[type="text"]{
	width: 300px;
	height: 34px;

	font-size: 15pt;
}
.MoneyUpBtn{
	display:inline-block;
	width: 50px;
	height: 40px;
	background-color: #141232;
	
}
.MoneyDownBtn{
	display:inline-block;
	width: 50px;
	height: 40px;
	background-color: #141232;
}
.Method{
	font-size: 12pt;
	display:inline-block;
	width: 100%;
	height: 40px;

}
.Method1{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;
}
.Method2{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;

}
.Method3{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;

}
.Method4{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;

}
.Method5{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;

}

.Method6{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;

}


.Method1_1{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;
}
.Method2_1{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;

}
.Method3_1{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;

}
.Method4_1{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;

}
.Method5_1{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;

}

.Method6_1{
	margin-top :20px;
	margin-left : 20px;
	display:inline-block;
	width: 160px;
	height: 70px;
	background-color: #990012;

}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$(".Method1").on("click",function(){
var params = $("#actionForm").serialize();
		
		$.ajax({
			type:"post",
			url:"insertPlusMoney",
			dataType:"json",
			data : params,
			success : function(result){
				alert("충전되었습니다");	
			
			
			},
			error : function(result){
				alert("ERROR");
			}
		});
			
	});



	$(".Method2").on("click",function(){
var params = $("#actionForm").serialize();
		
		$.ajax({
			type:"post",
			url:"insertPlusMoney",
			dataType:"json",
			data : params,
			success : function(result){
				alert("충전되었습니다");	
			
			
			},
			error : function(result){
				alert("ERROR");
			}
		});
			
	});



	$(".Method3").on("click",function(){
var params = $("#actionForm").serialize();
		
		$.ajax({
			type:"post",
			url:"insertPlusMoney",
			dataType:"json",
			data : params,
			success : function(result){
				alert("충전되었습니다");	
			
			
			},
			error : function(result){
				alert("ERROR");
			}
		});
			
	});



	$(".Method4").on("click",function(){
var params = $("#actionForm").serialize();
		
		$.ajax({
			type:"post",
			url:"insertPlusMoney",
			dataType:"json",
			data : params,
			success : function(result){
				alert("충전되었습니다");	
			
			
			},
			error : function(result){
				alert("ERROR");
			}
		});
			
	});

	$(".Method5").on("click",function(){
var params = $("#actionForm").serialize();
		
		$.ajax({
			type:"post",
			url:"insertPlusMoney",
			dataType:"json",
			data : params,
			success : function(result){
				alert("충전되었습니다");	
			
			
			},
			error : function(result){
				alert("ERROR");
			}
		});
			
	});

	$(".Method6").on("click",function(){
var params = $("#actionForm").serialize();
		
		$.ajax({
			type:"post",
			url:"insertPlusMoney",
			dataType:"json",
			data : params,
			success : function(result){
				alert("충전되었습니다");	
			
			
			},
			error : function(result){
				alert("ERROR");
			}
		});
			
	});

	$(".Method1_1").on("click",function(){
var params = $("#actionForm").serialize();
		
		$.ajax({
			type:"post",
			url:"getMoney",
			dataType:"json",
			data : params,
			success : function(result){
			console.log(result.money);
			console.log($("input[name='moneyDown']").val());
				if(result.money>=$("input[name='moneyDown']").val()){
				var params = $("#actionForm").serialize();
				
				$.ajax({
					type:"post",
					url:"insertMinusMoney",
					dataType:"json",
					data : params,
					success : function(result){
						alert("환전되었습니다1");	
					
					
					},
					error : function(result){
						alert("ERROR");
					}
				});
				}
				else {
					alert("돈없");
					
				}
			
			},
			error : function(result){
				alert("ERROR");
			}
		});
			
	});
	$(".Method2_1").on("click",function(){
		var params = $("#actionForm").serialize();
				
				$.ajax({
					type:"post",
					url:"getMoney",
					dataType:"json",
					data : params,
					success : function(result){
					console.log(result.money);
					console.log($("input[name='moneyDown']").val());
						if(result.money>=$("input[name='moneyDown']").val()){
						var params = $("#actionForm").serialize();
						
						$.ajax({
							type:"post",
							url:"insertMinusMoney",
							dataType:"json",
							data : params,
							success : function(result){
								alert("환전되었습니다1");	
							
							
							},
							error : function(result){
								alert("ERROR");
							}
						});
						}
						else {
							alert("돈없");
							
						}
					
					},
					error : function(result){
						alert("ERROR");
					}
				});
					
			});

	$(".Method3_1").on("click",function(){
		var params = $("#actionForm").serialize();
				
				$.ajax({
					type:"post",
					url:"getMoney",
					dataType:"json",
					data : params,
					success : function(result){
					console.log(result.money);
					console.log($("input[name='moneyDown']").val());
						if(result.money>=$("input[name='moneyDown']").val()){
						var params = $("#actionForm").serialize();
						
						$.ajax({
							type:"post",
							url:"insertMinusMoney",
							dataType:"json",
							data : params,
							success : function(result){
								alert("환전되었습니다1");	
							
							
							},
							error : function(result){
								alert("ERROR");
							}
						});
						}
						else {
							alert("돈없");
							
						}
					
					},
					error : function(result){
						alert("ERROR");
					}
				});
					
			});
	$(".Method4_1").on("click",function(){
		var params = $("#actionForm").serialize();
				
				$.ajax({
					type:"post",
					url:"getMoney",
					dataType:"json",
					data : params,
					success : function(result){
					console.log(result.money);
					console.log($("input[name='moneyDown']").val());
						if(result.money>=$("input[name='moneyDown']").val()){
						var params = $("#actionForm").serialize();
						
						$.ajax({
							type:"post",
							url:"insertMinusMoney",
							dataType:"json",
							data : params,
							success : function(result){
								alert("환전되었습니다1");	
							
							
							},
							error : function(result){
								alert("ERROR");
							}
						});
						}
						else {
							alert("돈없");
							
						}
					
					},
					error : function(result){
						alert("ERROR");
					}
				});
					
			});

	$(".Method5_1").on("click",function(){
		var params = $("#actionForm").serialize();
				
				$.ajax({
					type:"post",
					url:"getMoney",
					dataType:"json",
					data : params,
					success : function(result){
					console.log(result.money);
					console.log($("input[name='moneyDown']").val());
						if(result.money>=$("input[name='moneyDown']").val()){
						var params = $("#actionForm").serialize();
						
						$.ajax({
							type:"post",
							url:"insertMinusMoney",
							dataType:"json",
							data : params,
							success : function(result){
								alert("환전되었습니다1");	
							
							
							},
							error : function(result){
								alert("ERROR");
							}
						});
						}
						else {
							alert("돈없");
							
						}
					
					},
					error : function(result){
						alert("ERROR");
					}
				});
					
			});

	$(".Method6_1").on("click",function(){
		var params = $("#actionForm").serialize();
				
				$.ajax({
					type:"post",
					url:"getMoney",
					dataType:"json",
					data : params,
					success : function(result){
					console.log(result.money);
					console.log($("input[name='moneyDown']").val());
						if(result.money>=$("input[name='moneyDown']").val()){
						var params = $("#actionForm").serialize();
						
						$.ajax({
							type:"post",
							url:"insertMinusMoney",
							dataType:"json",
							data : params,
							success : function(result){
								alert("환전되었습니다1");	
							
							
							},
							error : function(result){
								alert("ERROR");
							}
						});
						}
						else {
							alert("돈없");
							
						}
					
					},
					error : function(result){
						alert("ERROR");
					}
				});
					
			});
	

});


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
		<div class="content">
			<form action="#" method="post" id="actionForm" >
			<input type="hidden" name="sNo" value="${sNo}"/>
			
			<div class="MoneyContent1">
				<div class="MoneyTitle">포인트 충전</div>
				<div class="MoneyPlusInsert"><input type="text" name="moneyUp"></div>
				<div class="MoneyUpBtn">충천</div>
				<div class="Method">결제 선택방법</div>
				<div class="Method1"></div>
				<div class="Method2"></div>
				<div class="Method3"></div>
				<div class="Method4"></div>
				<div class="Method5"></div>
				<div class="Method6"></div>
				
			</div>
			
			<div class="MoneyContent2">
				<div class="MoneyTitle">포인트 현금 환전 </div>
				<div class="MoneyMinusInsert"><input type="text" name="moneyDown"></div>
				<div class="MoneyDownBtn">환전</div>
				<div class="Method">환전 선택방법</div>
				<div class="Method1_1"></div>
				<div class="Method2_1"></div>
				<div class="Method3_1"></div>
				<div class="Method4_1"></div>
				<div class="Method5_1"></div>
				<div class="Method6_1"></div>
			</div>
			</form>
		</div>
	
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
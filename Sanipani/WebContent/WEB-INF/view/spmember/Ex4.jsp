<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<style type="text/css">
.jbg{ /* 정보그라운드 */
	display : inline-block;
	width: 80%;
	height : 900px;
	background-color: #FF1111;
	margin-left: 100px;
}
.jb{ /* 정보입력 */
	display :  block;
	width: 100%;
	height : 900px;
	background-color: #FFFF11;
}
.okBtn{
	width:70px;
	height: 30px;
	margin-left: 45%;
}

.main{

	width: 100%;
	height: 1200px;
	background-color: #FF312F;
}
.main1{
	vertical-align : top;
	display : inline-block;
	width: 50%;
	height: 100%;
	background-color: #0F00FF;
}
.left{
	display : inline-block;
	width: 24%;
	height: 100%;
	background-color: #AF12FF;
}

.right{
	display : inline-block;
	width: 24%;
	height: 100%;
	background-color: #0FAC12;
}

.login{
	display :  block;
	width:100%;
	height : 70px;
	background-color: #123C12;
	padding-top: 10px;
	padding-bottom: 10px;
}
.menubar{
	display : block;
	width:100%;
	height : 90px;
	background-color: #123456;
	padding-top: 10px;
	padding-bottom: 10px;
}
.content{
	display :  block;
	width:100%;
	height : 1000px;
	background-color: #456782;
}




.loginNull{
	display:inline-block;
	width:44%;
	height: 100%;
	
}
.loginAccess{
	vertical-align : top;	
	min-width : 510px;
	display:inline-block;
	width:54%;
	height: 100%;
	background-color: #456782;
}





.login1{
	vertical-align : top;
	min-width : 150px;
	display:inline-block;
	width:30%;
	height: 100%;
	background-color: #45ABC2;
}
.login2{
	vertical-align : top;
	min-width : 150px;
	display:inline-block;
	width:30%;
	height: 100%;
	background-color: #999782;
}
.login3{
	vertical-align : top;
	min-width : 60px;
	display:inline-block;
	width:16%;
	height: 100%;
	background-color: #456999;
}
.login4{
	vertical-align : top;
	min-width :60px;
	display:inline-block;
	width:16%;
	height: 100%;
	background-color: #451111;
}









.login1 input[type="text"]{
	margin-top:20px;
	width:80%;

}
.login2 input[type="password"]{
	margin-top:20px;
	width:80%;

}

.loginBtn{
	margin-top:20px;
	width:70px;
	height: 25px;
	background-color: #FFFFFF;

}
.memberLogiBtn{
	margin-top:20px;
	width:70px;
	height: 25px;
	background-color: #FFFFFF;

}
/*loginAccess  */




.loginCut{
	vertical-align : top;	
	display:inline-block;
	width:54%;
	height: 100%;
	background-color: #412322;
}

.login1_1{
	vertical-align : top;
	display:inline-block;
	width:50%;
	height: 100%;
	background-color: #45ABC2;
}
.login2_1{
	vertical-align : top;
	display:inline-block;
	width:14%;
	height: 100%;
	background-color: #999782;
}
.login3_1{
	vertical-align : top;
	display:inline-block;
	width:14%;
	height: 100%;
	background-color: #456999;
}
.login4_1{
	vertical-align : top;
	display:inline-block;
	width:14%;
	height: 100%;
	background-color: #451111;
} 



.memberInfo{
	margin-top:10px;
	width:80%;

}
.logout{
	margin-top:10px;
	width:70px;
	height: 25px;
	background-color: #FFFFFF;

}

.mypage{
	margin-top:10px;
	width:70px;
	height: 25px;
	background-color: #FFFFFF;

}
.basket{
	margin-top:10px;
	width:70px;
	height: 25px;
	background-color: #FFFFFF;

}
/*loginCut  */


.logo{
	display: inline-block;
	width:20%;
	height: 100%;
	background-color: #451111;
}

.menuall{
	vertical-align : top;
	display: inline-block;
	width:78%;
	height: 100%;
	background-color: #451111;
}





.auctionBoard{
	vertical-align : top;
	display: inline-block;
	width:19%;
	height: 100%;
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
	height: 100%;
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
	height: 100%;
	background-color: #123111;
}
.customerBoard{
	vertical-align : top;
	display: inline-block;
	width:19%;
	height: 100%;
	background-color: #459811;
}
.freeBoard{
	vertical-align : top;
	display: inline-block;
	width:19%;
	height: 100%;
	background-color: #459991;
}



					
.home{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.elec{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.cloth{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.watch{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.cosmetic{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.travel{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.furni{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.book{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.etc{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}



.home_1{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.elec_1{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.cloth_1{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.watch_1{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.cosmetic_1{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.travel_1{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.furni_1{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.book_1{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}
.etc_1{
	display: block;
	margin-top: 5px;
	height:40px;
	background-color: #409991;
}




.ad {
	margin-top : 280px;
	margin-left : 20px;
	display :block;
	width: 150px;
	height: 550px;
	background-color: #FFAACC;
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	   
   });
function checkemailaddy(){
    if (form.email_select.value == '1') {
        form.email2.readonly = false;
        form.email2.value = '';
        form.email2.focus();
    }
    else {
        form.email2.readonly = true;
        form.email2.value = form.email_select.value;
    }
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
			<div class="loginAccess" id="loginAccess">
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
			</form>
			
			</div>
			
			
			
			<!-- 로그인 접속후 -->
			<div class="loginCut" id="loginCut" style="display:none;">
				<div class="login1_1">
					<div class="memberInfo">
						memberInfo
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
				</div>
				<div class="tradeBoard" id="tradeBoard">
					trade
				</div>
				<div class="tradeBoard_1" id="tradeBoard_1" style="display:none;">
					trade1
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
			<div class="jb">
				<div class="jbg">
				<h1>회원가입</h1>
				<table width="100%" height="80%" border="2" cellspacing="0">
				<tr>
					<td>이름</td>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<td>ID</td>
					<td><input type="text" /></td>			
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" /></td>		
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" /></td>			
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="text" /></td>			
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input type="text" /></td>			
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" /></td>			
				</tr>
				<tr>
					<td>성별</td>
					<td>남 <input type=radio name=radioBtn onClick="">
						여 <input type=radio name=radioBtn onClick=""></td>			
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" /> ex) oo도 oo시 oo구</td>			
				</tr>
				<tr>
					<td>상세주소</td> 
					<td><input type="text" /> ex) 000-00 몇층 몇호</td>			
				</tr>
				<tr>
					<td>이메일</td>
					<td>
					<form name="form" method="post">
<input name="email1" type="text" class="box" id="email1" size="15"> @ <input name="email2" type="text" class="box" id="email2" size="20">
<select name="email_select" class="box" id="email_select" onChange="checkemailaddy();">
    <option value="" selected>선택하세요</option>
    <option value="naver.com">naver.com</option>
    <option value="hotmail.com">hotmail.com</option>
    <option value="hanmail.com">hanmail.com</option>
    <option value="yahoo.co.kr">yahoo.co.kr</option>
    <option value="1">직접입력</option>
</select>
  
</form></td>		
				</tr>
				</table>
				<input type="button" class="okBtn" value="가입하기">
			</div>
		</div>
	</div>
	<div class="right">
	
	<div class="ad"></div>
	</div>
</div>
</body>
</html>
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
<link rel="stylesheet" type="text/css" href="resources/css/spMypage/MyPage.css"/>
<script type="text/javascript">
$(document).ready(function(){
   $(".menu4").hide();
   
   $("#myPageFix").on("click",function(){
		$("#actionForm").attr("action", "MyPage2"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	});
	$("#MemberBye").on("click",function(){
		$("#actionForm").attr("action", "MyPage6"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	});
	
	$("#myPageMain").on("click",function(){
		$("#actionForm").attr("action", "MyPage"); // 밑의 form에 action의 값이#인데 거 에다가 test5를 넣겠다는 소리.
		$("#actionForm").submit();
	});
   
   $("#pwconfirmBtn").on("click", function(){
      
      if($("input[name='PW']").val() == $("#Mypw").val()){
      
      
      $(".menu5").hide();
      $(".menu4").show();
      
      }
      else{
         alert("비밀번호가 틀렸습니다.");
      }
      
   });
   $("#pwok").on("click", function(){
       if($("#pw2").val() == $("#pw3").val()){
          $("input[name='NowPw1']").val($(this).attr("name"));
          $("input[name='NowPw2']").val($(this).attr("name"));
         var params = $("#PwUpdateForm").serialize();
         
         $.ajax({
            type : "post",
            url : "PwUpdate",
            dataType : "json",
            data : params,
            success : function(result){
               if(result.res > 0){
            	  alert("비밀번호 변경이 완료되었습니다.");
                  $("#actionForm").attr("action","MyPage");
                  $("#actionForm").submit();
               }else {
                  alert("변경실패 ㅋ");
               }
            },
            error : function(result){
               alert("ERROR");
            }
         });
         
      }
      else{
         alert("비밀번호가 일치하지 않습니다.")
      } 
   });
});


   






</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
   <input type="hidden" name="sNo" value="${sNo}"/>
   <input type="hidden" name="PW" value="${con.PW}">
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
      
      <div class="content10">
         <div class="menu">
            <br/>
            <h2 align="center">마이페이지</h2>
               <div class="menu2">
               <br/>
                  <div class="mypageBtn" id="myPageMain"><h3 align="center">내 정보조회</h3></div>
						<br/>
						<div class="updateBtn" id="myPageFix"><h3 align="center">내 정보수정</h3></div>
						<br/>
						<div class="pwBtn" id="passChange"><h3 align="center">비밀번호 수정</h3></div>
						<br/>
						<div class="pointBtn"><h3 align="center">포인트결제</h3></div>
						<br/>
						<div class="basketBtn"><h3 align="center">장비구니</h3></div>
						<br/>
						<div class="memoutBtn" id="MemberBye"><h3 align="center">회원탈퇴</h3></div>
                  
               </div>   
         </div>   
            <div class="menu5">
            	<h3>
               비밀번호 확인
            	</h3>
               <input type="password" style="width: 300px; height:20px; font-size:20px" id="Mypw" name="myPw">
               <input type="button" value="확인" id="pwconfirmBtn">
               
               </div>
               <div class="menu4">
                  <form action="fileUploadAjax" id="PwUpdateForm" method="post" enctype="multipart/form-data" >
               <input type="hidden" name="sNo" value="${sNo}"/>
               <h3>
               현재 비밀번호
               </h3>
                   <input type="hidden"name="NowPw1" value="" />
               <input type="password" style="width: 300px; height:20px; font-size:20px" id="Chapw" name="pw2"><br/><br/>
				<h3>
               비밀번호 확인
				</h3>               
                  <input type="hidden" name="NowPw2" value="" />
               <input type="password"style="width: 300px; height:20px; font-size:20px" id="Chapw2" name="pw3"><br/><br/>
               
               <input type="button" id="pwok" value="변경하기" style="width:280px;">
               </form>
               </div> 
            </div>
            
   
   </div>
   <div class="right">
   
   <div class="ad"></div>
   </div>
</div>
</body>
</html>
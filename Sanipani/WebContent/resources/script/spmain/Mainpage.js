/**
 * 
 */


$(document).ready(function(){
	
	
	$(".loginBtn").on("click",function(){
		if($.trim($("#Id").val())==""){
			alert("아이디를 입력하세요");
			$("#Id").focus();
		}
		else if($.trim($("#Pw").val())==""){
			alert("비밀번호를  입력하세요");
			$("#Pw").focus();
		}
		else {
		
				var params = $("#LoginForm").serialize();
				
				$.ajax({
					type:"post",
					url:"testLoginCheckAjax",
					dataType:"json",
					data : params,
					
					success : function(result){
						if(result.res=="success"){
							loginCut.style.display="inline-block";
							loginAccess.style.display="none";
							$("#memNick").html(result.NICK);
							
						}else {
							alert("아이디 비번을 확인");
							$("#Id").focus();
						}
					},
					error : function(result){
						
					}
				});
				
			
		}
	});
	$(".logout").on("click",function(){
		
		location.href="testLogout";
	});
	

	
	
	
	
	$(".auctionBoard").on("mouseover",function(){
		auctionBoard_1.style.display="inline-block"
		auctionBoard.style.display="none"
	});
	
	$(".auctionBoard_1").on("mouseleave",function(){
		auctionBoard_1.style.display="none"
		auctionBoard.style.display="inline-block"
	});
	
	
	$(".tradeBoard").on("mouseover",function(){
		tradeBoard_1.style.display="inline-block"
		tradeBoard.style.display="none"
	});
	$(".tradeBoard_1").on("mouseleave",function(){
		tradeBoard_1.style.display="none"
		tradeBoard.style.display="inline-block"
	});
	
	$(".reportBoard").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".customerBoard").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".freeBoard").on("click",function(){
		location.href="AuctionBoard";
	});
	

	$(".mypage").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".basket").on("click",function(){
		location.href="AuctionBoard";
	});
	
	
	
	
	
	$(".home").on("click",function(){
		location.href="AuctionBoard";
	});
	
	$(".elec").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".cloth").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".watch").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".cosmetic").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".travel").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".furni").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".book").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".etc").on("click",function(){
		location.href="AuctionBoard";
	});
	
	
	$(".home_1").on("click",function(){
		location.href="test9";
	});
	
	$(".elec_1").on("click",function(){
		location.href="test9";
	});
	$(".cloth_1").on("click",function(){
		location.href="test9";
	});
	$(".watch_1").on("click",function(){
		location.href="test9";
	});
	$(".cosmetic_1").on("click",function(){
		location.href="test9";
	});
	$(".travel_1").on("click",function(){
		location.href="test9";
	});
	$(".furni_1").on("click",function(){
		location.href="test9";
	});
	$(".book_1").on("click",function(){
		location.href="test9";
	});
	$(".etc_1").on("click",function(){
		location.href="test9";
	});
});

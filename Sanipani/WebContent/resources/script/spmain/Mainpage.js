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
	

	$(".logout").on("click",function(){
		
		location.href="testLogout";
	});
	
	$(".memberLogiBtn").on("click", function() {
		location.href="spmember";
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
		location.href="ReportBoard";
	});
	$(".customerBoard").on("click",function(){
		location.href="CusBoard";
	});
	$(".freeBoard").on("click",function(){
		location.href="FreeBoard";
	});
	

	$(".mypage").on("click",function(){
		location.href="AuctionBoard";
	});
	$(".basket").on("click",function(){
		location.href="sp";
	});
	
	
	
	$(".logo").on("click",function(){
		location.href="Mainpage";
	});
	
	$(".auctionBoard").on("click",function(){
		location.href="AuctionBoard";
	});
	
	$(".home").on("click",function(){
		location.href="AuctionBoard";
	});
	
	$(".elec").on("click",function(){
		location.href="AuctionBoard1";
	});
	$(".cloth").on("click",function(){
		location.href="AuctionBoard2";
	});
	$(".watch").on("click",function(){
		location.href="AuctionBoard3";
	});
	$(".cosmetic").on("click",function(){
		location.href="AuctionBoard4";
	});
	$(".travel").on("click",function(){
		location.href="AuctionBoard5";
	});
	$(".furni").on("click",function(){
		location.href="AuctionBoard6";
	});
	$(".book").on("click",function(){
		location.href="AuctionBoard7";
	});
	$(".etc").on("click",function(){
		location.href="AuctionBoard8";
	});
	
	
	$(".home_1").on("click",function(){
		location.href="TradeBoard";

	});
	$(".elec_1").on("click",function(){
		location.href="TradeBoard1";


	});
	


	$(".elec_1").on("click",function(){
		location.href="TradeBoard";
	});

	$(".cloth_1").on("click",function(){

		location.href="TradeBoard2";



	});
	$(".watch_1").on("click",function(){

		location.href="TradeBoard3";



	});
	$(".cosmetic_1").on("click",function(){

		location.href="TradeBoard4";


	});
	$(".travel_1").on("click",function(){

		location.href="TradeBoard5";

	

	});
	$(".furni_1").on("click",function(){

		location.href="TradeBoard6";

	

	});
	$(".book_1").on("click",function(){

		location.href="TradeBoard7";



	});
	$(".etc_1").on("click",function(){

		location.href="TradeBoard8";

	

	});
});

<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
	int price = (int)request.getAttribute("price");
	int point = (int)request.getAttribute("point");
	int sum = (int)request.getAttribute("sum");
	int userNo = (int)request.getAttribute("userNo");
	String alertMsg = (String)request.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <script src="https://js.tosspayments.com/v2/standard"></script>

    <link rel="stylesheet" href="./resources/css/minglesChargeEgg.css">

    <style> 
    

    </style>

</head>
<body>
		

	<div class="wrap">

        <header>
            <div id="left">
                <span class="material-icons">egg</span>
                <div>거북</div>
            </div>
            <div id="center">
                결제
            </div>
            <div id="right">
                <button><span class="material-icons"></span></button>
            </div>
        </header>

        <!--  -->
        <section class="info">
            <div id="price"><%= price %>원</div>
            <div id="egg">거북알 <%= point %>개</div>
        </section>

        <!--  -->
        <section class="charge">
            <div id="charge-text">
              <div style="background-color: rgb(226, 255, 254);">이용 가능한 간편결제</div>
              <div class="swiper mySwiper swiper-top">
                <div class="swiper-wrapper">
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/TOSSPAY.png" alt=""></div>
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/SAMSUNGPAY.png" alt=""></div>
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/NAVERPAY.png" alt=""></div>
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/LPAY.png" alt=""></div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
              </div>
              <div style="background-color: rgb(226, 255, 254);">이용 가능한 카드결제</div>
              <div class="swiper mySwiper swiper-bottom">
                <div class="swiper-wrapper">
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/삼성.png" alt=""></div>
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/신한.png" alt=""></div>
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/현대.png" alt=""></div>
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/kb.png" alt=""></div>
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/롯데.png" alt=""></div>
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/비씨.png" alt=""></div>
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/24.png" alt=""></div>
                  <div class="swiper-slide"><img src="./resources/images/결제수단 이미지/농협.png" alt=""></div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
              </div>
            </div>
        </section>

        <script>
           var swiper = new Swiper(".mySwiper", {
                slidesPerView: 'auto',
                observer: true,
                observeParents: true,
                navigation: {
                  nextEl: ".swiper-button-next",
                  prevEl: ".swiper-button-prev",
                },
              });
        </script>


        <footer class="finish">
            <div id="fin-text">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</div>
            <div id="fin-content">
                <button class="fin-btn" onclick="charge()">결제하기</button>
            </div>
            
        </footer>
        
            <script>
             

              const tossPayments = TossPayments("test_ck_GePWvyJnrK2K7KR4BPjLVgLzN97E");
              const payment = tossPayments.payment({ customerKey :"fdsafdsai923f2rdfsar3ds" });
              
              const userNo = <%= userNo %>;
              const sum = <%= sum %>;
              const price = <%= price %>;
              const point = <%= point %>;
              
             
              function charge(){
                payment.requestPayment({
                    method: "CARD",
                    amount: {
                        currency: "KRW",
                        value: price,
                    },
                    orderId: "faMOdjVdbHNEIHd0Shh0n",
                    orderName: point+"거북알",
                    customerEmail: "",
                    customerName: "차은우",
                    customerMobilePhone: "01012345678",
                    windowTarget: "iframe",
                    card: {
                        useEscrow: false,
                        flowMode: "DEFAULT",
                        useCardPoint: false,
                        useAppCardOnly: false,
                    },
                    successUrl:"http://localhost:8254/Mingles/eggUpdate.mi?userNo="+userNo+"&sum="+sum+"&price="+price+"&point="+point,
                    failUrl:"http://www.naver.com",
                });
              }
              
             
              
            </script>
    
    </div>
	



</body>
</html>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Member m = (Member)session.getAttribute("loginUser");
	int price = (int)request.getAttribute("price");
	int point = (int)request.getAttribute("point");
	int sum = (int)request.getAttribute("sum");
	int giftUserNo = (int)request.getAttribute("giftUserNo");
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <script defer src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="./resources/css/minglesGiftEgg.css">


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
                <button><span class="material-icons">X</span></button>
            </div>
        </header>

        <!--  -->
        <section class="info">
            <div id="price"><%= price %>원</div>
            <div id="egg">거북알 <%= point %>개</div>
        </section>

        <!--  -->
        <section class="charge">
            <div id="charge-text">결제수단</div>

            <div id="charge-content">
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item">
                      <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          간편 결제
                        </button>
                      </h2>
                      <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="swiper-help">
                                <swiper-container class="mySwiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
                                    <swiper-slide>Slide 1</swiper-slide>
                                    <swiper-slide>Slide 2</swiper-slide>
                                    <swiper-slide>Slide 3</swiper-slide>
                                    <swiper-slide>Slide 4</swiper-slide>
                                </swiper-container>
                            </div>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                          카드 결제
                        </button>
                      </h2>
                      <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="swiper-help">
                                <swiper-container class="mySwiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
                                    <swiper-slide>Slide 1</swiper-slide>
                                    <swiper-slide>Slide 2</swiper-slide>
                                    <swiper-slide>Slide 3</swiper-slide>
                                    <swiper-slide>Slide 4</swiper-slide>
                                </swiper-container>
                            </div>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                          일반 결제
                        </button>
                      </h2>
                      <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="swiper-help">
                                <swiper-container class="mySwiper" navigation="true" pagination="true" keyboard="true" mousewheel="true" css-mode="true">
                                    <swiper-slide>Slide 1</swiper-slide>
                                    <swiper-slide>Slide 2</swiper-slide>
                                    <swiper-slide>Slide 3</swiper-slide>
                                    <swiper-slide>Slide 4</swiper-slide>
                                </swiper-container>
                            </div>
                        </div>
                      </div>
                    </div>
                  </div>
            </div>
        </section>


        <footer class="finish">
            <div id="fin-text">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</div>
            <div id="fin-content">
                <button class="fin-btn" onclick="charge(<%= giftUserNo %>, <%= sum %>);">결제하기</button>
            </div>
            
        </footer>

        <script>
          var payOption = '간편결제'
          $(function(){
            $(".accordion-button").click(function(){
              payOption = $(this).text();
            })
          })

          const userNo = <%= m.getMemNo() %>;
          const price = <%= price %>;
          const point = <%= point %>;
          
          function charge(giftUserNo, sum){
            location.href= "eggGiftUpdate.mi?giftUserNo="+giftUserNo+"&sum="+sum+"&userNo="+userNo+"&price="+price+"&point="+point+"&payOption="+payOption;
          }
          
        </script>
        
    
    </div>
	


</body>
</html>
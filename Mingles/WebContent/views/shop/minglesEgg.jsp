<%@page import="com.kh.shop.model.vo.EggPayMent"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.PageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)request.getAttribute("alertMsg");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<EggPayMent> list = (ArrayList<EggPayMent>)request.getAttribute("list");
	String contextPath = request.getContextPath();
	int selectType = (int)request.getAttribute("selectType");
	String startDate = (String)request.getAttribute("startDate");
	String endDate = (String)request.getAttribute("endDate");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles Frame</title>

    <!-- 외부파일 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">

    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/js/bootstrap-datepicker.min.js" integrity="sha512-LsnSViqQyaXpD4mBBdRYeP6sRwJiJveh2ZIbW41EBrNmKxgr/LFZIiWT6yr+nycvhvauz8c2nYMhrP80YhG7Cw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script defer src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script defer src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- 내부파일 -->
    <link rel="stylesheet" href="./resources/css/mingleEgg.css">
    <script defer src="./resources/js/mingleEgg.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>

<body>

    
        <!-- 메인 화면 -->
        <div id="container">

            <header id="turtle-egg-header">
                <div id="teh__text">MY 거북알</div>
                <button class="reload" onclick="location.reload()">새로고침</button>
                <button class="btn-back" onclick="history.back()">뒤로가기</button>
            </header>

            <section id="turtle-egg-content">
                <div id="turtle-egg">
                    <div id="turtle-egg__top">
                        <div id="top__text">보유 거북알</div>
                        <div id="top__point"><%= m.getEgg() %></div>
                        <div id="top__p-text">거북알</div>
                    </div>
					
                    <div id="turtle-egg__bot">
                        <button class="btn" id="bot__charge" data-toggle="modal" data-target="#charge-modal">충전</button>
                        <button class="btn" id="bot__gift" data-toggle="modal" data-target="#gift-modal">선물</button>
                    </div>
                </div>

                <div id="charge-list">
                    <div id="charge-list__top">
                        <div id="list-top__text">결제 내역</div>
                        <form action="<%= contextPath %>/eggChargeListSearch.mi">
                          <input type="hidden" id="input1" name="cpage" value="1">
                          <input type="hidden" id="input2" name="userNo" value="<%= m.getMemNo() %>">
                          <input type="date" name="startDate" id="input3">
                          <span>~</span>
                          <input type="date" name="endDate" id="input4">
                          <button type="submit">조회</button>
                        </form>
                    </div>

                    <div id="charge-list__bot">
                        <table class="table table-hover" >
                            <thead>
                              <tr>
                                <th>구매수량</th>
                                <th>금액</th>
                                <th>결제방법</th>
                                <th>구매일자</th>
                                <th>기타</th>
                                
                              </tr>
                            </thead>
                            <tbody>
                            <% if(list.isEmpty()){ %>
			                <!-- case1. 게시글이 없을 경우 -->
			                <tr>
			                    <td colspan="5">조회된 결제내역이 없습니다..</td>
			                </tr>
			                <% } else { %>
                                <div id="listContent">
			                	<% for(EggPayMent ep : list) { %>
		                              <tr>
		                                <td><%= ep.getPoint() %>개</td>
		                                <td><%= ep.getPrice() %>원</td>
		                                <td><%= ep.getPayOption() %></td>
		                                <td><%= ep.getPayDate() %></td>
		                                <td><%= ep.getCategory() %></td>
		                              </tr>
                              	<% } %>
                                </div>
					        <% } %>
                             
                            </tbody>
                          </table>
                          <div class="pageWrap">
                            <div class="pagination">
                            	
                            	<% if(selectType == 1) { %>
                            		<!-- 날짜별 조회 -->
                            		<% if(currentPage != 1){ %>
						               <a href="<%= contextPath %>/eggChargeListSearch.mi?cpage=<%= currentPage -1 %>&userNo=<%= m.getMemNo() %>&startDate=<%= startDate %>&endDate=<%= endDate %>">&laquo;</a>
						            <%} %>
						            
						            <% for(int p = startPage; p <= endPage; p++) { %>
						               <% if(p == currentPage){ %>
						                  <a href="#" class="active"><%= p %></a>
						               <% } else { %>
						               	  <a href="<%= contextPath %>/eggChargeListSearch.mi?cpage=<%= p %>&userNo=<%= m.getMemNo() %>&startDate=<%= startDate %>&endDate=<%= endDate %>"><%= p %></a>
						               <% } %>
						         	<% } %>
						            
						            <% if(currentPage != maxPage) {%>
						               <a href="<%= contextPath %>/eggChargeListSearch.mi?cpage=<%= currentPage +1 %>&userNo=<%= m.getMemNo() %>&startDate=<%= startDate %>&endDate=<%= endDate %>">&raquo;</a>
						            <% } %>
                            	
                            	<% } else { %>
                                	<!-- 전체 조회 -->
	                                <% if(currentPage != 1){ %>
						               <a href="<%= contextPath %>/eggForm.mi?cpage=<%= currentPage -1 %>&userNo=<%= m.getMemNo() %>">&laquo;</a>
						            <%} %>
						            
						            <% for(int p = startPage; p <= endPage; p++) { %>
						               <% if(p == currentPage){ %>
						                  <a href="#" class="active"><%= p %></a>
						               <% } else { %>
						               	  <a href="<%= contextPath %>/eggForm.mi?cpage=<%= p %>&userNo=<%= m.getMemNo() %>"><%= p %></a>
						               <% } %>
						         	<% } %>
						            
						            <% if(currentPage != maxPage) {%>
						               <a href="<%= contextPath %>/eggForm.mi?cpage=<%= currentPage +1 %>&userNo=<%= m.getMemNo() %>">&raquo;</a>
						            <% } %>
					            <% } %>
                            </div>
                         </div>
                    </div>
                </div>
                
            </section>
        </div>
        <script>
           
        </script>
        
        

    <!-- 충전 모달 -->
    <div class="modal" id="charge-modal">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
      
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">거북알 충전</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
      
              <!-- Modal body -->
              <div class="modal-body">
                
                  <ul>
                      <li>
                          <div>거북알 1개</div>
                          <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openPop(<%=m.getMemNo()%>,<%=m.getEgg()%>,100,1)">100원</button>
                      </li>
                      <li>
                          <div>거북알 10개</div>
                          <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openPop(<%=m.getMemNo()%>,<%=m.getEgg()%>,1000,10)">1,000원</button>
                      </li>
                      <li>
                          <div>거북알 30개</div>
                          <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openPop(<%=m.getMemNo()%>,<%=m.getEgg()%>,3000,30)">3,000원</button>
                      </li>
                      <li>
                          <div>거북알 50개</div>
                          <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openPop(<%=m.getMemNo()%>,<%=m.getEgg()%>,5000,50)">5,000원</button>
                      </li>
                      <li>
                          <div>거북알 100개</div>
                          <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openPop(<%=m.getMemNo()%>,<%=m.getEgg()%>,10000,100)">10,000원</button>
                      </li>
                  </ul>
                  <ul>
                    <li>
                        <div>거북알 200개</div>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openPop(<%=m.getMemNo()%>,<%=m.getEgg()%>,20000,200)">20,000원</button>
                    </li>
                    <li>
                        <div>거북알 300개</div>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openPop(<%=m.getMemNo()%>,<%=m.getEgg()%>,30000,300)">30,000원</button>
                    </li>
                    <li>
                        <div>거북알 500개</div>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openPop(<%=m.getMemNo()%>,<%=m.getEgg()%>,50000,500)">50,000원</button>
                    </li>
                    <li>
                        <div>거북알 700개</div>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openPop(<%=m.getMemNo()%>,<%=m.getEgg()%>,70000,700)">70,000원</button>
                    </li>
                    <li>
                        <div>거북알 1000개</div>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openPop(<%=m.getMemNo()%>,<%=m.getEgg()%>,100000,1000)">100,000원</button>
                    </li>
                </ul>
                
              </div>
              
              <script>

                function openPop(userNo, egg, price, point){
                        // 새로운 팝업창 띄워줄 예정
                            var option = 'top=70, left=680, width=700, height=802, status=no, menubar=no, toolbar=no, resizable=no';
                            window.open('chargeEgg.mi?price='+price+"&egg="+egg+"&userNo="+userNo+"&point="+point, '_blank', option);
                        // 매개변수 price로 해당 가격 받아와서 결제페이지로 넘겨줄 예정
                        // "/Mingles/egg충전.mi?price=" + price 
                                //location.href = "/Mingles/chargeEgg.mi?price=" + price;
                        }
              </script>
          </div>
        </div>
    </div>

    <!-- 선물 모달 -->
    <div class="modal" id="gift-modal">
    
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">거북알 선물</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-header" id="gift-userId">
                <form action="" class="gift-form">
                    <h4 class="modal-title" id="gift-userId__text">선물하고자하는 사람의 아이디를 입력해주세요 :</h4>
                    <input type="text" name="userId" id="input-userId" placeholder="아이디를 입력해주세요" required>
                    <button type="button" onclick="ajaxIdCheck();">확인</button>
                </form>
            </div>
            <input type="hidden" id="memId" value="<%= m.getMemId()%>">
            <script>    
                function ajaxIdCheck(){
					var userId = document.getElementById("input-userId").value;
                    var memId = document.getElementById('memId').value;
                    console.log(memId);
                    console.log("dmd")
                    $.ajax({
                        url:'ajaxIdCheck.mi',
                        data:{userId:userId, memId:memId},
                        success:function(result){
							if(result === "success"){
								alert("선물할 금액을 선택하세요.")
                                var gift1 = document.getElementById('gift_ul1');
                                var gift2 = document.getElementById('gift_ul2');
								gift1.style.display = "block"
								gift2.style.display = "block"
                                $('.gift-form input[name=userId]').attr("readonly", true);
							}else if(result === "fail"){
								alert("존재하지 않은 아이디 입니다.")
							}else{
								alert("본인계정에 선물하기는 할 수 없습니다.")
							}
                        },
                    })
                }


            </script>
      
            <!-- Modal body -->
            <div class="modal-body" id="gift-modal-body">
                
                <ul id="gift_ul1">
                    <li>
                        <div>거북알 1개</div>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openGiftPop(100,1)">100원</button>
                    </li>
                    <li>
                        <div>거북알 10개</div>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openGiftPop(1000,10)">1,000원</button>
                    </li>
                    <li>
                        <div>거북알 30개</div>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openGiftPop(3000,30)">3,000원</button>
                    </li>
                    <li>
                        <div>거북알 50개</div>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openGiftPop(5000,50)">5,000원</button>
                    </li>
                    <li>
                        <div>거북알 100개</div>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openGiftPop(10000,100)">10,000원</button>
                    </li>
                </ul>
                <ul id="gift_ul2">
                  <li>
                      <div>거북알 200개</div>
                      <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openGiftPop(20000,200)">20,000원</button>
                  </li>
                  <li>
                      <div>거북알 300개</div>
                      <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openGiftPop(30000,300)">30,000원</button>
                  </li>
                  <li>
                      <div>거북알 500개</div>
                      <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openGiftPop(50000,500)">50,000원</button>
                  </li>
                  <li>
                      <div>거북알 700개</div>
                      <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openGiftPop(70000,700)">70,000원</button>
                  </li>
                  <li>
                      <div>거북알 1000개</div>
                      <button type="button" class="btn btn-outline-success" data-dismiss="modal" onclick="openGiftPop(100000,1000)">100,000원</button>
                  </li>
              </ul>
              
            </div>
          
      
          </div>
        </div>
    </div>

    <script>
        function openGiftPop(price, point){
            var userId = document.getElementById("input-userId").value;
            var option = 'top=70, left=680, width=700, height=802, status=no, menubar=no, toolbar=no, resizable=no';
            window.open('giftEgg.mi?price='+price+"&point="+point+"&userId="+userId, '_blank', option);

        };
    </script>
   
    

</body>

</html>
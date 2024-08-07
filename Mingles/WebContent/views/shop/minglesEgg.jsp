<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mingles Frame</title>

    <!-- 외부파일 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    
    <!-- 내부파일 -->
    <link rel="stylesheet" href="./resources/css/mingleEgg.css">
    <script src="./resources/js/mingleEgg.js"></script>
    <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>

<body>

        <!-- 메인 화면 -->
        <div id="container">

            <header id="turtle-egg-header">
                <div id="teh__text">MY 거북알</div>
                <button class="btn-back" onclick="history.back()">뒤로가기</button>
            </header>

            <section id="turtle-egg-content">
                <div id="turtle-egg">
                    <div id="turtle-egg__top">
                        <div id="top__text">보유 거북알</div>
                        <div id="top__point">10000</div>
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
                        <form action="">
                          <input type="date" class="dateInput">
                          <span>~</span>
                          <input type="date" class="dateInput">
                          <button type="submit">검색</button>
                        </form>
                    </div>

                    <div id="charge-list__bot">
                        <table class="table table-hover">
                            <thead>
                              <tr>
                                <th>구매수량</th>
                                <th>금액</th>
                                <th>구매일자</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td>John</td>
                                <td>Doe</td>
                                <td>john@example.com</td>
                              </tr>
                              <tr>
                                <td>Mary</td>
                                <td>Moe</td>
                                <td>mary@example.com</td>
                              </tr>
                              
                            </tbody>
                          </table>
                    </div>
                </div>
                
            </section>

        </div>


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
              <div>
                <ul>
                    <li>
                        <div>100원</div>
                        <button type="button" class="btn btn-outline-success">100거북알</button>
                    </li>
                    <li>
                        <div>100원</div>
                        <button type="button" class="btn btn-outline-success">100거북알</button>
                    </li>
                    <li>
                        <div>100원</div>
                        <button type="button" class="btn btn-outline-success">100거북알</button>
                    </li>
                    <li>
                        <div>100원</div>
                        <button type="button" class="btn btn-outline-success">100거북알</button>
                    </li>
                    <li>
                        <div>100원</div>
                        <button type="button" class="btn btn-outline-success">100거북알</button>
                    </li>
                </ul>
              </div>
            </div>
      
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
      
            <!-- Modal body -->
            <div class="modal-body">
                <div>
                    <ul>
                        <li>
                            <div>100원</div>
                            <button type="button" class="btn btn-outline-success">100거북알</button>
                        </li>
                        <li>
                            <div>100원</div>
                            <button type="button" class="btn btn-outline-success">100거북알</button>
                        </li>
                        <li>
                            <div>100원</div>
                            <button type="button" class="btn btn-outline-success">100거북알</button>
                        </li>
                        <li>
                            <div>100원</div>
                            <button type="button" class="btn btn-outline-success">100거북알</button>
                        </li>
                        <li>
                            <div>100원</div>
                            <button type="button" class="btn btn-outline-success">100거북알</button>
                        </li>
                    </ul>
                  </div>
            </div>
      
          </div>
        </div>
    </div>

    

</body>

</html>
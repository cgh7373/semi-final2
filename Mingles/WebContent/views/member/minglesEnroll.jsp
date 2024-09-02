<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	String errorMsg = (String)session.getAttribute("errorMsg");
	String type = (String)request.getAttribute("type");
%>

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

  <!-- 카카오 api -->
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script><!-- kakao login연동 developer-->
  <!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script> -->

  <!-- 보라색 부트스트랩 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

  <!-- https://animate.style/ 웹사이트 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

  <script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script defer src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- 내부파일 -->
  <link rel="stylesheet" href="./resources/css/mingle-join.css">
  <script src="./resources/js/mingle-join.js"></script>
  <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link rel="icon" href="./resources/images/Mingles아이콘-removebg-preview.png">

</head>

<body>

  <div id="wrap">
  
    <!-- 메인 화면 -->
    <div id="container">
      
      <!-- 애니메이션 배경 화면 -->
      <img class="background" src="./resources/images/enrollbackground.gif" >

      <!-- 애니메이션 효과 화면 -->
      <div class="animate__animated animate__zoomIn" id="parent">
        
        <!-- form 태그 시작 -->
        <form action="<%=request.getContextPath()%>/insert.mi">

       <!-- 회원가입 화면 -->
      <div class="form_area" id="basicInfoForm" >

        <p class="title" id = "firsttitle">회원 가입</p>
        <!-- 아이디 입력 -->
        <div class="form_group">
          <label class="sub_title" for="id">ID</label>
          <input placeholder="영문으로 시작하는 영문자&숫자 6~20자" class="form_style" id="id" type="text" name="enrollId" required/>
        </div>

        <!-- 비밀번호 입력 -->
        <div class="form_group">
          <label class="sub_title" for="password">Password</label>
          <input placeholder="영문, 숫자로 구성된 8~16자" class="form_style" id="password" type="password" name="enrollPwd" required/>
        </div>

        <!-- 이름(닉네임) 입력 -->
        <div class="form_group">
          <label class="sub_title" for="name">이름 (닉네임)</label>
          <input placeholder="한글, 영문 사용 8자 이내(특수문자x)" class="form_style" id="name" type="text" name="enrollNickname" required />
        </div>

        <!-- 생년월일 입력 -->
        <div class="form_group">
          <label class="sub_title" for="birthdate">생년월일</label>
          <input class="form_style" id= "birthdate" type="date" name="enrollBirthdate" />
        </div>

        <!-- 휴대폰 번호 입력  -->
        <div class="form_group">
          <label class="sub_title" for="phone">휴대폰번호</label>
          <input placeholder="-없이 입력하세요" class="form_style" id="phone" type="text" name="enrollPhone" required/>
        </div>

        <!-- 이메일 입력 -->
        <div class="form_group">
          <label class="sub_title" for="email">Email</label>
          <input placeholder="이메일을 입력하세요" class="form_style" id="email" type="email" name="enrollEmail" required/>
        </div>

    </div>

        <!-- 추가정보 입력화면 -->
        <div class="form_area" id="moreInfoForm" >
          <p class="title" id="secondTitle">추가정보(선택)</p>
            
            <!-- MBTI 입력 -->
            <div class="form_group_2">
              <label class="sub_title" for="MBTI" style ="font-size:30px;">나의 MBTI는?</label>
              <select name="MBTI" id="mbti" class ="select">
                <option value="null">선택안함</option>
                <option value="istj">ISTJ</option>
                <option value="intj">INTJ</option>
                <option value="estj">ESTJ</option>
                <option value="entj">ENTJ</option>
                <option value="istp">ISTP</option>
                <option value="intp">INTP</option>
                <option value="estp">ESTP</option>
                <option value="entp">ENTP</option>
                <option value="isfj">ISFJ</option>
                <option value="infj">INFJ</option>
                <option value="esfj">ESFJ</option>
                <option value="enfj">ENFJ</option>
                <option value="isfp">ISFP</option>
                <option value="infp">INFP</option>
                <option value="esfp">ESFP</option>
                <option value="enfp">ENFP</option>
              </select>
            </div> 

            <!-- 성별 입력 -->
            <div class="form_group form_gender">
              <label class="sub_title" for="gender" style ="font-size:30px;">당신의 성별은?</label>
              
              <div class="Radio">
                <input class="form_style_gender" type="radio" id="radioM" name = "gender" value= "M"> 
                <label for="radioM"> 남자</label>
              </div>

              <div class="Radio">
                <input class="form_style_gender" type="radio" id="radioF" name = "gender" value= "F"> 
                <label for="radioF"> 여자</label>
              </div>
            </div>
  
            <!-- 혈액형 입력 -->
            <div class="form_group_ABO">
              <label class="sub_title" for="bloodType" style ="font-size:30px;">나의 혈액형은?</label>
                <div class="Radio">
                  <input value = "A" type="radio" name="bloodType" id="radioA" />
                  <label for="radioA">A형</label>
                </div>
                <div class="Radio">
                  <input value = "B" type="radio" name="bloodType" id="radioB"/>
                  <label for="radioB">B형</label>
                </div>
                  <div class="Radio">
                  <input value = "AB" type="radio" name="bloodType" id="radioAB" />
                  <label for="radioAB">AB형</label>
                </div>
                  <div class="Radio">
                  <input value = "O" type="radio" name="bloodType" id="radioO"/>
                  <label for="radioO"> O형</label>
                </div>
            </div>
            
            <!-- 카카오 로그인시 받을 고유 카카오아이디(숫자) -->
            <input type="hidden" name="kakaoNo" id="kakaoNo">
  
            <!-- 회원가입버튼 -->
            <br><br>
            <div class = "welcome">
              <button class="text" type="submit" id="welcome">Welcome!</button>
            </div>
            
            <!-- 회원가입 종류(일반, 카카오 등..) -->
            <input type="hidden" id="type" value="<%= type %>">
            
          </div> 
        </form>
        
        <!-- 간편 회원가입 -->
        <div class="btnLink" style="display: none;">
          <button><a href="javascript:kakaoLogin();"> <img src="./resources/images/카톡로고.png" alt="카톡간편연동"></a> </button>
        </div>
        
        <script>
          window.Kakao.init('9379dc5e745ff90c58be373c9bbaaa72');
          console.log(Kakao.isInitialized());
          var type = document.getElementById('type').value;
          
          $(function(){
            if(type === 'kakao'){
              console.log("자동입력")
              kakaoLogin();
            }else{
            	console.log("안됨")
            }
          })
      
          function kakaoLogin() {
            Kakao.Auth.login({
                success: function (authObj) {
                    console.log(authObj); // access토큰 값
                    Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

                    Kakao.API.request({
                        url: '/v2/user/me',
                        success: function (res) {
                            console.log(res);
                            
                            var id = res.id;
                            var email = res.kakao_account.email;
                            var gender = res.kakao_account.gender;
                            var name = res.kakao_account.name;
                            var phone = '0'+res.kakao_account.phone_number.substr(4);
                            var birthday = res.kakao_account.birthday;
                            var birthyear = res.kakao_account.birthyear;
                            
                            var str = birthyear+'-'+birthday.substr(0,2)+'-'+birthday.substr(2)
                            
                            $('input#email').val(email);
                            $('input#name').val(name);
                            if(gender == 'male'){
                              $(":radio[name='gender'][value='M']").attr('checked', true);
                            }else{
                              $(":radio[name='gender'][value='F']").attr('checked', true);
                            }
                            $('input#phone').val(phone);
                            $('input#birthdate').val(str);
                            $('input#kakaoNo').val(id);
                          },
                        fail: function (error) {
                            alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
                        }
                    });
                        },
                fail: function (err) {
                    console.log(err);
                }
            });
      
          }

        </script>
        

	
     </div>
 

    </div>
    </div>

  </div>

</body>



</html>
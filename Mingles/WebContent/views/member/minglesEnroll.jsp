<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	String errorMsg = (String)session.getAttribute("errorMsg");
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

  <!-- https://animate.style/ 웹사이트 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

  <script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script defer src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- 내부파일 -->
  <script src="./resources/js/mingle-join.js"></script>
  <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <link rel="icon" href="./resources/images/Mingles아이콘-removebg-preview.png">
  <link rel="stylesheet" href="resources/css/mingle-join.css">

</head>

<body>

  <div id="wrap">
  
    <!-- 메인 화면 -->
    <div id="container">
      
      <!-- 애니메이션 배경 화면 -->
      <img class="background" src="https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExcnNpeng2dTFhbnExeHlpMG5kN3k5eXYzcHFvMXJhcmJvM3BpOGllcSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/l0CRCxtNyUteI6hI4/giphy.webp" alt="">

      <!-- 애니메이션 효과 화면 -->
      <div class="animate__animated animate__zoomInDown">

       <!-- 회원가입 화면 -->
      <div class="form_area" id="basicInfoForm">

        <p class="title">회원 가입</p>
      <form action="<%=request.getContextPath()%>/insert.mi">
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
          <button class = "verification">
            <span class="text">본인인증</span>
          </button>
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

        <!-- 성별 입력 -->
        <div class="form_group form_gender">
          <label class="sub_title" for="gender">성별</label>

          <input class="form_style_gender" type="radio" id="radioM" name = "gender" value= "M" checked> <label for="radioM"> 남자</label>
          <input class="form_style_gender" type="radio" id="radioF" name = "gender" value= "F"> <label for="radioF"> 여자</label>

        </div>
        
        <!-- 추가정보 입력버튼 -->
        <div>
          <button class="btn" type = "button" id = "moreInfo" onclick ="moreInfo()">추가 정보 입력</button>
        </div>

        <!-- 추가정보 입력화면 -->
        <div class="form_area" id="moreInfoForm">
          <p class="title">추가정보</p>
            <!-- 별자리 입력 -->
           <div class="form_group_2">
              <label class="sub_title" for="zodiacType" style ="font-size:30px;">나의 별자리는?</label>
              <select name="zodiacType" id="zodiac" class ="select">
                <option value="null">선택안함</option>
                <option value="aries">양자리</option>
                <option value="taurus">황소자리</option>
                <option value="gemini">쌍둥이자리</option>
                <option value="cancer">게자리</option>
                <option value="leo">사자자리</option>
                <option value="virgo">처녀자리</option>
                <option value="libra">천칭자리</option>
                <option value="scorpio">전갈자리</option>
                <option value="sagittarius">궁수자리</option>
                <option value="capricorn">염소자리</option>
                <option value="aquarius">물병자리</option>
                <option value="pisces">물고기자리</option>
              </select>
            </div> 
  
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
  
            <!-- 회원가입버튼 -->
            <br><br>
            <div class = "welcome">
              <button class="text" type="submit" id="welcome">Welcome!</button>
            </div>
  
        </div>

      </form>
	
     </div>
 

    </div>
    </div>

  </div>

</body>

		<script>

      document.addEventListener("DOMContentLoaded", function(){
        let moreInfo = document.getElementById("moreInfo");
        let moreInfoForm = document.getElementById("moreInfoForm");
        let basicInfoForm = document.getElementById("basicInfoForm");

        moreInfoForm.style.display = "none";

        moreInfo.addEventListener("click",function(){

            moreInfoForm.style.display = "block";
            basicInfoForm.style.display = "none";
         
        });

      })
		</script>

</html>
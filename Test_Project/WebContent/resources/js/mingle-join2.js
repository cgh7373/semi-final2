document.addEventListener("DOMContentLoaded", function(){
  let alertId = document.getElementById("id");
  let alertPwd = document.getElementById("password");
  let alertName = document.getElementById("name");
  let alertPhone = document.getElementById("phone");
  let alertEmail = document.getElementById("email");
  let alertGender = document.getElementsByClassName("form_style_gender");

  // 아이디 필수입력
  alertId.addEventListener("focusout",function(){
    if(alertId.value.trim() === ""){
      alertId.placeholder ="필수 입력항목입니다.";
      alertId.classList.add("error");
    }else{
      alertId.placeholder ="영문으로 시작하는 영문자&숫자 6~20자";
      alertId.classList.remove("error");
    }
  })

  // 아이디 정규화
  let regExp = /^[a-zA-Z][a-zA-Z0-9]{5,19}$/;
  alertId.addEventListener("change", function(){
    if(!regExp.test(alertId.value)){
      swal("올바른 형식의 아이디가 아닙니다.");
      console.log(alertId.value);}
  })

  // 비밀번호 필수입력
  alertPwd.addEventListener("focusout",function(){
    if(alertPwd.value.trim() === ""){
      alertPwd.placeholder ="필수 입력항목입니다.";
      alertPwd.classList.add("error");
    }else{
      alertPwd.placeholder = "영문, 숫자로 구성된 8~16자";
      alertPwd.classList.remove("error");
    }
  })

  //비밀번호 정규화
  regExp = /^[a-zA-Z0-9]{8,16}$/;
  alertPwd.addEventListener("change",function(){
    if(!regExp.test(alertPwd.value)){
      alert("올바른 형식의 비밀번호가 아닙니다.");
    }
  })

  // 이름(닉네임) 필수 입력
  alertName.addEventListener("focusout",function(){
    if(alertName.value.trim() === ""){
      alertName.placeholder = "이름 (닉네임)은 필수 입력입니다.";
      alertName.classList.add("error");
    }else{
      alertName.placeholder = "한글, 영문 사용 8자 이내(특수문자x)";
      alertName.classList.remove("error");
    }
  })

  // 이름(닉네임) 정규화
  regExp = /[가-힣a-zA-Z]{1,8}$/;
  alertName.addEventListener("change",function(){
    if(!regExp.test(alertName.value)){
      alert("올바른 형식의 이름(닉네임)이 아닙니다.");
    }
  })
  
  // 휴대폰 번호 필수 입력
  alertPhone.addEventListener("focusout",function(){
    if(alertPhone.value.trim() === ""){
      alertPhone.placeholder = "회원정보 분실시 복구를 위한 필수항목입니다.";
      alertPhone.classList.add("error");
    }else{
      alertPhone.placeholder = "-없이 입력하세요.";
      alertPhone.classList.remove("error");
    }
  })

  // 휴대폰번호 정규화
  regExp = /^\d{11}$/;
  alertPhone.addEventListener("change",function(){
    if(!regExp.test(alertPhone.value)){
      alert("숫자만 입력해주세요.")
    }
  })

  // 이메일 필수 입력
  alertEmail.addEventListener("focusout",function(){
    if(alertEmail.value.trim() === ""){
      alertEmail.placeholder = "회원정보 분실시 복구를 위한 필수항목입니다.";
      alertEmail.classList.add("error");
    }else{
      alertEmail.placeholder = "이메일을 입력하세요.";
      alertEmail.classList.remove("error");
    }
  })

  // 이메일 정규화
  regExp =  /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  alertEmail.addEventListener("change",function(){
    if(!regExp.test(alertEmail.value)){
      alert("올바른 이메일 형식이 아닙니다.");
    }
  })

  alertGender.addEventListener("DOMContentLoaded",function(){
    if(alertGender.value == ""){
      alert("성별을 표시해주세요");
    }
  })

})

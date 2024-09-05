// 문서가 로드되면 실행될 함수
document.addEventListener('DOMContentLoaded', function() {
    // 정규 표현식 정의
    let idRegExp = /^[a-zA-Z][a-zA-Z0-9]{5,19}$/;
    let passwordRegExp = /^[a-zA-Z0-9]{8,16}$/;
    let nameRegExp = /^[a-zA-Z가-힣]{1,8}$/;
    let phoneRegExp = /^\d+$/; // 간단한 숫자만 허용 (특수문자나 문자 제외)
    let emailRegExp = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // 아이디 입력 필드 선택
    let idField = document.getElementById("id");
    // 비밀번호 입력 필드 선택
    let passwordField = document.getElementById("password");
    // 이름(닉네임) 입력 필드 선택
    let nameField = document.getElementById("name");
    // 휴대폰 번호 입력 필드 선택
    let phoneField = document.getElementById("phone");
    // 이메일 입력 필드 선택
    let emailField = document.getElementById("email");

    // 아이디 입력 필드의 change 이벤트 리스너
    idField.addEventListener("change", function() {
        let idValue = idField.value.trim(); // 공백 제거
        if (!idRegExp.test(idValue)) {
            Swal.fire({
                icon: 'error',
                title: '올바른 형식의 아이디가 아닙니다.',
                text: '아이디는 영문으로 시작해야 하고, 6~20자의 길이를 가져야 합니다.',
            });
        }
    });

    // 비밀번호 입력 필드의 change 이벤트 리스너
    passwordField.addEventListener("change", function() {
        let passwordValue = passwordField.value.trim();
        if (!passwordRegExp.test(passwordValue)) {
            Swal.fire({
                icon: 'error',
                title: '올바른 형식의 비밀번호가 아닙니다.',
                text: '비밀번호는 8~16자의 영문자와 숫자만 포함해야 합니다.',
            });
        }
    });

    // 이름(닉네임) 입력 필드의 change 이벤트 리스너
    nameField.addEventListener("change", function() {
        let nameValue = nameField.value.trim();
        if (!nameRegExp.test(nameValue)) {
            Swal.fire({
                icon: 'error',
                title: '올바른 형식의 이름(닉네임)이 아닙니다.',
                text: '이름(닉네임)은 한글이나 영문으로 8자 이내여야 합니다.',
            });
        }
    });

    // 휴대폰 번호 입력 필드의 change 이벤트 리스너
    phoneField.addEventListener("change", function() {
        let phoneValue = phoneField.value.trim();
        if (!phoneRegExp.test(phoneValue)) {
            Swal.fire({
                icon: 'error',
                title: '올바른 형식의 휴대폰 번호가 아닙니다.',
                text: '휴대폰 번호는 숫자만 입력해야 합니다.',
            });
        }
    });

    // 이메일 입력 필드의 change 이벤트 리스너
    emailField.addEventListener("change", function() {
        let emailValue = emailField.value.trim();
        if (!emailRegExp.test(emailValue)) {
            Swal.fire({
                icon: 'error',
                title: '올바른 형식의 이메일이 아닙니다.',
                text: '유효한 이메일 주소를 입력해 주세요.',
            });
        }
    });
});


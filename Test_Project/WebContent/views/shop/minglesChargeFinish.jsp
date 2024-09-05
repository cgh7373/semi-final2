<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

@font-face {
    font-family: 'omyu_pretty';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
body{
    margin: 0;
}
.wrap{
width: 500px;
height: 800px;
position: relative;
background-color: #fbfcfd;
margin: auto;

}

.content{
    position: absolute;
    margin-top: 250px;
    text-align: center;
    width: 100%;
    height: 60%;
}

.fin-btn{
    width: 80%;
    height:16%;
    border-radius: 10px;
    font-size: 30px;
    font-weight: 700;
    margin-top: 30px;
    background-color: aquamarine;
    border: none;
}

.fin-btn:hover{
    background-color: #68d8d6;
}

.wrap div, .wrap button{
    font-family: 'omyu_pretty';
}

.wrap div{
    font-size: 30px;
    font-weight: 700;
    text-align: center;
    padding-bottom: 20px;
}
</style>
</head>
<body>

    <div class="wrap">
        <div class="content">
            <div>거북알이 성공적으로 충전되었습니다.</div>
            <div>이용해주셔서 감사합니다.</div>
            <button class="fin-btn" onclick="javascript:self.close();">돌아가기</button>
        </div>
    </div>

</body>
</html>
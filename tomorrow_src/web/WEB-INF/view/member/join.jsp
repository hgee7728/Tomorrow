<link href="<%= request.getContextPath() %>/resources/css/header.css" rel="stylesheet" type="text/css">    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내일의 집</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/join.css">
    <style>
        .text {
            border-radius:9px; width: 250px; height: 30px;
        }
        *{text-decoration: none;}
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/view/template_header.jsp"></jsp:include>	
    <section>
    <div class="con">
        <label class="bold1">회원가입</label>
        <hr>
        <div class="div">
        <label class="bold2">아이디</label><br>
        <label class="sp">영문, 숫자를 포함한 3~6자 이하로 입력하세요.</label><br>
        <input type="text" class="id" placeholder"아이디">
        <button class="btn">중복확인</button>

        </div>
        <div class="div">
        <label class="bold2">비밀번호</label><br>
        <span class="sp">영문, 숫자를 포함한 3~6자 이하로 입력하세요.</span><br>
        
        <input type="text" class="input" placeholder="비밀번호"><br>
        </div>
        <div class="div">
        <label class="bold2">비밀번호 확인</label><br>
        <input type="text" class="input" placeholder="비밀번호 확인"><br>
        </div>
        <div class="div">
        <label class="bold2">닉네임</label><br>
        <span class="sp">다른 유저와 겹치지 않는 별명을 입력해주세요. (3~6자)</span><br>
        <input type="text" class="input" placeholder="별명 (3~6자)"><br>
        </div>
        <div class="div">
            <label class="bold2">생년월일</label><br>
            <input type="text" class="input" placeholder="YY/MM/DD"><br>
        </div>
        <div class="div">
            <label class="bold2">연락처</label><br>
            <input type="text" class="input" placeholder="연락처를 입력하세요."><br>
        </div>
        <div class="div">
            <label class="bold2">한줄소개</label><br>
            <span class="sp">한글 10자 이하로 입력하세요.</span><br>
            <input type="text" class="input" placeholder="한줄소개를 입력하세요."><br>
        </div>
        <div class="div">        
        <button class = "btn2">회원가입하기</button>
        <div class="bottom">
        <label class="label2">이미 아이디가 있으신가요?</label>
        <a href="<%=request.getContextPath() %>/login" class="login">로그인</a>
        </div>
    </div>
    </section>
    <div style="display: block"><jsp:include page="/WEB-INF/view/template_footer.jsp"></jsp:include></div>
</body>
</html>
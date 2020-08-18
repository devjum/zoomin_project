<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<title>회원가입 : ZOOMIN - 재능 연결 서비스</title>
</head>
<body>
<script>
	function checkValue(){
		var form = document.join_form;
		if(form.id.value==""){
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return false;
		} if(form.hidden_id.value=="N"){
			alert("아이디 중복확인을 해주세요.")
			form.id.focus();
			return false;
		}
		if(form.pw.value==""){
			alert("비밀번호를 입력해주세요.");
			form.pw.focus();
			return false;
		} if(form.name.value==""){
			alert("이름을 입력해주세요.")
			form.name.focus();
			return false;
		} if(form.pw.value!=form.pw_chk.value){
			alert("비밀번호가 일치하지 않습니다.")
			form.pw_chk.focus();
			return false;
		} if(form.phone2.value==""){
			alert("전화번호를 입력해주세요.")
			form.phone2.focus();
			return false;
		}  if(form.phone3.value==""){
			alert("전화번호를 입력해주세요.")
			form.phone3.focus();
			return false;
		}   if(form.introduce.value==""){
			alert("자기소개를 입력해주세요.")
			form.introduce.focus();
			return false;
		}
		return true;
	}
	
	function checkPw(){
		var form = document.join_form;
		var pw1 = form.pw.value;
		var pw2 = form.pw_chk.value;
		var inputP = document.getElementById("inputPwChk");
		 if(pw1!=pw2){
			inputP.style.color="#f26969";
			inputP.innerHTML = "<i class='xi-close-min'></i> 비밀번호가 일치하지 않습니다.";
		} else {
			inputP.style.color="#64b53c";
			inputP.innerHTML = "<i class='xi-check-min'></i> 비밀번호가 일치합니다.";
		}
	}
	function idCheck()
	{
		var id = document.join_form.id.value;
		var checkT = /^[a-zA-Z0-9]{5,20}$/;
		id=id.trim();
		if(!checkT.test(id)){ alert("아이디는 숫자,영문조합으로 입력해주세요."); return false; }
		if(id.length<5){
			alert("아이디는 5자 이상 입력해주십시오.");
			document.join_form.id.focus;
			return false;
		} else {
			window.open("idCheckOK.do?id="+id, "idCheckOK", "width=400, height=300");
		}
	}
	function idInput(){
		document.getElementById("inputIdChk").innerHTML="";
		document.join_form.hidden_id.value="N";
	}
	function numberMaxLength(e){
		if(e.value.length > e.maxLength){
			e.value = e.value.slice(0, e.maxLength);
		}
	}
	

	
</script>
    <div class="logoJoin">
        <a href="../index.do">
            <img src="${pageContext.request.contextPath}/resources/img/logo_b.png" />
        </a>
    </div>
    <section>
        <div id="join_box">
            <h1><span>Zoom-in</span> 회원가입</h1>
            <form name="join_form" method="post" action="joinOK.do" onsubmit="return checkValue()">
                <div class="join_chk">
                    <input type="radio" name="member" id="general" value="general" checked />
                    <label for="general">일반회원</label>
                    <input type="radio" name="member" id="artist" value="artist" />
                    <label for="artist">아티스트회원</label>
                </div>
                <label>아이디</label>
                <div class="id_wrap">
                    <input type="text" name="id" placeholder="아이디를 입력하세요." onkeydown="idInput()">
                    <input type="button" class="idBtn" value="중복확인" onclick="idCheck(this)">
                    <p id="inputIdChk"> </p>
                    <input type="hidden" name="hidden_id" value="N">
                </div>
                <label>비밀번호</label>
                <input type="password" name="pw" placeholder="비밀번호를 입력하세요.">
                <input class="pw_chk" type="password" name="pw_chk" placeholder="비밀번호를 한번 더 입력하세요." onkeyup="checkPw()">
                <p id="inputPwChk"> </p>
                <label>이름</label>
                <input type="text" name="name" placeholder="이름을 입력하세요.">
                <label>휴대전화</label>
				<input type="number" name="phone1" value="010">
                <span class="phoneBar">-</span><input type="number" name="phone2" maxlength="4" oninput="numberMaxLength(this)"><span class="phoneBar">-</span><input type="number" name="phone3"maxlength="4" oninput="numberMaxLength(this)">
                <label>자기소개</label>
                <textarea name="introduce" placeholder="자기소개를 입력하세요."></textarea>
                <button class="join_btn" type="submit">가입완료</button>
            </form>
            
        </div>
        <p class="join_t">Zoom-in은 회원님의 원활한 서비스 이용에 필요한 정보를<br>
            적절한 전자적 수단을 통해 제공하고 있습니다.</p>
    </section>
    <script>
    	
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<title>마이페이지 : ZOOMIN - 재능 연결 서비스</title>
</head>
<body>
<script>
function fnChkByte(obj) {
    var maxByte = 250; //최대 입력 바이트 수
    var str = obj.value;
    var str_len = str.length;
 
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";
 
    for (var i = 0; i < str_len; i++) {
        one_char = str.charAt(i);
 
        if (escape(one_char).length > 4) {
            rbyte += 2; //한글2Byte
        } else {
            rbyte++; //영문 등 나머지 1Byte
        }
 
        if (rbyte <= maxByte) {
            rlen = i + 1; //return할 문자열 갯수
        }
    }
 
    if (rbyte > maxByte) {
        alert("한글 " + ( maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
        str2 = str.substr(0, rlen); //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
    } else {
        document.getElementById('byteInfo').innerText = rbyte;
    }
    
}
function withdrawAlert(){
	var result = confirm("정말 탈퇴 하시겠습니까?");
	if(result){
		location.href="dropUser.do";
	}
}
</script>
	<%@ include file="/resources/common/sub_header.jsp" %>
	<div class="wrapper">
		<form method="post" action="modifyInOK.do" class="register_form">
		    <div id="edit_wrap">
		        <h2><span>회원정보</span> 수정</h2><a href="javascript:void(0)" class="inquiryLi_btn" onclick="withdrawAlert()">회원탈퇴</a>
		        <p>회원정보는 정확하게 입력해주세요.</p>
		        <h3 class="userModih3">이름</h3><input type="text" name="name" value="${ userInfo.name }">
		        <h3 class="userModih3">휴대전화</h3>
				<input type="number" name="phone1" value="010" readonly>
                <span class="phoneBar"> - </span><input type="number" name="phone2" value="${ userInfo.phone.substring(3,7) }"><span class="phoneBar"> - </span><input type="number" name="phone3" value="${ userInfo.phone.substring(7,11) }">
		        <textarea class="introduce_modify" name="introduce" rows="10" cols="100" onkeyup="fnChkByte(this);">${ userInfo.introduce }</textarea>
		        <p class="byte_guide">한글 250자까지 입력 가능합니다.</p>
		    </div>
		    <input type="hidden" name="id" value="${ userInfo.id }">
		    <div class="edit_btn">
		    	<a href="mypage.do" class="w_btn">취소</a>
		    	<input type="submit" class="b_btn" value="소개글 수정">
		    </div>
	    </form>
    </div>
    <%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
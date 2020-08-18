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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat|Noto+Sans+KR:300,400,500,700,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<title>관리자페이지 : ZOOMIN - 재능 연결 서비스</title>
<script>
$(document).ready(function(){
	if( ${ param.loginChk eq 'N' }){
		$('.loginFail').append('아이디와 비밀번호를 다시 입력해주세요.');
	};
	if(${ userInfo.member eq 'admin'}){
		location.href="admin.do";
	}
});

</script>
</head>
<body>
	<section class="admLogin">
			<div class="logoLogin">
		        <a href="../index.do">
		            <img src="${pageContext.request.contextPath}/resources/img/logo_b.png" />
		        </a>
		    </div>
		<div class="admLoginWrap">
			<h1><span>관리자</span> 로그인</h1>
			<form action="adminLoginOK.do" method="post">
				<h2>아이디</h2>
				<input type="text" name="id" placeholder="ID">
				<h2>비밀번호</h2>
				<input type="password" name="pw" placeholder="PW">
				<span class="loginFail"></span>
				<input type="submit" value="로그인">
			</form>
		</div>
	</section>
</body>
</html>
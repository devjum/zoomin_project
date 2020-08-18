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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,400,500,700,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<title>관리자페이지 : ZOOMIN - 재능 연결 서비스</title>
<body>
<div class="admin_wrap">
<script>
if(${userInfo == null}||${ userInfo.member != 'admin'}){
	location.href="adminLogin.do";
}
</script>
        <div class="admin_tab">
            <div class="my_info">
                <div class="info_img">
                    	프로필사진
                </div>
                <p>안녕하세요.<br> <span> ${ userInfo.name }</span> 님!</p>
                <a href="../logout.do">로그아웃</a>
            </div>
            <div class="admin_tabArea">
	            <a href="userAdmin.do">회원관리</a>
	            <a href="bTalent.do">게시판관리</a>
	            <!-- <a href="reserveAdmin.do">예약관리</a>
	            <a href="staticAdmin.do">통계</a> -->
            </div>
        </div>
</body>
</html>
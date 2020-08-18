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
<title>Insert title here</title>
</head>
<body>
<div class="idChkWrap">
	<h1>ID 중복확인</h1>
	<c:choose>
	<c:when test="${ cnt == 0 }">
	입력 ID <span>${param.id}</span> <br/>
	<p>사용가능한 아이디입니다.</p><br/>
	<a class="applyBtn" href="javascript:apply('${ param.id }')">적용</a>
	<script>
	function apply(id){
		opener.document.getElementById("inputIdChk").innerHTML="<i class='xi-check'></i>";
		opener.document.join_form.hidden_id.value="Y";
		opener.document.join_form.id.value=id;
		window.close(); //창닫기
	}
	</script>
	</c:when>
	<c:otherwise>
		<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>
	</c:otherwise>
	</c:choose>
	<a href="javascript:window.close()" class="cancelBtn">취소</a>
</div>
</body>
</html>
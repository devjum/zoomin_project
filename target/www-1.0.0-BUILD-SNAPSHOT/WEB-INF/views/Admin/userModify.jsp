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
</head>
<body>
<%@ include file="/resources/common/admHeader.jsp" %>
<%@ include file="/resources/common/admLnb.jsp" %>

<section class="admin_con01">
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

</script>
		<form method="post" action="userModifyOK.do" class="register_form">
			<h2><span>회원정보</span> 관리</h2>
			<div class="admin_table modify_table">
			    <table>
			    	<colgroup>
			    		<col width="10%">
			    		<col width="20%">
			    		<col width="10%">
			    		<col width="20%">
			    		<col width="10%">
			    		<col width="30%">
			    	</colgroup>
			    	<tr>
			    		<th>회원분류</th>
			    		<td>
			    			<c:choose>
			    				<c:when test="${ userModifyInfo.member eq 'artist' }">아티스트</c:when>
			    				<c:when test="${ userModifyInfo.member eq 'general' }">일반회원</c:when>
			    			</c:choose>
			    		</td>
			    		<th>ID</th>
			    		<td>${ userModifyInfo.id }</td>
			    		<th>가입날짜</th>
			    		<td>${ userModifyInfo.join_date }</td>
			    	</tr>
			    	<tr>
			    		<th>이름</th>
			    		<td><input type="text" name="name" value="${ userModifyInfo.name }"></td>
			    		<th>휴대폰번호</th>
			    		<td class="phoneInput" colspan="3"><input type="text" name="phone1" value="${ userModifyInfo.phone.substring(0,3) }"> - <input type="text" name="phone2" value="${ userModifyInfo.phone.substring(3,7) }"> - <input type="text" name="phone3" value="${ userModifyInfo.phone.substring(7,11) }"> </td>
			    	</tr>
			    	<tr>
			    		<th>프로필 사진</th>
			    		<td class="table_profileImg" colspan="5">
			    			<c:choose>
			    				<c:when test="${ userModifyInfo.img eq 'my_img.png' }">
			    					등록된 프로필 사진 없음
			    				</c:when>
			    				<c:otherwise>
			    					<img src="/upload/${ userModifyInfo.img }" alt="회원프로필 사진">
			    				</c:otherwise>
			    			</c:choose>
			    		</td>
			    	</tr>
			    	<tr>
			    		<th>자기소개</th>
			    		<td colspan="5"><textarea rows="10" cols="100" name="introduce">${ userModifyInfo.introduce }</textarea></td>
			    	</tr>
			    </table>
			    <input type="hidden" name="id" value="${ userModifyInfo.id }">
			    <div class="edit_btn">
			    	<a href="userAdmin.do" class="w_btn">취소</a>
			    	<input type="submit" class="b_btn" value="소개글 수정">
			    </div>
		    </div>
	    </form>
	    
</section>

<%@ include file="/resources/common/admFooter.jsp" %>
</body>
</html>
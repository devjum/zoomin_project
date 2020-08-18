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
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<title>재능예약 : ZOOMIN - 재능연결서비스</title>
</head>
<body>
<%@ include file="/resources/common/sub_header.jsp" %>
<script>
	function alertChk(){
		var result = confirm("예약신청글을 삭제하시겠습니까?");
		if(result) {
			location.href="reserveDelete.do?no="+${ reserveDto.no };
		}
	}
</script>
<div class="reserve wrapper">
        <div class="reserveWrap con_box">
			<c:if test="${ reserveDto.status eq '신청대기' }">
				<span class="reStatus current_w">${ reserveDto.status }</span>
			</c:if>
			<c:if test="${ reserveDto.status eq '공연확정' }">
				<span class="reStatus current_c">${ reserveDto.status }</span>
			</c:if>
            <h3>${ reserveDto.perName}</h3>
            <table class="reserveTable">
        	<tr>
        		<th>공연장소</th>
        		<td colspan="7" class="table_l">${ reserveDto.perPlace }</td>
        	</tr>
        	<tr>
        		<th>공연날짜</th>
        		<td>${ reserveDto.perDate.substring(0,10) }</td>
        		<th>공연시간</th>
        		<td>
        			<c:if test="${reserveDto.perTime.substring(0,2)>=13}">PM ${ reserveDto.perTime.substring(0,2)-12 }${ reserveDto.perTime.substring(2,5) }</c:if>
        			<c:if test="${reserveDto.perTime.substring(0,2)<13}">AM ${ reserveDto.perTime.substring(0,5) }</c:if>
        			</td>
        		<th>금액</th>
        		<td colspan="3" class="table_l">${ reserveDto.price } </td>
        	</tr>
        	<tr>
        		<th>분류</th>
        		<td>${ reserveDto.categorize }</td>
        		<th>아티스트</th>
        		<td>${ reserveDto.name }</td>
        		<th>섭외담당자</th>
        		<td>${ reserveDto.id }</td>
        		<th>담당자연락처</th>
        		<td>${ userInfo.phone }</td>
        		
        	</tr>
        	<tr>
        		<td colspan="8" class="table_l"><pre>${ reserveDto.perDetail }</pre></td>
        	</tr>
        </table>
        </div>
        
        

        </div>
        <div class="wrapper">
        <div class="edit_btn">
            <a class="w_btn" href="../User/mypage.do">돌아가기</a>
            <c:if test="${ reserveDto.status eq '신청대기' }">
	            <a href="reserveModify.do?no=${ reserveDto.no }"><input class="b_btn" type="button" value="수정"></a>
				<button onclick="alertChk()"><input class="b_btn" type="button" value="삭제"></button>
			</c:if>
        </div>
        </div>
    </div>
   <%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
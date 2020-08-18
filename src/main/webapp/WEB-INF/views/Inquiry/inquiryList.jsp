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
<title>문의하기 : ZOOMIN - 재능 연결 서비스</title>
</head>
<body>

<%@ include file="/resources/common/sub_header.jsp" %>
	<div class="inquiry_list wrapper">
        <h2>나의 문의내역</h2>
        <table>
            <thead>
                <tr>
                    <th style="width:15%;">구분</th>
                    <th>제목</th>
                    <th style="width:15%;">작성일</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${ list eq '[]' }">
            	<tr><td colspan="3">작성된 문의글이 없습니다.</td></tr>
            </c:if>
            <c:forEach items="${ list }" var="list">
                <tr>
                    <td>${ list.categorize }</td>
                    <td class="table_l inquiry_i"><a href="inquiryView.do?no=${ list.no }">
                    	<c:choose>
                    		<c:when test="${ list.replyok.equals('답변미완료') }"><span class="inquiry_in"></c:when>
                    		<c:when test="${ list.replyok.equals('답변완료') }"><span class="inquiry_com"></c:when>
                    	</c:choose>
                    ${ list.replyok }</span>${ list.title }</a></td>
                    <td>${ list.wdate.substring(0,10) }</td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="wrapper">
	        <div class="edit_btn">
	        	<a href="inquiryWrite.do"><input class="b_btn" type="button" value="문의하기"></a>
	    	</div>
    	</div>
    </div>
<%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
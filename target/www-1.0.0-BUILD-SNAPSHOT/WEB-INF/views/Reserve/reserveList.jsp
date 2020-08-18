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
<title>재능예약 : ZOOMIN - 재능 연결 서비스</title>
</head>
<body>

<%@ include file="/resources/common/sub_header.jsp" %>
	<div class="inquiry_list wrapper">
        <h2>나의 공연신청 현황 리스트</h2>
        <table>
            <thead>
                <tr>
                    <th>구분</th>
                    <th>아티스트</th>
                    <th>공연명</th>
                    <th>공연일</th>
                    <th>신청일</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${ reserveList eq '[]' }">
            	<tr><td colspan="3">작성된 문의글이 없습니다.</td></tr>
            </c:if>
            <c:if test="${ reserveList ne '[]' }">
            	<c:forEach var="list" items="${ reserveList }">
                <tr>
                		<td>${ list.status }</td>
                		<td>${ list.name }</td>
                		<td class="table_l"><a href="reserveView.do">${ list.perName }</a></td>
                		<td>${ list.perDate.substring(0,10) }</td>
                		<td>${ list.wDate.substring(0,10) }</td>
                </tr>
                </c:forEach>
              </c:if>
            </tbody>
        </table>
        <div class="wrapper">
	        <div class="edit_btn">
	        	<a href="inquiryWrite.jsp"><input class="b_btn" type="button" value="문의하기"></a>
	    	</div>
    	</div>
    </div>
<%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
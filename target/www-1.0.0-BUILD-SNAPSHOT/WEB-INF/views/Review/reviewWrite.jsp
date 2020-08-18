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
<title>후기작성 : ZOOMIN - 재능 연결 서비스</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/review.js"></script>
<%@ include file="/resources/common/sub_header.jsp" %>
    <div id="edit_wrap">
       <h2><span>${ tDto.name }</span>님의 공연은 어떠셨나요?</h2>
       <p>완료된 공연과 아티스트에 대한 후기를 남겨주세요. </p>
        <form name="review_form" class="inquiry_form" action="reviewWriteOK.do" method="post" onsubmit="return checkValue()">
            <table>
            	<colgroup>
            		<col width="7%">
            		<col width="93%">
            	</colgroup>
                <tr>
                    <td>평점<span class="form_red">*</span></td>
                    <td>
                    	<select name="score">
                    		<option>선택</option>
                    		<option value="1">1</option>
                    		<option value="2">2</option>
                    		<option value="3">3</option>
                    		<option value="4">4</option>
                    		<option value="5">5</option>
                    	</select>
                    </td>
                </tr>
            </table>
            <textarea rows="15" cols="100" name="review" placeholder="후기 내용을 입력하세요."></textarea>
    </div>
    <div class="wrapper">
	    <div class="edit_btn">
	    	<a class="w_btn" href="../User/mypage.do">돌아가기</a>
	    	<input type="hidden" name="t_no" value="${ tDto.no }"/>
	    	<input type="hidden" name="r_no" value="${ param.r_no }"/>
	    	<input type="hidden" name="id" value="${userInfo.id }"/>
	        <input class="b_btn" type="submit" value="후기쓰기">
	    </div>
    </div>
    </form>
<%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
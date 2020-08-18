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
<title>문의하기 : ZOOMIN - 재능 연결 서비스</title>
</head>
<body>
<script src="${pageContext.request.contextPath}/resources/js/inquiry.js"></script>
<%@ include file="/resources/common/sub_header.jsp" %>
    <div id="edit_wrap">
       <h2><span>Zoom-in</span> 에게 문의하기</h2><a href="inquiryList.do" class="inquiryLi_btn">지난 문의내역</a>
       <p>문의내용을 남겨주시면, 내용을 상세히 검토 후 최선을 다해 친절히 상담을 도와드리겠습니다.</p>
        <form name="inquiry_form" class="inquiry_form" action="inquiryWriteOK.do" method="post" enctype="multipart/form-data" onsubmit="return checkValue()">
            <table>
            	<colgroup>
            		<col width="7%">
            		<col width="93%">
            	</colgroup>
                <tr>
                    <td>분류<span class="form_red">*</span></td>
                    <td>
                    	<select name="categorize">
                    		<option>선택</option>
                    		<option value="결제">결제</option>
                    		<option value="재능서비스">재능서비스</option>
                    		<option value="홈페이지">홈페이지</option>
                    		<option value="기타">기타</option>
                    	</select>
                    </td>
                </tr>
                <tr>
                    <td>제목<span class="form_red">*</span></td>
                    <td><input style="width:100%" type="text" name="title"/></td>
                </tr>
            </table>
            <textarea rows="15" cols="100" name="content" placeholder="문의 내용을 입력하세요."></textarea>
        
        <button class="fileadd"><input type="file" name="file" class="fileA"></button><br><span class="form_red">※ 10MB 이하의 파일만 첨부하실 수 있습니다.</span>
    </div>
    <div class="wrapper">
	    <div class="edit_btn">
	    	<a class="w_btn" href="inquiryWrite.do">돌아가기</a>
	        <input class="b_btn" type="submit" value="문의하기">
	    </div>
    </div>
    </form>
<%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
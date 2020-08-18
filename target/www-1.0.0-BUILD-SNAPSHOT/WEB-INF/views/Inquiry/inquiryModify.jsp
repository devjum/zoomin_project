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
<title>문의하기 : ZOOMIN - 재능연결서비스</title>
</head>
<body>
<%@ include file="/resources/common/sub_header.jsp" %>
    <div id="edit_wrap">
       <h2><span>문의</span> 수정하기</h2>
       <p>문의내용을 남겨주시면, 내용을 상세히 검토 후 최선을 다해 친절히 상담을 도와드리겠습니다.</p>
        <form class="inquiry_form" action="inquiryModifyOK.do" method="post" enctype="multipart/form-data">
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
                    		<option value="결제" <c:if test="${ (dto.categorize).equals('결제') }"> selected </c:if>>결제</option>
                    		<option value="재능서비스" <c:if test="${ (dto.categorize).equals('재능서비스') }"> selected </c:if>>재능서비스</option>
                    		<option value="홈페이지" <c:if test="${ (dto.categorize).equals('홈페이지') }"> selected </c:if>>홈페이지</option>
                    		<option value="기타" <c:if test="${ (dto.categorize).equals('기타') }"> selected </c:if>>기타</option>
                    	</select>
                    </td>
                </tr>
                <tr>
                    <td>제목<span class="form_red">*</span></td>
                    <td><input type="text" name="title" value="${ dto.title }" style="width:100%"/></td>
                </tr>
            </table>
            <textarea rows="15" cols="100" name="content" placeholder="문의 내용을 입력하세요."> ${ dto.content }</textarea>
        <span> ${dto.filename }</span>
        <button class="fileadd"><input type="file" name="file"></button><br>
        <span class="form_red">※ 10MB 이하의 파일만 첨부하실 수 있습니다.</span>
        <input type="hidden" name="filename" value="${ dto.filename }"/>
        <input type="hidden" name="no" value="${ dto.no }"/>
    </div>
    <div class="wrapper">
	    <div class="edit_btn">
	    <a class="w_btn" href="inquiryList.do">목록</a>
	        <input class="b_btn" type="submit" value="수정하기">
	    </div>
    </div>
    </form>
<%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
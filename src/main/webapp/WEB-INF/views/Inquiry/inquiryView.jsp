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
<title>문의하기 : ZOOMIN - 재능 연결 서비스</title>
</head>
<body>
<%@ include file="/resources/common/sub_header.jsp" %>
<script>
	function alertChk(){
		var result = confirm("문의글을 삭제하시겠습니까?");
		if(result) {
			location.href="inquiryDelete.do?no="+${ dto.no };
		}
	}
</script>
<div class="inquiry wrapper">
        <div class="inquiry_q qc con_box">
			<c:if test="${ dto.replyok eq '답변미완료' }">
				<span class="inquiry_in">${ dto.replyok }</span>
			</c:if>
			<c:if test="${ dto.replyok eq '답변완료' }">
				<span class="inquiry_com">${ dto.replyok }</span>
			</c:if>
            <h3>[${ dto.categorize }] ${ dto.title }</h3>
            <span class="q_id">${ dto.name } (${ dto.id })</span>
            <span class="q_date">${ dto.wdate.substring(0,10) } </span>
            <div class="q_text"><pre>${ dto.content }</pre></div>
            <c:if test="${ dto.filename!=null }"><div class="fileAttached"><a href="/upload/${ dto.filename }" download><i class="xi-attachment"></i>&nbsp; ${ dto.filename }</a></div></c:if>
        </div>
        <c:choose>
        	<c:when test="${ answer ne null }">
		         <div class="inquiry_a con_box">
		            <h3><span>답변 : </span>${ answer.title }</h3>
		            <span class="a_id">${ answer.name }</span><span class="q_date">${ answer.wdate.substring(0,10) } </span>
		            <div class="a_text">
						<pre>${ answer.content }</pre>
		            </div>
		        </div>
		        <div class="wrapper">
			        <div class="edit_btn">
			            <a class="w_btn" href="inquiryList.do">목록으로</a>
			        </div>
		        </div>
        	</c:when>
        	<c:when test="${ answer eq null }">
        		<div class="wrapper">
			        <div class="edit_btn">
			            <a class="w_btn" href="inquiryList.do">목록으로</a>
			            <a href="inquiryModify.do?no=${ dto.no }"><input class="b_btn" type="button" value="수정"></a>
						<button onclick="alertChk()"><input class="b_btn" type="button" value="삭제"></button>
			        </div>
		        </div>
        	</c:when>
        </c:choose>
    </div>
   <%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
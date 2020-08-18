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
<title>재능예약 : ZOOMIN - 재능연결서비스</title>
</head>

<body>
    <%@ include file="/resources/common/sub_header.jsp" %>

     <% request.setCharacterEncoding("UTF-8"); %>
    <div class="wrapper">
	    <div id="edit_wrap">
	        <h2><span>재능 예약 신청</span> 수정</h2>
	        <p>공연 확정 후에는 정보 수정이 불가능 합니다. 정확한 공연 정보를 입력해주세요.</p>
	       	<form method="post" action="reserveModifyOK.do" class="register_form">
	       		<table>
	       			<colgroup>

	       			</colgroup>
		       		<tr>
		                <td>공연일시<span class="form_red">*</span></td><td><input type="date" name="perDate" value="${ reserveDto.perDate.substring(0,10) }"/></td>
		                <td>공연시간<span class="form_red">*</span></td><td><input type="time" name="perTime" value="${ reserveDto.perTime }"/></td>
		            <tr>
		            	<td>공연장소<span class="form_red">*</span></td>
		            	<td>
	            			<input type="text" name="perPlace" value="${ reserveDto.perPlace }"/>
            			</td>
		            	<td>금액<span class="form_red">*</span></td><td><input type="text" name="price" value="${ reserveDto.price }" readonly/></td>
		            </tr>
		            <tr>
		            	<td>공연명<span class="form_red">*</span></td>
		            	<td colspan="3">
	            			<input type="text" name="perName" value="${ reserveDto.perName }"/>
            			</td>

		            </tr>
		            <tr>
		            	<td colspan="4"><textarea rows="10" cols="100" name="perDetail" placeholder="공연에 관한 정보를 상세히 입력해주세요."> ${ reserveDto.perDetail } </textarea></td>
		            </tr>
	   			</table>
	   			<input type="hidden" name="no" value="${ param.no }"/>
	   			<input type="hidden" name="phone" value="${ userInfo.phone }">
	   			<input type="hidden" name="id" value="${ userInfo.id }">
		   		<div class="edit_btn">
			    	<a class="w_btn" href="mypage.do">취소</a>
			        <input class="b_btn" type="submit" value=예약수정>
	    		</div>
	    		</form>
	    </div>
	    
    </div>
<%@ include file="/resources/common/footer.jsp" %>
</body>

</html>
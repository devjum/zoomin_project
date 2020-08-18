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
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<title>관리자페이지 : ZOOMIN - 재능 연결 서비스</title>
<script src="${pageContext.request.contextPath}/resources/js/admUser.js"></script>
</head>
<body>
<%@ include file="/resources/common/admHeader.jsp" %>
<%@ include file="/resources/common/admLnb.jsp" %>

<section class="admin_con02">
            <h2>문의게시판 답변</h2>

<div class="admin_inquiry">
                <div class="inquiry_q qi con_box">
					<c:if test="${ qDto.replyok eq '답변미완료' }">
						<span class="inquiry_in">${ qDto.replyok }</span>
					</c:if>
					<c:if test="${ qDto.replyok eq '답변완료' }">
						<span class="inquiry_com">${ qDto.replyok }</span>
					</c:if>
                    <h3>[ ${ qDto.categorize} ] ${ qDto.title }</h3>
                    
                    <span class="q_name">
                    	<c:if test="${ qDto.member eq 'artist'}">[ 아티스트 ]</c:if>
                    	<c:if test="${ qDto.member eq 'general'}">[ 일반 ]</c:if>
                    &nbsp;${ qDto.name }</span>
                    <span class="q_name">${ qDto.id }</span>
                    <span class="q_date">${ qDto.wdate.substring(0,10) }</span>
                    <div class="q_text">
                    	<pre>${ qDto.content }</pre>
                    </div>
                    <c:if test="${ qDto.filename!=null }"><div class="fileAttached"><a href="/upload/${ qDto.filename }" download><i class="xi-attachment"></i>&nbsp; ${ qDto.filename }</a></div></c:if>
                </div>
                <c:choose>
                	<c:when test="${ qDto.replyok eq '답변미완료' }">
		                <div class="inquiry_a con_box">
		                    <div id="edit_wrap">
		                        <h2>문의답변</h2>
		                        <form class="inquiry_form" action="inquiryReOK.do" method="post">
		                            <table>
		                            	<colgroup>
		                            		<col width="8%">
		                            		<col width="92%">
		                            	</colgroup>
		                                <tr>
		                                    <td>제목<span>*</span></td>
		                                    <td><input style="width:100%" type="text" name="title" /></td>
		                                </tr>
		                                <tr>
		                                	<td colspan="2"><textarea placeholder="문의내용에 답변을 입력하세요." name="content"></textarea></td>
		                                </tr>
		                            </table>
		                    </div>
		                    <input type="hidden" name="id" value="admin">
		                    <input type="hidden" name="categorize" value="${ qDto.categorize }">
		                    <input type="hidden" name="groupNum" value="${ qDto.no }">
		                    <input type="hidden" name="replyok" value="관리자답변">
		                    <div class="edit_btn">
		                        <input type="submit" class="b_btn" value="답변작성">
		                        <a href="bInquiry.do" class="w_btn">목록으로</a>
		                    </div>
		                    </form>
		                </div>
                	</c:when>
                	<c:otherwise>
					         <div class="inquiry_a con_box">
					            <h3><span>답변 : </span>${ aDto.title }</h3>
					            <span class="q_name">${ aDto.name }</span><span class="q_date">${ aDto.wdate.substring(0,10) } </span>
					            <div class="a_text">
									<pre>${ aDto.content }</pre>
					            </div>
					        </div>
						        <div class="edit_btn">
						            <a class="w_btn" href="bInquiry.do">목록으로</a>
						        </div>
                	</c:otherwise>
                </c:choose>

            </div>
	            </div>
            </div>
        </section>
<%@ include file="/resources/common/admFooter.jsp" %>
</body>
</html>
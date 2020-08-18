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
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<title>관리자페이지 : ZOOMIN - 재능 연결 서비스</title>
</head>
<body>
<%@ include file="/resources/common/admHeader.jsp" %>
<%@ include file="/resources/common/admLnb.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/adm.js"></script>
<section class="admin_con01">
            <h2>회원관리</h2>
			<div class="sub_tab">
        		<a href="userAdmin.do" class="checked">전체회원</a>
        		<a href="artistAdmin.do">아티스트 회원</a>
        		<a href="generalAdmin.do">일반 회원</a>
        	</div>
            <div class="admin_table">
            	<div class="allUserWrap listWrap">
	            	<div>
		            	<div class="user_num">
		                	<h3>총 회원수 <span>${ pageCnt.totalCnt }</span>명</h3>
		            	</div>
		            	<form method = "post" action="userAdmin.do" class="search">
								<select name="searchCondition">
									<option value="searchId" <c:if test="${search.searchCondition eq 'searchId'}">selected</c:if> >아이디</option>
									<option value="searchName"<c:if test="${search.searchCondition eq 'searchName'}">selected</c:if>>이름</option>
								</select>
							<input type="text" name="searchKeyword" value="${search.searchKeyword}">
							<input type="submit" value="검색">
						</form>	
					</div>
					<form action="selectUserDelete.do" method="post" onsubmit="return delAlert('회원')">
                <table>
                    <thead>
                        <tr>
                            <th style="width:3%;"><input type="checkbox" id="checkAll"/></th>
                            <th style="width:5%;">번호</th>
                            <th style="width:10%">분류</th>
                            <th style="width:30%;">이름( 아이디 )</th>
                            <th style="width:20%">휴대전화</th>
                            <th style="width:12%;">가입일</th>
                            <th style="width:10%;">관리</th>
                        </tr>
                    </thead>
                    <tbody class="table_c">
                    	<c:forEach var="allUserList" items="${ allUserList }" varStatus="allStatus">
                        <tr>
                            <td><input type="checkbox" name="checks" value="${ allUserList.id }"/></td>
                            <td>${ allStatus.count }</td>
                            <td>
                            	<c:if test="${ allUserList.member eq 'artist'}">아티스트</c:if>
                            	<c:if test="${ allUserList.member eq 'general'}">일반회원</c:if>
                            </td>
                            <td class="table_l"><a href="userModify.do?id=${ allUserList.id }">${ allUserList.name } ( ${ allUserList.id } )</a></td>
                            <td>${ allUserList.phone.substring(0,3) }-${ allUserList.phone.substring(3,7) }-${ allUserList.phone.substring(7,11) }</td>
                            <td>${ allUserList.join_date.substring(0,10) }</td>
                            <td class="user_admin_btn"><a href="userModify.do?id=${ allUserList.id }"><i class="xi-pen-o"></i></a><a href="userDelete.do?id=${ allUserList.id }" onclick="return delAlert('회원')"><i class="xi-trash-o"></i></a></td>
                        </tr>
                        </c:forEach>
                        <c:if test="${ allUserList eq null }">
	                        <tr>
	                        	<td colspan="7">게시물이 없습니다.</td>
	                        </tr>
                        </c:if>
                    </tbody>
                </table>
                <div class="btn">
                    <input type="submit" value="선택삭제">
                </div>
                </form>
               </div>
            <div class="pagenation">
	        <c:set var="page" value="${ pageCnt }" />
			<c:if test="${page.curpage eq null }">
				<c:set var="curPage" value="0"/>
			</c:if>
			<c:forEach var="i" varStatus="lst" begin="0" end="${ page.totalpage }" step="1">
				<c:choose>
					<c:when test="${i eq page.curpage}">
						<span>${i+1}</span>
					</c:when>
					<c:otherwise>
						<a href="userAdmin.do?curpage=${i}&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}"">${i+1}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
        </section>
<%@ include file="/resources/common/admFooter.jsp" %>
</body>
</html>
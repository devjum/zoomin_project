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
            <h2>게시판관리</h2>
            <div class="sub_tab">
        		<a href="bTalent.do">재능리스트</a>
        		<a href="bInquiry.do" class="checked">문의게시판</a>
        	</div>

            <div class="admin_table">

	            <div class="inquiryList listWrap">
	            	<div>
			        	<div class="user_num">
			            	<h3>총 게시글 <span>${ itotalCnt }</span>개</h3>
			            </div>
			            <form method = "post" action="bInquiry.do" class="search">
							<select name="kindOfSearch">
								<option value="searchTitle">회원아이디</option>
								<option value="searchTitleAndContents">회원이름</option>
								<option value="searchId">제목+내용</option>
							</select>
							<input type="text" name="searchKeyword">
							<input type="submit" value="검색">
						</form>	
					</div>
	                <table>
	                	<colgroup>
								<col style="width:3%"/>
	                            <col style="width:5%"/>
	                            <col style="width:15%"/>
	                            <col style="width:10%"/>
	                            <col style="width:47%"/>
	                            <col style="width:10%"/>
	                            <col style="width:10%"/>
	                            <col style="width:10%"/>
						</colgroup>
	                    <thead>
	                        <tr>
	                            <th><input type="checkbox" /></th>
	                            <th>번호</th>
	                            <th>답변여부</th>
	                            <th>분류</th>
	                            <th>제목</th>
	                            <th>작성자</th>
	                            <th>작성일</th>
	                            <th>관리</th>
	                        </tr>
	                    </thead>
	                    <tbody class="table_c">
	                    	<form action="selectInquiryDelete.do" method="post"  onsubmit="return delAlert('재능등록글')">
	                    	<c:forEach var="inquiryList" items="${ inquiryList }" varStatus="inStatus">
	                        <tr>
	                            <td><input type="checkbox" name="checks" value="${ inquiryList.no }"/></td>
	                            <td>${inStatus.count}</td>
	                            <td>
	                            	<c:if test="${ inquiryList.replyok eq '답변미완료' }">
										<span class="inquiry_in">${ inquiryList.replyok }</span>
									</c:if>
									<c:if test="${ inquiryList.replyok eq '답변완료' }">
										<span class="inquiry_com">${ inquiryList.replyok }</span>
									</c:if>
	                            </td>
	                            <td>${ inquiryList.categorize }</td>
	                            <td class="table_l ellipsisTd"><a href="inquiryRe.do?no=${ inquiryList.no }">${ inquiryList.title }</a></td>
	                            <td>${ inquiryList.id }</td>
	                            <td>${ inquiryList.wdate.substring(0,10) }</td>
	                            <td class="user_admin_btn"><a href="inquiryRe.do?no=${ inquiryList.no }"><i class="xi-subdirectory-arrow"></i></a><a href="inquiryDelete.do?no=${ inquiryList.no }" onclick="return delAlert()"><i class="xi-trash-o"></i></a></td>
	                        </tr>
	                        </c:forEach>
	                    </tbody>
	
	                </table>
	                <div class="btn">
	                    <input type="submit" value="선택삭제">
	                </div>
	                </form>
	                <div class="pagenation">
			        <c:set var="curPage" value="${param.curPage }" />
					<c:if test="${curPage eq null }">
						<c:set var="curPage" value="0"/>
					</c:if>
					<c:forEach var="i" varStatus="lst" begin="0" end="${ inTotalPage }" step="1">
						<c:if test="${i eq curPage}">
							<span>${i+1}</span>
						</c:if>
						<c:if test="${i ne curPage}">
							<a href="admBoard_inquiry.do?curPage=${i}">${i+1}</a>
						</c:if>
					</c:forEach>
				</div>
	            </div>
            </div>
        </section>
<%@ include file="/resources/common/admFooter.jsp" %>
</body>
</html>
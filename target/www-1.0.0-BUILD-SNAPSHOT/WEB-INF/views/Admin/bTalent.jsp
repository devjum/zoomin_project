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
        		<a href="bTalent.do" class="checked">재능리스트</a>
        		<a href="bInquiry.do">문의게시판</a>
        	</div>

            <div class="admin_table">
            	<div class="talentList listWrap">
	            	<div>
			        	<div class="user_num">
			            	<h3>총 게시글 <span>${ pageCnt.totalCnt }</span>개</h3>
			            </div>
			            <form method = "post" action="bTalent.do" class="search">
							<select name="searchCondition">
								<option value="searchName"<c:if test="${search.searchCondition eq 'searchName'}">selected</c:if>>이름</option>
								<option value="searchTitleAndContents"<c:if test="${search.searchCondition eq 'searchTitleAndContents'}">selected</c:if>>제목+내용</option>
							</select>
							<input type="text" name="searchKeyword" <c:if test="${search.searchKeyword ne '%%'}">value="${ search.searchKeyword }"</c:if>>
							<input type="submit" value="검색">
						</form>	
					</div>
	                <table>
	                	<colgroup>
								<col style="width:3%"/>
	                            <col style="width:5%"/>
	                            <col style="width:8%"/>
	                            <col style="width:13%"/>
	                            <col style="width:13%"/>
	                            <col style="width:48%"/>
	                            <col style="width:13%"/>
	                            <col style="width:7%"/>
						</colgroup>
	                    <thead>
	                        <tr>
	                            <th><input type="checkbox" id="checkAll" /></th>
	                            <th>번호</th>
	                            <th>분류</th>
	                            <th>아이디</th>
	                            <th>이름</th>
	                            <th>제목</th>
	                            <th>등록일</th>
	                            <th>관리</th>
	                        </tr>
	                    </thead>
	                    <tbody class="table_c">
	                    <form action="selectTalentDelete.do" method="post"  onsubmit="return delAlert('재능등록글')">
	                    	<c:forEach var="talentList" items="${ talentList }" varStatus="talStatus">
	                        <tr>
	                            <td><input type="checkbox" name="checks" value="${ talentList.id }" /></td>
	                            <td>${talStatus.count}</td>
	                            <td>${ talentList.categorize }</td>
	                            <td>${ talentList.id }</td>
	                            <td class="ellipsisTd">${ talentList.name }</td>
	                            <td class="table_l ellipsisTd">${ talentList.title }</td>
	                            <td>${ talentList.wdate.substring(0,10) }</td>
	                            <td class="user_admin_btn"><a href="talentDelete.do?id=${ talentList.id }" onclick="return delAlert('재능등록글')"><i class="xi-trash-o"></i></a></td>
	                        </tr>
	                        </c:forEach>
	                     </form>
	                    </tbody>
	
	                </table>
	                <div class="btn">
	                    <input type="submit" value="선택삭제">
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
								<a href="bTalent.do?curpage=${i}&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}">${i+1}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
	            </div>
	            
        </section>
<%@ include file="/resources/common/admFooter.jsp" %>
</body>
</html>
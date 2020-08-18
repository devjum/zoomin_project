<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>재능리스트 : ZOOMIN- 재능 연결 서비스</title>
</head>
<body>
<%@ include file="/resources/common/sub_header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/talent.js"></script>
   <div id="category" class="wrapper">

        <form action="talentList.do" method="post" name="searchKey" onsubmit="return categoryChk()">
	        <div class="category_chk">
	        	<c:set var="sChecked" value="${ search.searchCategorizeStr }"/>
	            <ul>
	               	<li><input name="searchChk" id="all" type="checkbox" value="all"<c:if test="${ sChecked eq null }"> checked</c:if> ><label for="all" onclick="searchFunction()">전체</label></li>
	                <li><input name="searchChk" id="dance" type="checkbox" value="댄스" <c:if test="${fn:contains(sChecked,'댄스')}"> checked</c:if>><label for="dance" onclick="searchFunction()">댄스</label></li>
	                <li><input name="searchChk" id="vocal" type="checkbox" value="보컬" <c:if test="${fn:contains(sChecked,'보컬')}"> checked</c:if>><label for="vocal" onclick="searchFunction()">보컬</label></li>
	                <li><input name="searchChk" id="classic" type="checkbox" value="클래식" <c:if test="${fn:contains(sChecked,'클래식')}"> checked</c:if>><label for="classic" onclick="searchFunction()">클래식</label></li>
	                <li><input name="searchChk" id="band" type="checkbox" value="밴드" <c:if test="${fn:contains(sChecked,'밴드')}"> checked</c:if>><label for="band" onclick="searchFunction()">밴드</label></li>
	                <li><input name="searchChk" id="dj" type="checkbox" value="DJ" <c:if test="${fn:contains(sChecked,'DJ')}"> checked</c:if>><label for="dj" onclick="searchFunction()">DJ</label></li>
	                <li><input name="searchChk" id="koreanClassic" type="checkbox" value="국악" <c:if test="${fn:contains(sChecked,'국악')}"> checked</c:if>><label for="koreanClassic" onclick="searchFunction()">국악</label></li>
	                <li><input name="searchChk" id="etc" type="checkbox" value="기타" <c:if test="${fn:contains(sChecked,'기타')}"> checked</c:if>><label for="etc" onclick="searchFunction()">기타</label></li>
	            </ul>
	            <div class="terms_btn"> 
	            	<select name="searchCondition">
	            		<option value="searchName"<c:if test="${ search.searchCondition eq 'searchName' }"> selected</c:if>>아티스트</option>
	            		<option value="searchTitleAndContents"<c:if test="${ search.searchCondition eq 'searchTitleAndContents' }"> selected</c:if>>제목+내용</option>
	            	</select>
	            	<input type="text" name="searchKeyword" class="searchInput" value="${ search.searchKeyword }" >
	            	<input type="submit" value="검색">
	        	</div>
	        </div>
        </form>
    </div> 

    <div id="sub_section" class="wrapper">
        <div class="list_top">
            <p>총 <span>${ pageCnt.totalCnt }</span>건</p>
            <!-- <ul>
                <li><a href="#">평점순</a></li>
                <li><a href="#">등록순</a></li>
            </ul> -->
        </div>
        <c:if test="${ list eq '[]' }">
        	<p class="noneList">게시물이 없습니다.</p>
        </c:if>
        <div class="art_wrap">
        	<c:forEach items="${ list }" var="listVar">

            <div class="art_li">
                <a href="talentView.do?no=${ listVar.no }">
                    <div class="a_img">
                    	<img src="/upload/${ listVar.thumbName }" alt="썸네일대표이미지"/>
                    		<c:if test="${ listVar.categorize eq '보컬' }"><span class="tag_vocal tag_categorize">${ listVar.categorize }</span></c:if>
				        	<c:if test="${ listVar.categorize eq '댄스' }"><span class="tag_dance tag_categorize">${ listVar.categorize }</span></c:if>
				        	<c:if test="${ listVar.categorize eq '클래식' }"><span class="tag_classic tag_categorize">${ listVar.categorize }</span></c:if>
				        	<c:if test="${ listVar.categorize eq '밴드' }"><span class="tag_band tag_categorize">${ listVar.categorize }</span></c:if>
				        	<c:if test="${ listVar.categorize eq 'DJ' }"><span class="tag_dj tag_categorize">${ listVar.categorize }</span></c:if>
				        	<c:if test="${ listVar.categorize eq '국악' }"><span class="tag_koreanMusic tag_categorize">${ listVar.categorize }</span></c:if>
				        	<c:if test="${ listVar.categorize eq '기타' }"><span class="tag_ect tag_categorize">${ listVar.categorize }</span></c:if>
                    </div>
                    <div class="a_profile">
                        <div class="profile_img">
                        	<img src="/upload/${ listVar.img }" alt="프로필사진"/>
                        </div>
                        <span class="a_name"> ${ listVar.name } </span>
                        <span class="a_star">
                            <img src="${pageContext.request.contextPath}/resources/img/star_icon.png" alt="별" />
                            	<c:if test="${ listVar.gradeAvg!=0 }"><span>${ listVar.gradeAvg }</span></c:if>
                            	<c:if test="${ listVar.gradeAvg==0 }"><span>리뷰없음</span></c:if>
                        </span>
                    </div>
                    <div class="a_txt">
                        <p class="title"> ${ listVar.title } </p>
                        <p class="price"><span id="priceNum">${ listVar.price1 } - ${ listVar.price2 }</span> </p>
                    </div>
                </a>
            </div>
            </c:forEach>
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
						<a href="talentList.do?curpage=${i}&searchCondition=${search.searchCondition}&searchKeyword=${search.searchKeyword}">${i+1}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
    </div>
    <%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
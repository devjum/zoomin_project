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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<title>재능리스트 : ZOOMIN - 재능연결 서비스</title>
</head>
<body>

<%@ include file="/resources/common/sub_header.jsp" %>
<script>
	function deleteAlert(){
		var result = confirm("게시물을 삭제하시겠습니까?");
		if(result) {
			location.href="talentDelete.do";
		}
	}
</script>

<div id="view_top" class="wrapper">
        <div class="view_profile">
            <div class="a_img">
                <img src="/upload/${ dto.thumbName }" alt="대표 이미지"/>
            </div>
            <div class="a_profile">
                <div class="img">
                	<img src="/upload/${ dto.img }" alt="아티스트 이미지"/>
                </div>
                <span class="a_name"> ${ dto.name } </span>
                <span class="a_star">
                    <img src="${pageContext.request.contextPath}/resources/img/star_icon.png" alt="별" /><span>
                    	<c:if test="${ dto.gradeAvg!=0 }">${ dto.gradeAvg }</span></c:if>
                        <c:if test="${ dto.gradeAvg==0 }">리뷰없음</span></c:if></span>
                </span>
            </div>
        </div>
        <div class="view_txt">
        	<c:if test="${ dto.categorize eq '보컬' }"><span class="tag_vocal"></c:if>
        	<c:if test="${ dto.categorize eq '댄스' }"><span class="tag_dance"></c:if>
        	<c:if test="${ dto.categorize eq '클래식' }"><span class="tag_classic"></c:if>
        	<c:if test="${ dto.categorize eq '밴드' }"><span class="tag_band"></c:if>
        	<c:if test="${ dto.categorize eq 'DJ' }"><span class="tag_dj"></c:if>
        	<c:if test="${ dto.categorize eq '국악' }"><span class="tag_koreanMusic"></c:if>
        	<c:if test="${ dto.categorize eq '기타' }"><span class="tag_ect"></c:if>
            ${ dto.categorize }</span>
            <h2>${ dto.title }</h2>
            <p>${ dto.introduce }</p>

            <div class="v_price">
                <h3>총 상품 금액</h3>
                <p><span>${dto.price1} - ${ dto.price2 }</span></p>
            </div>
            <div class="v_btn">
                <!-- <button class="like">찜하기</button> -->
                <form action="../Reserve/reserveWrite.do" method="post">
                	<input type="hidden" name="price1" value="${ dto.price1 }">
                	<input type="hidden" name="price2" value="${ dto.price2 }">
                	<input type="hidden" name="no" value="${ dto.no }">
                	<button class="purchase">재능 예약하기</button>
                </form>
            </div>
        </div>

    </div>
	<script>
	
		$(document).ready(function(){
			if("${ dto.video }"!=""){
			var link = "${ dto.video }";
			var pattern = new RegExp(/^.*\//,'');
				var url = link.replace(pattern,'');
				$(".video").append("<iframe width='1280' height='720' src='https://www.youtube.com/embed/"+url+"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>");
			};
				  $('.viewImgs').slick({
				    slide: 'div',
				    infinite:true,
				    speed:100,
				    dots:true,
				    autoplay:true,
				    autoplaySpeed:10000,
				    pauseOnHover:true,
				    vertical:false,
				    prevArrow : "<button type='button' class='slick-prev'><i class='xi-angle-left-min'></i></button>",		// 이전 화살표 모양 설정
					nextArrow : "<button type='button' class='slick-next'><i class='xi-angle-right-min'></i></button>",		// 다음 화살표 모양 설정
					dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
					draggable : true
				  });
		});
		
	</script>
    <div id="view_detail" class="wrapper">
    	<c:if test="${ dto.video ne '' }">
		    <div class="view_border">
		    	<div class="youtubeWrap">
		    		<div class="video"></div>
		    	</div>
		    </div>
	    </c:if>
	    <div class="view_border">
	    	<c:choose>
	    	<c:when test="${fn:length(files)==0}">
	    	</c:when>
	    	<c:otherwise>
		    	<div class="viewImgs">
		    		<c:forEach var="fileImg" items="${ files }">
		    			<div><img src="/upload/${ fileImg }" alt="콘텐츠 이미지"/></div>
		    		</c:forEach>
		    	</div>
	    	</c:otherwise>
	    	</c:choose>
			<pre class="talentView_text">${ dto.content }</pre>
		</div>
	</div>
	<div class="wrapper">
		<div class="edit_btn">
			<a href="talentList.do" class="w_btn">목록</a>
			<c:if test="${ dto.id==userInfo.id }">
				<a href="talentModify.do"><input type="button" value="수정" class="b_btn"></a>
				<a href="javascript:void(0)" onclick="deleteAlert()"><input type="button" value="삭제" class="b_btn"></a>
			</c:if>
		</div>
	</div>
	<div id="reviews" class="wrapper">
		<c:if test="${ review!='[]' }">
		<div class="reviewList">
			<h2>공연후기</h2>
			<c:forEach items="${ review }" var="review">
			<div class="reviewLi">
				<div class="reviewLeft">
					<div class="reviewProfile">
						<img src="/upload/${ review.img }" alt="리뷰작성자프로필사진">
					</div>
					<span class=tbReviewName> ${ review.name }</span>
				</div>
				<div class="reviewRight">
					 <p>${ review.review }</p>
					 <div class="reviewGD">
					 	<span class="tbReviewGrade"><img src="${pageContext.request.contextPath}/resources/img/star_icon.png" alt="별" /> &nbsp;${ review.score }</span><span class="tbReviewDate">${ review.wdate.substring(0,10) }</span>
					 </div>
				 </div>
			</div>
			</c:forEach>
		</div>
		</c:if>
    </div>

    
<%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
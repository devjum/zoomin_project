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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/mypage.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<title>마이페이지 : ZOOMIN - 재능연결서비스</title>
</head>

<body>
<%@ include file="/resources/common/sub_header.jsp" %>
    
    <div id="profile" class="wrapper">
        <div class="my_img_a">
        	<img src="${ uploadPath }/upload/${ userInfo.img }" alt="아티스트 사진"/>
        </div>
        <a href="javascript:void(0)" onclick="updateProfile();" class="pImg_btn"><i class="xi-pen"></i></a><br>
        <form class="filebox" method="post" action="updateImg.do" enctype="multipart/form-data" name="upForm" style='display:none;'>
        	<input class="upload-name" value="선택된 파일이 없습니다." disabled="disabled">
        	<label for="findFile" class="findFile">파일선택 </label>
        	<input type="file" id="findFile" class="upload-hidden" name="uploadFile"/>
        	<input type="submit" value="등록" class="fileChange"/>
        </form>
        	<c:if test="${ userInfo.member eq 'general' }"><div class="my_tag_g">일반회원</div></c:if>
        	<c:if test="${ userInfo.member eq 'artist' }"><div class="my_tag_a">아티스트</div></c:if>
        <div>
        	<h2>${ userInfo.name }</h2>
        </div>
        <pre>${ userInfo.introduce }</pre>
        <a href="modifyIn.do"><button class="modifyIn">회원정보</button></a><a class="logout_btn" href="../logout.do"><button>로그아웃</button></a>
    </div>
    <c:choose>
    <c:when test="${ userInfo.member eq 'artist' }">
	    <div class="my_section wrapper">
	        <div class="my_con01">
	        
	        	<h3>재능등록</h3>
	        	<c:choose>
	        		<c:when test="${ talentExist==0 }">
			            <div class="talentIcon01"><span>재능아이콘</span></div>
			            <a href="../Talent/talentWrite.do">재능등록하기+</a>
	            	</c:when>
	            	<c:when test="${ talentExist!=0 }">
			            <div class="talentIcon02">
			            	<a href="../Talent/talentView.do?no=${ t_noByid }"><span>재능아이콘</span></a>
			            </div>
			            <p>재능등록이 완료되었습니다.</p>
	            	</c:when>
	            </c:choose>
	        </div>
	        <div class="my_con02">
	            <h3>공연 신청 현황</h3>
	            <span>신청받은 공연 리스트 현황입니다.</span>
	            <c:choose>
	            	<c:when test="${ reserveList eq '[]' }"><p class="absence_review">공연 신청이 없습니다.</p></c:when>
	            	<c:when test="${ reserveList ne null }">
			            <ul>
			            	<c:forEach items="${ reserveList }" var="reserveList" begin="0" end="1">
			                <li>
			                    <c:if test="${ reserveList.status eq '신청대기'||reserveList.status eq '신청거절' }">
				                <span class="current_w">
				                </c:if>
				                <c:if test="${ reserveList.status eq '공연확정' }">
				                <span class="current_c">
				                </c:if>${ reserveList.status }</span>
			                    <p>${ reserveList.perName }</p>
		                	</li>
			                </c:forEach>
			            </ul>
			            <a href="javascript:void(0);" onclick="showReserve()" class="allInfo">전체보기 +</a>
		            </c:when>
	            </c:choose>
	        </div>
	        <div class="my_con03 my_ul">
	            <h3>공연 후기</h3>
	            <span>내 공연에 대한 고객들의 후기입니다.</span>
	            <c:choose>
	            	<c:when test="${ reviewList eq '[]' }"><p class="absence_review">등록된 리뷰가 없습니다.</p></c:when>
	            	<c:when test="${ reviewList ne null }">
			            <ul>
			            	<c:forEach items="${ reviewList }" var="reviewList" begin="0" end="1">
			                <li><p>${ reviewList.review }</p><span><img src="${pageContext.request.contextPath}/resources/img/star_icon.png" alt="별"/>${ reviewList.score }</span></li>
			                </c:forEach>
			            </ul>
			            <a href="javascript:void(0);" onclick="showReview()" class="allInfo">전체보기 +</a>
		            </c:when>
	            </c:choose>
	            
	        </div>
	    </div>
	     <div id="reserveList" class="current_show wrapper" style="display:none;">
	        <h3>공연 신청 전체 현황</h3><a href="javascript:void(0);" onclick="reserveClose()" class="closeBtn"><i class="xi-close"></i></a>
	        <ul>
	        <c:forEach items="${ reserveList }" var="reserveList">
	            <li>
	               <div class="reserveCon">
	               <c:if test="${ reserveList.status eq '신청대기'||reserveList.status eq '신청거절' }">
	                <span class="current_w">
	                </c:if>
	                <c:if test="${ reserveList.status eq '공연확정' }">
	                <span class="current_c">
	                </c:if>
	                ${ reserveList.status }</span>
	                <a href="../Reserve/reserveView.do?no=${ reserveList.no }"><p class="perName">${ reserveList.perName }</p></a>
	                <dl class="current_detail">
	                    <dt>공연일시</dt>
	                    <dd>${ reserveList.perDate.substring(0,10) }</dd>
	                    <dt>시간</dt>
	                    <dd>${ reserveList.perTime.substring(0,5) }</dd>
	                    <dt>담당자</dt>
	                    <dd>${ reserveList.phone.substring(0,3) }-${ reserveList.phone.substring(3,7) }-${ reserveList.phone.substring(7,11) }</dd>
	                    <dt>금액</dt>
	                    <dd>${ reserveList.price }</dd>
	                </dl>
	                </div>
	                <c:if test="${ reserveList.status eq '신청대기' }">
	                <div class="reserveBtn">
	                	<form method="post" action="../Reserve/reserveConfirm.do">
	                		<input type="hidden" name="no"  value="${ reserveList.no }"/>
	                		<input class="reserveConfirm" type="hidden" name="status" value="공연확정"/>
	                		<input type="submit" value="수락" class="res_confirm"/>
	                	</form>
	                	<form method="post" action="../Reserve/reserveConfirm.do">
	                		<input type="hidden" name="no"  value="${ reserveList.no }"/>
	                		<input class="reserveRefuse" type="hidden" name="status" value="신청거절"/>
	                		<input type="submit" value="거절" class="res_refuse"/>
	                	</form>
	                </div>
	                </c:if>
	            </li>
	            </c:forEach>
	        </ul>
	    </div> 
	    <div id="reviewList" class="current_show wrapper" style="display:none">
	        <h3>공연 후기</h3><a href="javascript:void(0);" onclick="reviewClose()" class="closeBtn"><i class="xi-close"></i></a>
	        <ul>
	        <c:forEach items="${ reviewList }" var="reviewList" >
	            <li>
	            	<div class="reviewWriter">
	            		<div class="rvImg"><img src="/upload/${reviewList.img}"alt="프로필사진"/></div>
	            		<span class="reviewName">${ reviewList.name }</span><span class="rvScore"><img src="${pageContext.request.contextPath}/resources/img/star_icon.png" alt="별"/> ${ reviewList.score }</span>
	            	</div>
	            	<p class="reviewperName"><a href="../Reserve/reserveView.do?no=${ reviewList.r_no }">${ reviewList.perName }</a></p>
	            	<pre class="reviewText">${ reviewList.review }</pre>
	            	<dl class="current_detail">
	                    <dt>공연일시</dt>
	                    <dd>${ reviewList.perDate.substring(0,10) }</dd>
	                    <dt>시간</dt>
	                    <dd>${ reviewList.perTime.substring(0,5) }</dd>
	                    <dt>담당자</dt>
	                    <dd>${ reviewList.phone.substring(0,3) }-${ reviewList.phone.substring(3,7) }-${ reviewList.phone.substring(7,11) }</dd>
	                    <dt>금액</dt>
	                    <dd>${ reviewList.price }</dd>
	                </dl>
	            </li>
	        </c:forEach>
	        </ul>
	    </div>
    </c:when>
    <c:when test="${ userInfo.member eq 'general' }">
    	<div class="my_section wrapper generalBox">
        <!-- <div class="my_con01 my_ul">
             <h3>내가 찜한 아티스트</h3>
            <span>내가 관심 있는 아티스트 리스트입니다.</span> 
            <ul>
                <li><a href="#">
                        <p>보컬 신희현 / SBS 드라마 '내 마음 반짝반짝' OST 참여</p>
                    </a></li>
                <li><a href="#">
                        <p>밴드 M.I.D / 정규 2집 앨범 발매, 완벽한 무대매너</p>
                    </a></li>
            </ul>
            <a href="#">전체보기 +</a>
        </div>  -->

        <div class="my_con02">
            <h3>공연 신청 현황</h3>
            <span>내가 신청한 공연 리스트 현황입니다.</span>
            <c:choose>
	            	<c:when test="${ reserveList eq'[]' }"><p class="absence_review">공연 신청이 없습니다.</p></c:when>
	            	<c:when test="${ reserveList ne null }">
			            <ul>
			            	<c:forEach items="${ reserveList }" var="reserveList" begin="0" end="1">
			                <li>
			                    <c:if test="${ reserveList.status eq '신청대기'||reserveList.status eq '신청거절' }">
				                <span class="current_w">${ reserveList.status }</span>
				                </c:if>
				                <c:if test="${ reserveList.status eq '공연확정' }">
				                <span class="current_c">${ reserveList.status }</span>
				                </c:if>
			                    <p>${ reserveList.perName }</p>
		                	</li>
			                </c:forEach>
			            </ul>
			            <a href="javascript:void(0);" onclick="showReserve()" class="allInfo">전체보기 +</a>
		            </c:when>
	            </c:choose>
        </div>
        <div class="my_con03 my_ul">
            <h3>공연후기</h3>
            <span>완료된 공연에 후기를 남겨보세요.</span>
            <c:choose>
	            	<c:when test="${ completeList eq '[]' }"><p class="absence_review">리뷰를 등록할 수 있는 공연이 없습니다.</p></c:when>
		            <c:when test="${ completeList ne '[]' }">
			            <ul>
			            <c:forEach var="comList" items="${ completeList }" begin="0" end="1" varStatus="comStatus">
			            	<li>
			            	<p><span class="perArtist">${ comList.name }</span> ${ comList.perName }</p>
								<c:if test="${ comList.reviewExist != 0 }">
									<span class="reviewCom">후기완료</span>
								</c:if>
								<c:if test="${ comList.reviewExist == 0 }">
									<form action="../Review/reviewWrite.do" method="post" class="reviewWriteForm">
										<input type="hidden" name="t_no" value="${ comList.t_no }"/>
										<input type="hidden" name="r_no" value="${ comList.no }"/>
										<input type="submit" value="후기쓰기" />
									</form>
								</c:if>
			            	</li>
			            </c:forEach>
			            </ul>
			            <a href="javascript:void(0);" onclick="showReview()" class="allInfo">전체보기 +</a>
		            </c:when>
	            </c:choose>
        </div>
    </div>

    <div id="reserveList" class="current_show wrapper" style="display:none;">
    
	        <h3>공연 신청 전체 현황</h3><a href="javascript:void(0);" onclick="reserveClose()" class="closeBtn"><i class="xi-close"></i></a>
	        <ul>
	        <c:forEach items="${ reserveList }" var="reserveList">
	            <li>
	               <div class="reserveCon">
	               <c:if test="${ reserveList.status eq '신청대기'||reserveList.status eq '신청거절' }">
	                <span class="current_w">${ reserveList.status }</span>
	                </c:if>
	                <c:if test="${ reserveList.status eq '공연확정' }">
	                <span class="current_c">${ reserveList.status }</span>
	                </c:if>
	                <a href="../Reserve/reserveView.do?no=${ reserveList.no }"><p class="perName">${ reserveList.perName }</p></a>
	                <dl class="current_detail">
	                    <dt>공연일시</dt>
	                    <dd>${ reserveList.perDate.substring(0,10) }</dd>
	                    <dt>시간</dt>
	                    <dd>${ reserveList.perTime.substring(0,5) }</dd>
	                    <dt>담당자</dt>
	                    <dd>${ reserveList.phone.substring(0,3) }-${ reserveList.phone.substring(3,7) }-${ reserveList.phone.substring(7,11) }</dd>
	                    <dt>금액</dt>
	                    <dd>${ reserveList.price }</dd>
	                </dl>
	                </div>
	                <a class="talentInfo" href="../Talent/talentView.do?no=${ reserveList.t_no }">
	                	<span class="talentName">${ reserveList.name }</span>
	                	<span class="talentTitle">${ reserveList.title }</span>
	                </a> 
	            </li>
	            </c:forEach>
	        </ul>
					
	    </div> 
	    <div id="reviewList" class="current_show wrapper" style="display:none">
	        <h3>완료된 공연 & 내 후기</h3><a href="javascript:void(0);" onclick="reviewClose()" class="closeBtn"><i class="xi-close"></i></a>
	        <ul>
			<c:forEach items="${ completeList }" var="comList" varStatus="comStatus">
				<li>
					<p class="perName"><span class="perArtist">${ comList.name }</span>${ comList.perName }</p>
					<dl class="current_detail">
						<dt>공연일시</dt><dd>${ comList.perDate.substring(0,10) }</dd>
						<dt>시간</dt><dd>${ comList.perTime.substring(0,5) }</dd>
						<dt>담당자</dt><dd>${ comList.phone.substring(0,3) }-${ comList.phone.substring(3,7) }-${ comList.phone.substring(7,11) }</dd>
						<dt>금액</dt><dd>${ comList.price }</dd>
					</dl>

					<c:if test="${ comList.reviewExist != 0 }">
						 <div class="reviewMoreBtn">
						 	<a href="javascript:void(0)" class="moreBtn">내가 쓴 후기<span id="iclass"><i class="xi-angle-down-min moreIcon"></i></span></a>
						 	<div class="reviewTxt">
						 		<div class="reviewGD">
							 		<span><img src="${pageContext.request.contextPath}/resources/img/star_icon.png" alt="평점별아이콘"/>${ comList.score }</span>
							 		<span>${ comList.reviewWdate.substring(0,10) }</span>
							 	</div>
							 	<pre>${ comList.review }</pre>
						 	</div>
						 </div>
					</c:if>
					<script>
						
					</script>
					<c:if test="${ comList.reviewExist == 0 }">
						<form action="../Review/reviewWrite.do" method="post" class="reviewWriteForm">
							<input type="hidden" name="t_no" value="${ comList.t_no }"/>
							<input type="hidden" name="r_no" value="${ comList.no }"/>
							<input type="submit" value="후기쓰기" />
						</form>
					</c:if>
				</li>
			</c:forEach>
	        </ul>
	    </div>

    </c:when>
    </c:choose>
<%@ include file="/resources/common/footer.jsp" %>
</body>
</html>
				            			
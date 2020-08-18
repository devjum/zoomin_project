<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.zoomin.www.dto.UserDTO" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<title>ZOOMIN - 재능연결서비스</title>
</head>
<body>

    <!--로그인 유효성 스크립트-->
    <script>
    
    function validate() {
        if (document.getElementById("id").value == "") {
            alert("아이디를 입력해 주세요.");
            memberLogin.id.focus();
            return false;
        }
        if (document.getElementById("pw").value == "") {
            alert("비밀번호를 입력해 주세요.");
            memberLogin.pw.focus();
            return false;
        }
        return true;
    }

		
	</script>
	<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
	<c:choose>
		<c:when test="${ param.loginChk eq null || param.loginChk eq 'Y'}">
	    <div id="popup_wrap">
	        <div class="login_wrap">
	            <div class="popup_login">
	                <h1>LOGIN</h1>
	                
	                <form name="memberLogin" method="post" action="login.do" onsubmit="return validate();">
	                    <input type="text" id="id" name="id" placeholder="ID" />
	                    <input type="password" id="pw" name="pw" placeholder="PW" />
	                    <input type="hidden" name="returnPath" value="${ path }"/>
	                    <input class="login_sub" type="submit" value="로그인">
	                </form>
	                <ul>
	                    <li><a href="User/join.do">지금 회원가입</a></li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    </c:when>
	    <c:when test="${ param.loginChk eq 'N' }">
	    <div id="popup_wrap">
	        <div class="login_wrap">
	            <div class="popup_login">
	                <h1>LOGIN</h1>
	                <form name="memberLogin" method="post" action="login.do?returnPath=${ path }" onsubmit="return validate();">
	                    <input type="text" id="id" name="id" placeholder="ID" />
	                    <input type="password" id="pw" name="pw" placeholder="PW" />
	                    <span class="loginFailtxt">아이디와 비밀번호를 다시 확인하세요.</span>
	                    <input type="hidden" name="returnPath" value="${ path }"/>
	                    <input class="login_sub" type="submit" value="로그인">
	                </form>
	                <ul>
	                    <li><a href="User/join.do">지금 회원가입</a></li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    </c:when>
    </c:choose>
    
    <header id="top_wrap">
        <div id="header">
            <div class="wrapper">
                <a href="index.do"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Zoom-in logo" /></a>
                <ul>
                    <li><a href="Talent/talentList.do">재능리스트</a></li>
                    <li><a href="javascript:void(0);" onclick="loginAlert()">문의하기</a></li>
                    <li>
                    	<c:choose>
                    		<c:when test = "${ userInfo eq null }">
	                    	<button id="login_btn"><img src="${pageContext.request.contextPath}/resources/img/mypage_icon.png" alt="마이페이지" /><p>LOGIN</p></button>
	                    	</c:when>
	                    	<c:when test = "${ userInfo ne null }">
	                    	<a href="User/mypage.do"><button><img src="${pageContext.request.contextPath}/resources/img/mypage_icon.png" alt="마이페이지" /><p>MY PAGE</p></button></a>
	                    	</c:when>
                    	</c:choose>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 로그인 modal 스크립트 -->
	<script>
	if(${ sessionId eq null}){
		var modal = document.getElementById('popup_wrap');
		var btn = document.getElementById("login_btn");
		btn.onclick = function() {
            modal.style.display = "block";
        }
		window.onclick = function(event){
			if(event.target == modal) {
				modal.style.display = "none";
			}
		}
	}
		if( ${param.loginChk eq 'N'} ){
			modal.style.display="block";
			window.onclick = function(event){
				if(event.target == modal) {
					if(${dto ne null}){
						location.href="..${path}?no=${dto.no}";
					} else {
						location.href="..${path}";
					}
				}
			}
		}
	function loginAlert() {
    	if( ${ userInfo==null } ){
    		alert("로그인 후에 이용 가능한 게시판입니다.");
    	} else if (${ userInfo != null}){
    		location.href="Inquiry/inquiryWrite.do";
    	}
    }
	</script>
	
        <div class="wrapper">
            <div class="main_visual ">
                <p>공연자와 직접 소통하여 공연, 행사를 연결하는 서비스</p>
                <h1>자유로운 재능연결 서비스 <span>Zoom-in</span></h1>
            </div>
        </div>
        <form class="searchWrap wrapper" action="Talent/talentList.do" method="post">
            <input type="text" name="searchKeyword" placeholder="찾으시는 아티스트가 있으신가요?" />
            <button><img src="${pageContext.request.contextPath}/resources/img/search_btn.png" alt="검색아이콘" /></button>
        </form>
    </header>
    <!--contents start-->
    <div id="contents">
        <!--category start-->
        <div class="category_wrap wrapper">
            <ul>
                <li>
                	<form action="Talent/talentList.do" method="post">
                		<input type="hidden" name="searchChk" value="보컬">
                		<input type="submit" class="category_icon">
                        <p class="cateListP">보컬</p>
                    </form>
                </li>
                <li>
                	<form action="Talent/talentList.do" method="post">
                		<input type="hidden" name="searchChk" value="댄스">
                		<input type="submit" class="category_icon">
                        <p class="cateListP">댄스</p>
                     </form>
                </li>
                <li>
                	<form action="Talent/talentList.do" method="post">
                		<input type="hidden" name="searchChk" value="클래식">
                		<input type="submit" class="category_icon">
                        <p class="cateListP">클래식</p>
                     </form>
                </li>
                <li>
                	<form action="Talent/talentList.do" method="post">
                		<input type="hidden" name="searchChk" value="DJ">
                		<input type="submit" class="category_icon">
                        <p class="cateListP">DJ</p>
                     </form>
                </li>
                <li>
                	<form action="Talent/talentList.do" method="post">
                		<input type="hidden" name="searchChk" value="국악">
                		<input type="submit" class="category_icon">
                        <p class="cateListP">국악</p>
                     </form>
                </li>
                <li>
                	<form action="Talent/talentList.do" method="post">
                		<input type="hidden" name="searchChk" value="밴드">
                		<input type="submit" class="category_icon">
                        <p class="cateListP">밴드</p>
                     </form>
                </li>
            </ul>
        </div>
        <!--category end-->
        <!--new_list start-->
        <script>
        $(document).ready(function(){
			  $('.new_contents').slick({
			    slide: 'li',
			    slidesToShow: 3,
			    slidesToScroll: 3,
			    infinite:true,
			    speed:100,
			    autoplay:true,
			    autoplaySpeed:10000,
			    pauseOnHover:true,
			    vertical:false,
			    prevArrow : "<button type='button' class='slick-prev'><i class='xi-angle-left-min'></i></button>",		// 이전 화살표 모양 설정
				nextArrow : "<button type='button' class='slick-next'><i class='xi-angle-right-min'></i></button>",		// 다음 화살표 모양 설정
				draggable : true
			  });
			});
        </script>
        <div id="new_list" class="new_list wrapper">
            <div class="new_title">
                <h2 class="section_tit">새로 등록된 재능</h2>
            </div>
            <ul class="new_contents">
            <c:forEach items="${ list }" var="list" begin="0" end="5">
                <li>
                    <a href="Talent/talentView.do?no=${ list.no }">
                        <div class="new_thumb">
                            <img src="/upload/${ list.thumbName }" alt="대표썸네일" />
                            <c:if test="${ list.categorize eq '보컬' }"><span class="tag_vocal tag_categorize"></c:if>
				        	<c:if test="${ list.categorize eq '댄스' }"><span class="tag_dance tag_categorize"></c:if>
				        	<c:if test="${ list.categorize eq '클래식' }"><span class="tag_classic tag_categorize"></c:if>
				        	<c:if test="${ list.categorize eq '밴드' }"><span class="tag_band tag_categorize"></c:if>
				        	<c:if test="${ list.categorize eq 'DJ' }"><span class="tag_dj tag_categorize"></c:if>
				        	<c:if test="${ list.categorize eq '국악' }"><span class="tag_koreanMusic tag_categorize"></c:if>
				        	<c:if test="${ list.categorize eq '기타' }"><span class="tag_ect tag_categorize"></c:if>
        					${ list.categorize }</span>
                        </div>
                        </a>
                        <div class="new_con">
                            <div class="new_top">
                                <span class="new_flag">NEW</span>
                                 <!-- <button class="new_heart">
                                	<i class="xi-heart heart"></i>
                                </button> -->  
                            </div>
                            <a href="Talent/talentView.do?no=${ list.no }">
                            <h3>${ list.title }</h3>
                            <P><span class="newName">${ list.name }</span><span>${ list.price1 } - ${ list.price2 }</span></P>
                            </a>
                        </div>
                </li>
               </c:forEach>
                
            </ul>
        </div>
        <!-- talentHeart -->
        <script>
        <c:forEach items="${ list }" var="list" begin="0" end="2">
			$('.heart').click(function(){
				$(this).css('color','#be445e');
				location.href='addHeart.do?no=${list.no}';
				}
			);
		</c:forEach>
        </script>
        <!--new_list end-->
        <!--feature start-->
        <div class="feature_wrap">
            <div class="wrapper">
                <p><span class="color_blue">공연자</span>와 <span class="color_blue">공연,행사</span>를 자유롭게 연결</p>
                <span class="quotation"></span>
                <!--feature_con start-->
                <div class="feature_con">
                    <div class="feature_img">
                        <span>뮤지션이미지</span>
                    </div>
                    <ul class="feature_li">
                        <li>
                            <p class="f_num">01</p>
                            <div class="f_txt">
                                <h4>상세한 포트폴리오</h4>
                                <p>공연자와 컨택 없이 이미지, 영상 공개</p>
                            </div>
                        </li>
                        <li>
                            <p class="f_num">02</p>
                            <div class="f_txt">
                                <h4>공연 캔슬 방지</h4>
                                <p>공연자와 직접 문의 및 연락을 할 수 있습니다.</p>
                            </div>
                        </li>
                        <li>
                            <p class="f_num">03</p>
                            <div class="f_txt">
                                <h4>공연자의 퀄리티</h4>
                                <p>자체 심사 시스템을 통해 공연자 수준 필터기능 수행</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <!--feature_con end-->
            </div>
        </div>
        <!--feature end-->
        <!--banner start-->
        <div class="banner wrapper">
            <img src="${pageContext.request.contextPath}/resources/img/app_banner.png" alt="" />
        </div>
        <!--banner end-->
        <!--bestArtist start-->
        <div class="bestArtist_wrap wrapper">
            <h2 class="section_tit">Best 아티스트</h2>
            <ul>
            	<c:forEach var="bestArtist" items="${ bestArtist }" begin="0" end="5" step="1">
                <li>
                        <span class="thumb">
                            <a href="Talent/talentView.do?no=${ bestArtist.no }"><img src="/upload/${ bestArtist.img }" alt="아티스트 프로필 사진" /></a>
                        </span>
                        <span class="best_text">
                            <p class="team_name">${ bestArtist.name }</p>
                            <p class="grade"><span class="g_star">별</span><span class="g_num">
                            	<c:if test="${ bestArtist.gradeAvg eq 0 }">리뷰없음</c:if>
                            	<c:if test="${ bestArtist.gradeAvg ne 0 }">${ bestArtist.gradeAvg }</c:if>
                            </span></p>
                        </span>
                    </li>
                 </c:forEach>
            </ul>

        </div>
        <!--bestArtist end-->
    </div>
    <!--contents end-->
<div id="top_btn">
        <a href="#" onfocus='this.blur()'><span>TOP</span></a>
    </div>
    <footer>
        <div class="footer_wrap wrapper">
            <div class="left_footer">
                <div class="logo"><img src="${pageContext.request.contextPath}/resources/img/footer_logo.png" alt="zoom-in로고" /></div>
                <div class="footer_con">
                    <p>상호 : (주)줌인 &nbsp;&nbsp;| &nbsp;&nbsp; 주소 : 서울특별시 강남구 테헤란로 000 &nbsp;&nbsp;| &nbsp;&nbsp; 사업자등록번호 : 123-45-6789<br> 대표자명 : 김주민 &nbsp;&nbsp;| &nbsp;&nbsp;
                        통신판매업 신고번호 : 제 2020-서울강남-010101</p><br>
                    <p class="copy">Copyright ⓒ2020 Zoomin inc, ltd. All rights reserved</p>
                </div>
            </div>
            <div class="right_footer">
                <h5><span>Zoom-in</span>에 문의하기</h5>
                <p class="tel">1599-5319</p><br>
                <p class="cs">평일 10:00 - 18:00<br>
                    (점심시간 13:00 - 14:00 제외 · 주말/공휴일 제외)</p>
            </div>
        </div>


    </footer>

</body>
</html>
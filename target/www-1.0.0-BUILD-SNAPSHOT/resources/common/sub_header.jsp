<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
<header id="top_wrap">

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
        function loginAlert() {
        	if( ${ userInfo==null } ){
        		alert("로그인 후에 이용 가능한 게시판입니다.");
        	} else if (${ userInfo != null}){
        		location.href="../Inquiry/inquiryWrite.do";
        	}
        }

    </script>
    <c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
	<c:choose>
		<c:when test="${ param.loginChk eq null || param.loginChk eq 'Y'}">
	    <div id="popup_wrap">
	        <div class="login_wrap">
	            <div class="popup_login">
	                <h1>LOGIN</h1>
	                
	                <form name="memberLogin" method="post" action="../login.do?returnPath=${ path }" onsubmit="return validate();">
	                    <input type="text" id="id" name="id" placeholder="ID" />
	                    <input type="password" id="pw" name="pw" placeholder="PW" />
	                    <c:if test="${ dto ne null }">
	                    	<input type="hidden" name="no" value="${ dto.no }">
	                    </c:if>
	                    <input class="login_sub" type="submit" value="로그인">
	                </form>
	                <ul>
	                    <li><a href="../User/join.do">지금 회원가입</a></li>
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
	                <form name="memberLogin" method="post" action="../login.do?returnPath=${ path }" onsubmit="return validate();">
	                    <input type="text" id="id" name="id" placeholder="ID" />
	                    <input type="password" id="pw" name="pw" placeholder="PW" />
	                    <span class="loginFailtxt">아이디와 비밀번호를 다시 확인하세요.</span>
	                    <c:if test="${ dto ne null }">
	                    	<input type="hidden" name="no" value="${ dto.no }">
	                    </c:if>
	                    <input class="login_sub" type="submit" value="로그인">
	                </form>
	                <ul>
	                    <li><a href="../User/join.jsp">지금 회원가입</a></li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    </c:when>
    </c:choose>
    
        <div id="header">
            <div class="wrapper">
                	<a href="../index.do"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Zoom-in logo" /></a>
                <ul>
                    <li><a href="../Talent/talentList.do">재능리스트</a></li>
                    <li>
                   		<a href="javascript:void(0);" onclick="loginAlert()">문의하기</a>
                    </li>
                    <li>
                    	<c:choose>
                    		<c:when test = "${ userInfo.id == null }">
	                    	<button id="login_btn"><img src="${pageContext.request.contextPath}/resources/img/mypage_icon.png" alt="마이페이지" /><p>LOGIN</p></button>
	                    	</c:when>
	                    	<c:when test = "${ userInfo.id != null }">
	                    	<a href="../User/mypage.do?id=${ userInfo.id }"><button><img src="${pageContext.request.contextPath}/resources/img/mypage_icon.png" alt="마이페이지" /><p>MY PAGE</p></button></a>
	                    	</c:when>
                    	</c:choose>
                    </li>
                </ul>
            </div>

        </div>
        
        <div class="sub_title"><h1>
        <% String path = request.getServletPath(); 
        	if(path.equals("/WEB-INF/views/User/mypage.jsp")||path.equals("/WEB-INF/views/User/modifyIn.jsp")||path.equals("/WEB-INF/views/Review/reviewWrite.jsp")){
        %> 
        	마이페이지
        <%
        	} else if(path.equals("/WEB-INF/views/Talent/talentList.jsp")||path.equals("/WEB-INF/views/Talent/talentView.jsp")||path.equals("/WEB-INF/views/Talent/talentWrite.jsp")||path.equals("/WEB-INF/views/Reserve/reserveWrite.jsp")||path.equals("/WEB-INF/views/Talent/talentSearchList.jsp")){
        %>
        	재능리스트
        <%
        	} else if(path.equals("/WEB-INF/views/Reserve/reserveView.jsp")||path.equals("/WEB-INF/views/Reserve/reserveWrite.jsp")){
        %>
        	재능예약
        <%
        	} else if(path.equals("/WEB-INF/views/Inquiry/inquiryWrite.jsp")||path.equals("/WEB-INF/views/Inquiry/inquiryList.jsp")||path.equals("/WEB-INF/views/Inquiry/inquiryModify.jsp")){
       %>
            	문의하기
       <%
            	}
        %>
        </h1></div>
    </header>
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
	</script>
</body>
</html>
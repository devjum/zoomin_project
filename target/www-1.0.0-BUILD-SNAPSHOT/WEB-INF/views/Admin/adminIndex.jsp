
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat|Noto+Sans+KR:300,400,500,700,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
 	<script src="${pageContext.request.contextPath}/resources/js/adm.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

	//Admin메인 재능거래일일현황 그래프
	google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawBasic);
    
    var today = new Date();   
    var year = today.getFullYear(); // 년도
    var month = today.getMonth() + 1;  // 월
    var date = today.getDate();  // 날짜
	var d1 = month + '/' + (date-4);
	var d2 = month + '/' + (date-3);
	var d3 = month + '/' + (date-2);
	var d4 = month + '/' + (date-1);
	var d5 = month + '/' + date;
	
    function drawBasic() {

          var data = new google.visualization.DataTable();
          data.addColumn('string', '날짜');
          data.addColumn('number', '거래');

          data.addRows([
            [d1, ${graph.graph_d1}],   [d2, ${graph.graph_d2}],  [d3, ${graph.graph_d3}],  [d4, ${graph.graph_d4}],  [d5, ${graph.graph_d5}]
          ]);

          var options = {
            hAxis: {
              title: ''
            },
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

          chart.draw(data, options);
     };
	
    </script>
<title>관리자페이지 : ZOOMIN - 재능 연결 서비스</title>
</head>
<body>
    <%@ include file="/resources/common/admHeader.jsp" %>
    <%@ include file="/resources/common/admLnb.jsp" %>
        <section class="admin_con00">

            <div class="user_num con_box">
                <h3>총 회원수  <span>${ index.totalUser }</span>명</h3>
                <span>아티스트회원 ${ index.taUser }명</span>
                <span>일반회원 ${ index.tgUser }명</span>
            
                <h3>이번 달 신규회원  <span>${ index.monthUser }</span>명</h3>
				<span>아티스트회원 ${ index.maUser }명</span>
                <span>일반회원 ${ index.mgUser }명</span>
            </div>
            <div class="today_wrap">
                <div class="today_statistics con_box">
                    <span>Today</span>
                    <jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy.MM.dd (E)" var="today" />
                    <h3><span><c:out value="${today}"/></span></h3>
                    <div class="num_wrap">
                        <!-- <div class="num">
                            <h4>${ visitCnt.todayVisit }</h4>
                            <p>방문 수</p>
                        </div> -->
                        <div class="num">
                            <h4>${ index.dNewUser }</h4>
                            <p>신규회원</p>
                        </div>
                        <div class="num">
                            <h4>${ index.dTalentCnt }</h4>
                            <p>재능 등록</p>
                        </div>
                        <div class="num">
                            <h4>${ index.dReserveCnt }</h4>
                            <p>거래완료</p>
                        </div>
                    </div>
                </div>
                 <div class="con_box graph">
                    <h3>재능거래 일별 현황</h3>

                   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  					<div id="chart_div"></div>
                </div>
            </div> 
            <div class="admin_box_wrap">
                <div class="main_box adm_box01">
                    <div class="box_tit">
                        <h4>최근 문의 게시글</h4>
                        <a href="admBoard_inquiry.do">전체보기 + </a>
                    </div>
                    <ul>
                    	<c:forEach var="inquiryList" items="${ inquiryList }" begin="0" end="5">
                        <li>
                            <a href="admInquiryReply.do?no=${ inquiryList.no }">
                            	<c:if test="${ inquiryList.replyok eq '답변미완료' }">
									<span class="inquiry_in fl_l">${ inquiryList.replyok }</span>
								</c:if>
								<c:if test="${ inquiryList.replyok eq '답변완료' }">
									<span class="inquiry_com fl_l">${ inquiryList.replyok }</span>
								</c:if>
							<span class="re_c">${ inquiryList.title }</span><span class="date">${ inquiryList.wdate.substring(0,10) }</span></a>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="main_box adm_box02">
                    <div class="box_tit">
                        <h4>최근 등록 아티스트</h4>
                        <a href="admUser_all.do">전체보기 + </a>
                    </div>
                    <ul class="new_artUl">
                    	<c:forEach var="artistList" items="${ artistList }" begin="0" end="6">
                        <li>
                            <div class="new_artImg"><img src="/upload/${ artistList.img }" alt="프로필사진"/></div>
                            <h5>${ artistList.name }</h5>
                            <span class="id">@ ${ artistList.id }</span>
                            <a href="admUserModify.do?id=${ artistList.id }">more+</a>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </section>
    <%@ include file="/resources/common/admFooter.jsp" %>
</body>
</html>
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
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/maincon.ico">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>재능리스트 : ZOOMIN - 재능연결 서비스</title>
</head>

<body>

    <%@ include file="/resources/common/sub_header.jsp" %>
    <div class="wrapper">
	    <div id="edit_wrap">
	        <h2><span>나의 재능</span> 수정하기</h2>
	        <p>매력 넘치는 나의 재능을 등록해주세요. 상세한 입력은 회원들의 선택에 도움이 됩니다.</p>
	       <form class="register_form" method="post" action="talentModifyOK.do" enctype="multipart/form-data">
	       		<table>
	       			<colgroup>
	       				<col width="6%">
	       				<col width="10%">
	       				<col width="6%">
	       				<col width="36%">
	       				<col width="10%">
	       				<col width="22%">	       				
	       			</colgroup>
		       		<tr>
		       			
		                <td>
			                <h5>제목<span class="form_red">*</span></h5>
			            </td>
			            <td colspan="5">
							<input type="text" name="title" value="${ dto.title }" />
						</td>
					</tr>
					<tr>
						<td>
							<h5>분류<span class="form_red">*</span></h5>
						</td>
						<td>
							<select name="categorize">
			               		<option>선택</option>
			                	<option value="보컬" <c:if test="${ dto.categorize eq '보컬' }"> selected </c:if>>보컬</option>
			                	<option value="댄스" <c:if test="${ dto.categorize eq '댄스' }"> selected </c:if>>댄스</option>
			                	<option value="밴드" <c:if test="${ dto.categorize eq '밴드' }"> selected </c:if>>밴드</option>
			                	<option value="DJ" <c:if test="${ dto.categorize eq 'DJ' }"> selected </c:if>>DJ</option>
			                	<option value="국악" <c:if test="${ dto.categorize eq '국악' }"> selected </c:if>>국악</option>
			                	<option value="클래식" <c:if test="${ dto.categorize eq '클래식' }" > selected </c:if>>클래식</option>
			                	<option value="기타" <c:if test="${ dto.categorize eq '기타' }"> selected </c:if>>기타</option>
			                </select>
		                </td>
						<td>
							<h5>금액<span class="form_red">*</span></h5>
						</td>
						<td>
							<select name="price1" class="price1">
			                	<option>선택</option>
			                	<option value="한곡 기준"<c:if test="${ dto.price1 eq '한곡 기준' }"> selected </c:if>>한 곡 기준</option>
			                	<option value="시간 단위(30분)"<c:if test="${ dto.price1 eq '시간 단위(30분)' }"> selected </c:if>>시간 기준(30분)</option>
			                </select>
			                <select name="price2" class="price2">
			                	<option>선택</option>
			                    <option value="100,000원"<c:if test="${ dto.price2 eq '100,000원' }"> selected </c:if>>100,000원</option>
			                    <option value="200,000원"<c:if test="${ dto.price2 eq '200,000원' }"> selected </c:if>>200,000원</option>
			                    <option value="300,000원"<c:if test="${ dto.price2 eq '300,000원' }"> selected </c:if>>300,000원</option>
			                    <option value="400,000원"<c:if test="${ dto.price2 eq '400,000원' }"> selected </c:if>>400,000원</option>
			                    <option value="500,000원"<c:if test="${ dto.price2 eq '500,000원' }"> selected </c:if>>500,000원</option>
			               </select>
		               	</td>
		              	
					</tr>
					</table>
					<table>
						<tr>
							<td width="12%"><h5>대표 이미지<span class="form_red">*</span></h5></td>
							<td class="table_l"><span class="thumbName">${ dto.thumbName }</span><input type="file" name="thumbImg"/></td>
						</tr>
						<tr>
							<td colspan="4">
			            		<textarea placeholder="아티스트 소개란입니다." rows="15" name="content">${ dto.content }</textarea>
			            	</td>
			            </tr>
			         </table>
			          <table id="area">
							<tr>
									<td><h5>첨부 이미지</h5></td>
									
									<td>
										<input type="file" class="input-file" name="files">
						        	</td>
						        	
									<td><input class="fileAdd" type="button" value="삭제" onclick="deleteFileForm()"/></td>
									<td><input class="fileAdd" type="button" value="추가" onclick="insertFileForm()"/></td>
								</tr>
							<tr>
								<td></td>
								<td id="preview"></td>
							</tr>
						</table>
						<table>	
							<tr>
								<td><h5>유튜브 등록</h5></td>
								<td class="table_l">
									<input type="text" name="video" value="${ dto.video }"/>
									<span class="form_red" >※ 유튜브 영상 주소를 업로드해주세요. </span>
								</td>
							</tr>
						</table>
						
		   		<div class="edit_btn">
		   			<input type="hidden" name="no" value="${ dto.no }">
			    	<a href="talentList.do" class="w_btn">취소</a>
			        <input type="submit" value="수정하기" class="b_btn">
	    		</div>
	        </form>
	        
	    </div>
	    <script>

	        
	        var cnt = 0;
	        function insertFileForm()
	        {
	        	cnt++;
	        	if(cnt>4){
	        		alert("최대 5장까지 등록 가능합니다.");
	        	} else {
	        		var area  = document.getElementById("area");
		        	var row = area.insertRow(cnt);
		        	var th = "";
		        	var td1 = "<input type='file' class='input-file' name='files'>";
		        	row.insertCell(0).innerHTML = th;
		        	row.insertCell(1).innerHTML = td1;
	        	}
	        }
	        
	        function deleteFileForm(){
	        	if(cnt==0){
	        		alert("더 이상 삭제할 수 없습니다.");
	        		return;
	        	}
	        	var area = document.getElementById("area");
	        	area.deleteRow(cnt);
	        	cnt--;
	        }

	        
	        </script>
    </div>
<%@ include file="/resources/common/footer.jsp" %>
</body>

</html>
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
<title>재능리스트 : ZOOMIN - 재능 연결 서비스</title>
</head>

<body>
<script src="${pageContext.request.contextPath}/resources/js/talent.js"></script>
    <%@ include file="/resources/common/sub_header.jsp" %>
    <div class="wrapper">
    <form name="register_form" class="register_form" method="post" action="talentWriteOK.do" enctype="multipart/form-data" onsubmit="return checkValue()">
	    <div id="edit_wrap">
	        <h2><span>나의 재능</span> 등록하기</h2>
	        <p>매력 넘치는 나의 재능을 등록해주세요. 상세한 입력은 회원들의 선택에 도움이 됩니다.</p>
	       		<table>
	       			<colgroup>
	       				<col width="4%">
	       				<col width="12%">
	       				<col width="4%">
	       				<col width="38%">
	       				<col width="10%">
	       				<col width="22%">	       				
	       			</colgroup>
		       		<tr>
		       			
		                <td>
			                <h5>제목<span class="form_red">*</span></h5>
			            </td>
			            <td colspan="5">
							<input type="text" name="title" />
						</td>
					</tr>
					<tr>
						<td>
							<h5>분류<span class="form_red">*</span></h5>
						</td>
						<td>
							<select name="categorize">
			               		<option>선택</option>
			                	<option value="보컬">보컬</option>
			                	<option value="댄스">댄스</option>
			                	<option value="밴드">밴드</option>
			                	<option value="DJ">DJ</option>
			                	<option value="국악">국악</option>
			                	<option value="클래식">클래식</option>
			                	<option value="기타">기타</option>
			                </select>
		                </td>
						<td>
							<h5>금액<span class="form_red">*</span></h5>
						</td>
						<td>
							<select name="price1" class="price1">
			                	<option>선택</option>
			                	<option value="한곡 기준">한 곡 기준</option>
			                	<option value="시간 단위(30분)">시간 기준(30분)</option>
			                </select>
			                <select name="price2" class="price2">
			                	<option>선택</option>
			                    <option value="100,000원">100,000원</option>
			                    <option value="200,000원">200,000원</option>
			                    <option value="300,000원">300,000원</option>
			                    <option value="400,000원">400,000원</option>
			                    <option value="500,000원">500,000원</option>
			               </select>
		               	</td>
		              	
					</tr>
					
				</table>
				<table>
					<tr>
						<td width="12%"><h5>대표 이미지<span class="form_red">*</span></h5></td>
						<td><input type="file" name="thumbImg" class="fileA"/></td>
					</tr>
					
					<tr>
						<td colspan="4">
		            		<textarea placeholder="아티스트 소개란입니다." rows="15" name="content"></textarea>
		            	</td>
		            </tr>
		         </table>
		         <table id="area" class="fileAttach">
					<tr>
						<td><h5>첨부 이미지</h5></td>
						<td>
							<input type="file" class="input-file fileA" name="files">
			        	</td>
						<td><input class="fileAdd" type="button" value="삭제" onclick="deleteFileForm()"/></td>
						<td><input class="fileAdd" type="button" value="추가" onclick="insertFileForm()"/></td>
					</tr>
				</table>
				<table>	
					<tr>
						<td><h5>유튜브 등록</h5></td>
						<td class="table_l">
							<input type="text" name="video"/>
							<span class="form_red" >※ 유튜브 영상 주소를 업로드해주세요. </span>
						</td>
					</tr>
				</table>
			</div>
		   		<div class="edit_btn">
			    	<a class="w_btn" href="../User/mypage.do">취소</a>
			        <input class="b_btn" type="submit" value="등록하기">
	    		</div>
	    		
	        </form>
	       
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
		        	var td1 = "<input type='file' class='input-file fileA' name='files'>";
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
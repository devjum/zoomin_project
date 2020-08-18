	
	function checkValue(){
			var form = document.inquiry_form;
			if(form.categorize.value=="선택"){
				alert("분류는 필수 입력항목입니다.");
				form.categorize.focus();
				return false;
			}
			if(form.title.value==""){
				alert("제목은 필수 입력항목입니다.");
				form.title.focus();
				return false;
			}   if(form.content.value==""){
				alert("문의 내용을 입력해주세요.");
				form.content.focus();
				return false;
			} 
			return true;
		}
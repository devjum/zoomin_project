	
	function checkValue(){
			var form = document.reserve_form;
			if(form.perDate.value==""){
				alert("공연일시는 필수 입력항목입니다.");
				return false;
			} if(form.perTime.value==""){
				alert("공연시간은 필수 입력항목입니다.");
				return false;
			} if(form.perPlace.value==""){
				alert("공연장소는 필수 입력항목입니다.");
				form.perPlace.focus();
				return false;
			} if(form.perName.value==""){
				alert("공연명은 필수 입력항목입니다.");
				form.perName.focus();
				return false;
			} if(form.perDetail.value==""){
				alert("공연 상제 정보는 필수 입력항목입니다.");
				form.perDetail.focus();
				return false;
			}  
			return true;
		}
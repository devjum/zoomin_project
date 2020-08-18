	
	function checkValue(){
			var form = document.review_form;
			if(form.score.value=="선택"){
				alert("평점은 필수 입력항목입니다.");
				return false;
			} if(form.review.value==""){
				alert("후기 내용은 필수 입력항목입니다.");
				form.review.focus();
				return false;
			} 
			return true;
		}
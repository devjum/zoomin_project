		
		
		var searchChks = document.getElementsByName("searchChk");

		function categoryChk(){
			for(var i=0; i<searchChks.length; i++){
				if(searchChks[i].checked==true){
					return true;
				}
			} 
			alert('검색 항목을 선택해주세요.');
			return false;
		}
		
		$(document).ready(function(){
	  		$("#all").click(function(){ 
	  			//만약 전체 선택 체크박스가 체크된상태일경우 
	  			if($("#all").prop("checked")) 
	  			{ 
	  				//해당화면에 전체 checkbox들을 체크해준다 
	  				$("input[type=checkbox]").prop("checked",true); 
	  				// 전체선택 체크박스가 해제된 경우 
	  			} else { 
	  					//해당화면에 모든 checkbox들의 체크를해제시킨다. 
	  				$("input[type=checkbox]").prop("checked",false);
	  			} 
	  		})
	  		$("#dance,#vocal,#classic,#band,#dj,#koreanClassic,#etc").click(function(){
	  			if($("input[type='dance'],input[type='vocal'],input[type='classic'],input[type='band'],input[type='dj'],input[type='koreanClassic'],input[type='etc']").is(":checked")==false){
	  	  			$("input[id='all']").prop("checked",false)
	  	  		}
	  		})
	  	});
		
		
		function checkValue(){
					var form = document.register_form;
					if(form.title.value==""){
						alert("제목은 필수 입력항목입니다.");
						form.title.focus();
						return false;
					} if(form.categorize.value=="선택"){
						alert("분류는 필수 입력항목입니다.");
						form.categorize.focus();
						return false;
					} if(form.price1.value=="선택"){
						alert("금액은 필수 입력항목입니다.");
						return false;
					} if(form.price2.value=="선택"){
						alert("금액은 필수 입력항목입니다.");
						return false;
					} if(form.thumbImg.value==""){
						alert("대표 이미지는 필수 등록항목입니다.");
						form.thumbImg.focus();
						return false;
					} if(form.content.value==""){
						alert("아티스트 소개는 필수 입력항목입니다.");
						form.content.focus();
						return false;
					} 
					return true;
				}
		




		
		
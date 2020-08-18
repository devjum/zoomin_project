
	
	function delAlert(text){
		return confirm(text+" 삭제를 진행하시겠습니까?");
	};
	
	
	var checkedId = document.getElementsByName("admIds");
	var allCheckbox = document.getElementById("checkAll");
	$(document).ready(function(){
  		$("#checkAll").click(function(){ 
  			//만약 전체 선택 체크박스가 체크된상태일경우 
  			if($("#checkAll").prop("checked")) 
  			{ 
  				//해당화면에 전체 checkbox들을 체크해준다 
  				$("input[name='admSelected']").prop("checked",true); 
  				// 전체선택 체크박스가 해제된 경우 
  			} else { 
  					//해당화면에 모든 checkbox들의 체크를해제시킨다. 
  				$("input[name='admSelected']").prop("checked",false);
  			} 
  		})
  		
	});
	


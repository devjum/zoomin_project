			function updateProfile(){
    			var form = document.upForm;
    			if(form.style.display=="none"){
    				form.style.display="block";
    			} else
    				form.style.display="none";
    		}
    		
    		function showReview(){
    			var reserveList = document.getElementById('reserveList');
    			reserveList.style.display="none";
    			var reviewList = document.getElementById('reviewList');
    			reviewList.style.display="block";
    		} 
    		function showReserve(){
    			var reviewList = document.getElementById('reviewList');
    			reviewList.style.display="none";
    			var reserveList = document.getElementById('reserveList');
    			reserveList.style.display="block";
    		}
    		function reviewClose(){
    			var reviewList = document.getElementById('reviewList');
    			reviewList.style.display="none";
    		}
    		function reserveClose(){
    			var reserveList = document.getElementById('reserveList');
    			reserveList.style.display="none";
    		}
    		
    		$(document).ready(function(){ 
    			var fileTarget = $('.filebox .upload-hidden'); 
    			fileTarget.on('change', function(){ // 값이 변경되면 
    				if(window.FileReader){ // modern browser 
    					var filename = $(this)[0].files[0].name; } else { // old IE 
    						var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
    						} // 추출한 파일명 삽입 
    						$(this).siblings('.upload-name').val(filename); }); 
    			
    			$(".moreBtn").click(function(){
			    	  if($(this).parent().find(".reviewTxt").css("display")=="none"){
			           	$(this).parent().find(".reviewTxt").css("display","block");
			           	$(this).parent().find(".moreIcon").addClass("xi-angle-up-min");
			           	$(this).parent().find(".moreIcon").removeClass("xi-angle-down-min");
			    	  } else {
			    		  $(this).parent().find(".reviewTxt").css("display","none");
			    		  $(this).parent().find(".moreIcon").addClass("xi-angle-down-min");
				           	$(this).parent().find(".moreIcon").removeClass("xi-angle-up-min");
			    	  }
			       });
    			
    		});
    		
    		function show_reserveInfo(){
					document.getElementById('reserveMore').style.display="block";
			}

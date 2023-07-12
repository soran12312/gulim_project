(function($) {
	// 대카테고리명 찾기: nav-text 클래스를 지닌 요소를 찾음
	var selectedMenu_left = document.querySelector("li.mm-active-selected span.nav-text");
	// 소카테고리명 찾기: tab_active 클래스를 지닌 요소를 찾음
	var selectedMenu_right = document.querySelector("div.text-uppercase .tab_active");
	
	// 카테고리명을 담을 곳
	var category_big = document.getElementById("category_big");
	var category_small = document.getElementById("category_small");
	// 대카테고리명과 소카테고리명을 담을 곳에다 담음
	category_big.textContent = selectedMenu_left.textContent;
	category_small.textContent = selectedMenu_right.textContent;
	
	
    var table = $('#example').DataTable();
    
    
    //***********문의사항 ***********//
    
    // 문의사항 테이블
    var table_question = $('.questionTable').DataTable();
    // 이전에 있던 답변창
	var previousInputRow = null;
	
	// 문의사항 테이블의 tbody 내의 tr을 클릭했을 시
	$('.questionTable tbody').on('click', '.answer-link', function(e) {
	
		$('tbody tr').removeClass('selected');
	
	    if ($(e.target).is('input') || $(e.target).is('textarea')) {
	        // input 요소를 클릭한 경우 혹은 클릭한 요소가 textarea인 경우, 선택 상태 유지
	        return;
	    }
	
		var answerField = $(this).find('td:nth-child(5)')
		var answer = answerField.text();
		var textArea1 = '<textarea name="answer" class="text_answer">' 
		    + answer 
		    +'</textarea></td>'
	    var inputRow1 = $(
		'<tr class="input-row tr1"><td height="200px" colspan="4" style="position: relative;">'
		    + textArea1
	    +'</tr>'
	    +'<tr class="input-row tr2">'
		    +'<td colspan="3"></td>'
		    +'<td>'
		    +'<button type="submit" id="answerQuestion" class="btn btn-outline-success">답변</button>'
		    +'<button id="cancelAnswer" class="btn btn-outline-danger">취소</button>'
		    +'</td>'
		+'</tr>');
		
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
            table.$('');
            if (previousInputRow) {
                previousInputRow.remove();
                previousInputRow = null;
            }
        } else {
            if (previousInputRow) {
                previousInputRow.remove();
            }
            $(this).after(inputRow1);
            previousInputRow = inputRow1;
        }
	    var question_num = $(this).find('#question_num').text(); // 선택한 질문 번호를 가져옵니다.
	   	
	   	$('.questionTable tbody tr').on('click', '#answerQuestion', function(e) {
	    	//var updatedAnswer = $(textArea1).val();
	    	answerField.empty().append(textArea1);
	    	var updatedAnswer = $(this).closest('.tr2').parent().parent().parent().find('.tr1 .text_answer').val();
	    	console.log($(this).parents('tbody').find('.text_answer').val());
	    
	   		 $.ajax({
				anyne:true,
		        url: "/admin/question",
		        method: 'POST',
		        data: JSON.stringify({ answer: updatedAnswer, question_num: question_num }), // 서버로 전송할 데이터를 설정합니다.
		        contentType:"application/json; charset=UTF-8",
		        success: function(response) {
		           
					location.reload();
		            // 성공적으로 응답을 받았을 때 실행할 코드
		            // 예: 업데이트된 데이터를 표시하거나 처리 완료 메시지를 표시하는 등의 동작
		            // 답변 등록 후 필요한 동작을 수행합니다.
		        },
		        error: function(xhr, status, error) {
		            alert('error: '+error);
		            console.log(xhr);
		            console.log(status);
		            console.log(error);
		        }
		    });
		});
		
		$('.questionTable tbody tr').on('click', '#cancelAnswer', function(e) {
			$(this).closest('.tr2').parent().parent().parent().find('.tr1').remove();
			$(this).closest('.tr2').remove();
			$('tbody tr').removeClass('selected');
		});
		
		
	   	
	});
	
	$('.memberTable tbody').on('click', '.member-link', function(e) {
		$('tbody tr').removeClass('selected');
	});

	
	$('.memberTable tbody').on('change', '.selectMember', function(e) {
		
		var member_state = $(this).val();
		var id = $(this).parent().parent().find('td:first-child').text();
		
		$.ajax({
			anyne:true,
			url: "/admin/member_management",
			method: "POST",
			data: JSON.stringify({member_state: member_state, id:id}),
			contentType:"application/json; charset=UTF-8",
			success: function(response){
				location.reload();
			},
			error: function(xhr, status, error){
				alert('error: '+error);
			}
		});
	});
	
	var showAllButton = $('button.showAll');
	var showAffiliateOnlyButton = $('button.showAffiliateOnly');
	var selectElement = $('select');
	var tablePlace = $('.placeTable').DataTable();
	
	showAllButton.on('click', function() {
	    tablePlace.columns().search('').draw();
	});
	
	showAffiliateOnlyButton.on('click', function() {
	    tablePlace.columns(3).search('제휴중').draw();
	});
	
	selectElement.on('change', function() {
	    var value = $(this).val();
	    tablePlace.columns(3).search(value).draw();
	});
	
	$('.placeTable tbody').on('click', 'tr', function(e) {
		$('tbody tr').removeClass('selected');
	});
	
	
	
	//*********** 환불 ***********//
    $('.refundTable tbody').on('click', '.refund-link', function(e) {
		$('tbody tr').removeClass('selected');
	});
	
	$('.refundTable tbody').on('change', '.selectRefund', function(e) {
		
		var delivery_state = $(this).val();
		var basket_num = $(this).parent().parent().find('td:first-child').text();
		
		$.ajax({
			anyne:true,
			url: "/admin/delivery_refund",
			method: "POST",
			data: JSON.stringify({delivery_state: delivery_state, basket_num:basket_num}),
			contentType:"application/json; charset=UTF-8",
			success: function(response){
				location.reload();
			},
			error: function(xhr, status, error){
				alert('error: '+error);
			}
		});
	});
	
	
	//*********** 관리자 글목록 ***********//
	
	$('.postTable tbody').on('click', '.post-link', function(e) {
		$('tbody tr').removeClass('selected');
	});
	
	var filterSelect = $('#filter-select');
	var tablePost = $('.postTable').DataTable();
	
	filterSelect.on('change', function() {
		var selectedPost = filterSelect.val(); // 선택한 게시판의 값 가져오기
		
		if (selectedPost != '전체보기') {
		    tablePost.columns(1).search(selectedPost).draw();
		} else {
		    tablePost.columns(1).search('').draw();
		}
	});
	
	$('.postTable tbody').on('click', '.post-link', function(e) {
		$('tbody tr').removeClass('selected');
	});
	
	$('.postTable tbody').on('change', '.selectPost', function(e) {
		
		var post_state = $(this).val();
		var post_num = $(this).parents('tr').find('td:first-child').text();
		
		$.ajax({
			anyne:true,
			url: "/admin/view_list",
			method: "POST",
			data: JSON.stringify({post_state: post_state, post_num:post_num}),
			contentType:"application/json; charset=UTF-8",
			success: function(response){
				location.reload();
			},
			error: function(xhr, status, error){
				alert('실패'+post_state + post_num);
				console.log(error);
			}
		});
	});
	
	$('.productTable tbody').on('click', '.product-link', function(e) {
		$('tbody tr').removeClass('selected');
	});
    
    
})(jQuery);

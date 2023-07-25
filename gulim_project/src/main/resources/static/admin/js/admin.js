// jQuery start
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
	
	// DataTables 라이브러리에서 가져온 테이블 전부 지칭
    var table = $('#example').DataTable();
    
    
    //***********문의사항 start ***********//
    
    // 문의사항 테이블
    var table_question = $('.questionTable').DataTable();
    // 이전에 있던 답변창
	var previousInputRow = null;
	
	// 문의사항 테이블의 tbody 내의 tr을 클릭했을 시
	$('.questionTable tbody').on('click', '.answer-link', function(e) {
		// selected 클래스 지우기(선택 취소)
		$('tbody tr').removeClass('selected');
		// input 요소를 클릭한 경우 혹은 클릭한 요소가 textarea인 경우
	    if ($(e.target).is('input') || $(e.target).is('textarea')) {
	        // 선택 상태 유지
	        return;
	    }
		// hidden으로 생겨놓은 answer td 영역
		var answerField = $(this).find('td:nth-child(5)')
		// answer td 영역의 text값
		var answer = answerField.text();
		// 이전에 했던 답변을 textarea에 가져오기 위해 생성한 변수
		var textArea_answer = '<textarea name="answer" class="text_answer">' 
		    + answer 
		    +'</textarea></td>'
		// 테이블의 한 행을 클릭했을 때 나오는 새 행, textArea_answer 포함
	    var inputRow1 = $(
		'<tr class="input-row tr1"><td height="200px" colspan="4" style="position: relative;">'
		    + textArea_answer
	    +'</tr>'
	    +'<tr class="input-row tr2">'
		    +'<td colspan="3"></td>'
		    +'<td>'
		    +'<button type="submit" id="answerQuestion" class="btn btn-outline-success">답변</button>'
		    +'<button id="cancelAnswer" class="btn btn-outline-danger">취소</button>'
		    +'</td>'
		+'</tr>');
		
		// 이미 선택된 행을 클릭한다면
		if ($(this).hasClass('selected')) {
			// 선택 해제
			$(this).removeClass('selected');
			// DataTable의 어떤 것도 선택하지 않음
            table.$('');
            // 이전에 만들어진 tr이 있으면
            if (previousInputRow) {
				// 그 tr을 지우고
                previousInputRow.remove();
                // tr 초기화(null값 주입)
                previousInputRow = null;
            }
          // 직전에 선택된 행이 아니라면?
        } else {
			// 이전에 만들어진 tr이 있을 시
            if (previousInputRow) {
				// 일단 기존 tr을 지우고
                previousInputRow.remove();
            }
            // 클릭한 행 밑에 tr을 생성하고
            $(this).after(inputRow1);
            // 나중에 이 행을 지울 걸 생각해서 '이전 행'에 등록하기
            previousInputRow = inputRow1;
        }
        
        // 선택한 질문 번호를 변수에 저장
	    var question_num = $(this).find('#question_num').text(); 
	    
	   	// 답변 버튼을 클릭 시
	   	$('.questionTable tbody tr').on('click', '#answerQuestion', function(e) {
	    	// 기존 답변 지우고 새 답변 넣음
	    	answerField.empty().append(textArea_answer);
	    	// 새 답변의 값 추출
	    	var updatedAnswer = $(this).closest('.tr2').parents('tbody').find('.tr1 .text_answer').val();
	    	
	    	
	    	 // ajax start
	   		 $.ajax({
				// 경로
		        url: "/admin/question",
		        // 전송방식: POST
		        method: 'POST',
		        // 서버로 전송할 데이터, JSON을 string으로 변환
		        data: JSON.stringify({ answer: updatedAnswer, question_num: question_num }),
		        // 서버로 전송할 데이터의 타입
		        contentType:"application/json; charset=UTF-8",
		        // ajax 성공 시
		        success: function(response) {
		            // 새로고침(수정값 들어오게)
					location.reload();
		        },
		        error: function(error) {
		            alert('error: '+error);
		        }
		    });
		    // ajax end
		});
		
		// 취소버튼 클릭 시
		$('.questionTable tbody tr').on('click', '#cancelAnswer', function(e) {
			// textarea가 있는 행 삭제
			$(this).closest('.tr2').parents('tbody').find('.tr1').remove();
			// 버튼이 있는 행 삭제
			$(this).closest('.tr2').remove();
			// 선택 해제
			$('tbody tr').removeClass('selected');
		});
		// 답변 버튼을 클릭 시 end
	});
	// 문의사항 테이블의 tbody 내의 tr을 클릭했을 시 end
	
	//***********문의사항 end ***********//
	
	
	//*********** 제재 관리 start ***********//
	
	// 제재 관리 테이블의 tbody 내의 tr을 클릭했을 시
	$('.memberTable tbody').on('click', '.member-link', function(e) {
		// selected 클래스 지우기(선택 취소)
		$('tbody tr').removeClass('selected');
	});

	// 제재 관리 테이블의 tbody 내의 select 값을 변경할 시
	$('.memberTable tbody').on('change', '.selectMember', function(e) {
		
		// 선택한 select의 값 추출
		var member_state = $(this).val();
		// id 값 추출
		var id = $(this).parent().parent().find('td:first-child').text();
		
		// ajax start
		$.ajax({
			// 경로
			url: "/admin/member_management",
			// 전송방식: POST
			method: "POST",
			// 서버로 전송할 데이터, JSON을 string으로 변환
			data: JSON.stringify({member_state: member_state, id:id}),
			// 서버로 전송할 데이터의 타입
			contentType:"application/json; charset=UTF-8",
			// ajax 성공 시
			success: function(response){
				// 새로고침(수정값 들어오게)
				location.reload();
			},
			error: function(xhr, status, error){
				alert('error: '+error);
			}
		});
		// ajax end
	});
	// 제재 관리 테이블의 tbody 내의 select 값을 변경할 시 end
	
	//*********** 제재 관리 end ***********//
	
	
	//*********** 제휴 관리 start ***********//
	
	// 매장 전체보기 버튼
	var showAllButton = $('button.showAll');
	// 제휴카페만 보기 버튼
	var showAffiliateOnlyButton = $('button.showAffiliateOnly');
	// select 태그
	var selectElement = $('select');
	// placeTable
	var tablePlace = $('.placeTable').DataTable();
	
	// 전체보기 버튼 클릭 시
	showAllButton.on('click', function() {
		// placeTable의 열의 검색을 초기화하고 테이블을 그림
	    tablePlace.columns().search('').draw();
	});
	
	// 제휴카페만 보기 버튼 클릭 시
	showAffiliateOnlyButton.on('click', function() {
		// placeTable의 3번째 열 중 '제휴중'이라는 값을 검색한 다음 그게 들어간 테이블을 그림
	    tablePlace.columns(3).search('제휴중').draw();
	});
	// 제휴 관리 테이블의 tbody 내의 tr을 클릭했을 시
	$('.placeTable tbody').on('click', 'tr', function(e) {
		// selected 클래스 지우기(선택 취소)
		$('tbody tr').removeClass('selected');
	});
	//*********** 제휴 관리 end ***********//
	
	
	//*********** 환불 start ***********//
	
	// 환불 테이블의 tbody 내의 tr을 클릭했을 시
    $('.refundTable tbody').on('click', '.refund-link', function(e) {
		// selected 클래스 지우기(선택 취소)
		$('tbody tr').removeClass('selected');
	});
	
	// 환불 테이블의 tbody 내의 tr을 클릭했을 시
	$('.refundTable tbody').on('change', '.selectRefund', function(e) {
		
		// 상태의 값
		var delivery_state = $(this).val();
		// 주문번호의 값
		var basket_num = $(this).parent().parent().find('td:first-child').text();
		
		// ajax start
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
		// ajax end
	});
	
	//*********** 환불 end ***********//
	
	//*********** 관리자 글목록 start ***********//
	
	// 관리자 글목록 테이블의 tbody 내의 tr을 클릭했을 시
	$('.postTable tbody').on('click', '.post-link', function(e) {
		// selected 클래스 지우기(선택 취소)
		$('tbody tr').removeClass('selected');
	});
	
	// select를 변수에 저장
	var filterSelect = $('#filter-select');
	// postTable 변수에 저장
	var tablePost = $('.postTable').DataTable();
	
	// select문의 값이 바뀔 시
	filterSelect.on('change', function() {
		// 선택한 게시판의 값 가져오기
		var selectedPost = filterSelect.val();
		// 선택한 게시판의 값이 전체보기가 아닐 경우에
		if (selectedPost != '전체보기') {
			// placeTable의 첫 번째 열을 검색하고 그 값을 갖고 있는 것만 검색하고 테이블을 그림
		    tablePost.columns(1).search(selectedPost).draw();
		// 선택한 게시판의 값이 전체보기일 때
		} else {
			// 다 가져옴
		    tablePost.columns(1).search('').draw();
		}
	});
	
	// postTable의 select 태그 값을 변경할 시 start
	$('.postTable tbody').on('change', '.selectPost', function(e) {

		// 등록상태 값
		var post_state = $(this).val();
		// 글번호 값
		var post_num = $(this).parents('tr').find('td:first-child').text();
		
		// ajax start
		$.ajax({
			// 경로
			url: "/admin/view_list",
			// 전송방식: POST
			method: "POST",
			// JSON data를 string으로 변환
			data: JSON.stringify({post_state: post_state, post_num:post_num}),
			// data 전송할 때의 타입
			contentType:"application/json; charset=UTF-8",
			// 성공할 시
			success: function(response){
				// 새로고침
				location.reload();
			},
			error: function(xhr, status, error){
				alert('실패'+post_state + post_num);
				console.log(error);
			}
		});
		// ajax end
	});
	// 환불 테이블의 tbody 내의 tr을 클릭했을 시 end
	//*********** 관리자 글목록 end ***********//
	
	//*********** 상품 등록 및 수정 start ***********//
	$('.productTable tbody').on('click', '.product-link', function(e) {
		e.preventDefault();
		$('tbody tr').removeClass('selected');
		var book_num = $(this).find('td:nth-child(1)').text();
		
		var url = "/admin/product_modify?book_num=" + book_num
        $('#product_detail_button').attr('href', url);
		
		
	});
	
	
	
	
    //*********** 상품 등록 및 수정 end ***********//
    
})(jQuery);
// jQuery end
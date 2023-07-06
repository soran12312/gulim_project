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
    var previousInputRow = null;

    $('#example tbody').on('click', 'tr', function(e) {
        
        if ($(this).hasClass('selected')) {
            table.$('tr.selected').removeClass('selected');
        } else {
            table.$('tr.selected').removeClass('selected');
            table.$('tr.selected').addClass('selected');
        }
    });
    
    var table_question = $('.questionTable').DataTable();
    $('.questionTable tbody').on('click', 'tr', function(e) {
		if ($(e.target).is('input')) {
            // input 요소를 클릭한 경우, 선택 상태 유지
            return;
        }

        // 클릭한 요소가 textarea인 경우, 처리하지 않음
        if ($(e.target).is('textarea')) {
            return;
        }
        
        var inputRow = $('<tr class="input-row"><td height="200px" colspan="4" style="position: relative;"><textarea class="text_answer"></textarea></td><input type="button" value="asdf"></tr><tr class="input-row"><td colspan="3"></td><td><button type="submit" class="btn btn-outline-success">답변등록</button><button class="btn btn-outline-danger">취소</button></td></tr>');
        
        if ($(this).hasClass('selected')) {
            table.$('');
            if (previousInputRow) {
                previousInputRow.remove();
                previousInputRow = null;
            }
        } else {
            if (previousInputRow) {
                previousInputRow.remove();
            }
            $(this).after(inputRow);
            previousInputRow = inputRow;
        }
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
		if ($(e.target).is('input')) {
            // input 요소를 클릭한 경우, 선택 상태 유지
            return;
        }

        // 클릭한 요소가 textarea인 경우, 처리하지 않음
        if ($(e.target).is('textarea')) {
            return;
        }
        
        var inputRow = $('<tr class="input-row"><td colspan="2"></td><td height="80px" colspan="1" style="position: relative;"><textarea class="text_gameList"/></td><td colspan="1"></td></tr><tr class="input-row"><td colspan="2"></td><td><div class="btn_right"><button type="submit" class="btn btn-outline-success">룰북등록</button><button class="btn btn-outline-danger">취소</button></div></td></tr>');
        
        if ($(this).hasClass('selected')) {
            table.$('');
            if (previousInputRow) {
                previousInputRow.remove();
                previousInputRow = null;
            }
        } else {
            if (previousInputRow) {
                previousInputRow.remove();
            }
            $(this).after(inputRow);
            previousInputRow = inputRow;
        }
	});
	
	var filterSelect = $('#filter-select');
	var tablePost = $('.postTable').DataTable();
	
	filterSelect.on('change', function() {
		var selectedPost = filterSelect.val(); // 선택한 게시판의 값 가져오기
		
		if (selectedPost != '전체보기') {
		    tablePost.columns(0).search(selectedPost).draw();
		} else {
		    tablePost.columns(0).search('').draw();
		}
	});
	
	function cancelAction() {
        // 원하는 동작을 수행하도록 JavaScript 코드를 작성합니다.
        // 예: 취소 버튼을 클릭했을 때 어떤 동작을 수행하거나 다른 페이지로 이동하도록 설정할 수 있습니다.
        alert("취소 버튼이 클릭되었습니다.");
    }
    
    
})(jQuery);

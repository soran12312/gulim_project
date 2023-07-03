(function($) {
	//대카테고리명
	var selectedMenu_left = document.querySelector("li.mm-active-selected span.nav-text");
	//소카테고리명
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
        
        var inputRow = $('<tr class="input-row"><td height="200px" colspan="4" style="position: relative;"><textarea class="text_answer"/></td><input type="button" value="asdf"></tr><tr class="input-row"><td colspan="3"></td><td><button type="submit" class="btn btn-outline-success">답변등록</button><button class="btn btn-outline-danger">취소</button></td></tr>');
        
        if ($(this).hasClass('selected')) {
            table.$('');
            if (previousInputRow) {
                previousInputRow.remove();
                previousInputRow = null;
            }
        } else {
            if (previousInputRow && !previousInputRow.is($(this).next())) {
                previousInputRow.remove();
            }
            $(this).after(inputRow);
            previousInputRow = inputRow;
        }
        
	});
    
})(jQuery);

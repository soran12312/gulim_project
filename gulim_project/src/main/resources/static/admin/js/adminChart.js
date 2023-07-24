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
	
    let postForm = function() {
		let content = $('textarea[name="content"]').html($('#summernote').code());
	}
	
	let postForm2 = function() {
		let content2 = $('textarea[name="contest_content"]').html($('#summernote').code());
	}
	
	$("#inputState_noContest").on("change", function() {
	    var selectedValue = $(this).val();
	    if (selectedValue === "공모전") {
	        $("#announceOrEvent").prop("hidden", true);
	        $("#justContest").prop("hidden", false);
	    }
	    // 동기화: 'inputState_yesContest'의 값을 변경하여 'inputState_noContest'와 동일하게 만든다.
	    $("#inputState_yesContest").val(selectedValue);
	});
	
	$("#inputState_yesContest").on("change", function() {
	    var selectedValue = $(this).val();
	    if (selectedValue === "공지사항" || selectedValue === "이벤트") {
	        $("#announceOrEvent").prop("hidden", false);
	        $("#justContest").prop("hidden", true);
	    }
	    // 동기화: 'inputState_noContest'의 값을 변경하여 'inputState_yesContest'와 동일하게 만든다.
	    $("#inputState_noContest").val(selectedValue);
	});
    
})(jQuery);

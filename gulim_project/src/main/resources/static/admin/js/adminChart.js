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
		// summernote 에디터에서 생성된 HTML 코드를 가져와서 textarea의 content라는 name 속성을 가진 요소에 HTML 내용으로 설정합니다.
		let content = $('textarea[name="content"]').html($('#summernote').code());
	}
	
	let postForm2 = function() {
		// summernote 에디터에서 생성된 HTML 코드를 가져와서 textarea의 contest_content라는 name 속성을 가진 요소에 HTML 내용으로 설정합니다.
		let content2 = $('textarea[name="contest_content"]').html($('#summernote').code());
	}
	
	
	// "inputState_noContest" 요소의 값이 변경되면 실행되는 이벤트 핸들러
	$("#inputState_noContest").on("change", function() {
		// 선택된 값을 가져옵니다.
	    var selectedValue = $(this).val();
	    if (selectedValue === "공모전") {
			// 특정 요소를 숨깁니다.
	        $("#announceOrEvent").prop("hidden", true); 
	        // 특정 요소를 표시합니다.
	        $("#justContest").prop("hidden", false);    
	    }
	    // 'inputState_yesContest'의 값을 변경하여 'inputState_noContest'와 동일하게 만듭니다.
	    $("#inputState_yesContest").val(selectedValue);
	});
	
	// "inputState_yesContest" 요소의 값이 변경되면 실행되는 이벤트 핸들러
	$("#inputState_yesContest").on("change", function() {
		// 선택된 값을 가져옵니다.
	    var selectedValue = $(this).val();
	    if (selectedValue === "공지사항" || selectedValue === "이벤트") {
			// 특정 요소를 표시합니다.
	        $("#announceOrEvent").prop("hidden", false);
	        // 특정 요소를 숨깁니다.
	        $("#justContest").prop("hidden", true);
	    }
	    // 'inputState_noContest'의 값을 변경하여 'inputState_yesContest'와 동일하게 만듭니다.
	    $("#inputState_noContest").val(selectedValue);
	});
	
	// 파일 선택 시 이미지 미리보기 기능을 제공하는 이벤트 핸들러
	$('#adminPostUpdate').on('change', function() {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	        // 파일 내용을 읽어 'adminPostPath'의 src 속성에 할당하여 이미지를 표시합니다.
	        $('#adminPostPath').attr('src', e.target.result);
	    }
	    // 파일 데이터를 읽습니다.
	    reader.readAsDataURL(this.files[0]); 
	});
	
	// ".btn-pfs", ".btn-pfc", ".btn-pfsp" 클래스가 클릭되면 "class-select" 요소를 숨깁니다.
	$(".btn-pfs, .btn-pfc, .btn-pfsp").click(function() {
	    $("#class-select").hide();
	});
	
	// ".btn-pfst" 클래스가 클릭되면 "class-select" 요소를 표시합니다.
	$(".btn-pfst").click(function() {
	    $("#class-select").show();
	});

    
})(jQuery);

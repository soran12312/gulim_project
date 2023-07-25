<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/files/images/favicon-32x32.png">
<link href="/css/trpg.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$('#btn').click(function(){
        modify_info_img();
	});


    //※ function title	:	modify_info_img  
//※ function info	:	이미지 저장하는 함수
	function modify_info_img(){

//form에 이미지넣고 form을 formData에 넣기
var form = $("#form")[0];
var formData = new FormData(form);
var title = $('#title').val();
var cate = $('#cate').val
//이미지 & id 를 formData에 넣기
formData.append("title", title);
formData.append("file", $('#img_modify_real')[0].files[0])

//mypage/user_info/modify_info_img로 formData보내기
 $.ajax({
     url : '/mypage/user_info/modify_info_img'
   , type : "POST"
   , processData : false
   , contentType : false
   , data : formData
   , success:function(response) {
        //성공 시 스윗alert
         if(response){
               swal.fire("프로필사진이 변경되었습니다!"); 
         } 
         else{
            swal.fire("오류입니다T^T 다시 시도하시고 지속될 경우 문의해주세요!"); 
         }
   }
   ,error: function(err){console.log(err);}//END of error
});
}

});

</script>
</head>
<body>
임시 이미지 입력 페이지 입니다.
</br>
<form id = "form">
<select id = "cate">
<option value="monster">몬스터</option>
<option value="item">아이템</option>
<option value="etc">기타</option>
</select>

<input type= "file"  name = "img">

타이틀 입력
<input type="text" id = "title">
<button id = "btn">확인</button>

</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
            <link href="/css/place.css" rel="stylesheet"/>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
            <script type="text/javascript">

            $(function() {
                // 메세지 이벤트 등록
                window.addEventListener("message", (event) => {
              
                  console.log("Received message: ", event.data);
                  console.log(event);
                    //event.data.message가 "user_connect" 라면
                    if(event.data.message === "user_connect"){
                        // iframe 만듬
                        var iframe=document.createElement("iframe");
                        //새로 만든 iframe의 id 값을 받아온 userId로 지정
                        $("#live_chat").children().last().attr('id', event.data.userId);
                        //iframe 속성
                        iframe.src = "https://192.168.0.68:3000/customerchat/rickyko";
                        iframe.style.height = "600px";
                        iframe.style.width = "600px";
                        iframe.scrolling = "no";
                        
                        //만든 iframe을 "live_chat"의 자식으로 붙힘
                        document.getElementById("live_chat").appendChild(iframe);
                        console.log("second_iframe"+"불림")
                    // 만약에 event.data.message 가 "leave_chatting" 이라면
                    }else if (event.data.message === "leave_chatting") {
                        // 해당 유저의 iframe 삭제함
                    	$("#"+event.data.userId).remove();
                        
               		}
                    
                },true)

            });
      
            </script>
            <title>실시간 문의 사항</title>
        </head>
        <body>

            <div class="mybotpage" id="live_chat">
                <iframe src="https://192.168.0.68:3000/customerchat/rickyko" style="height: 600px; width: 600px;" scrolling="no"></iframe>
            </div>   
            </div>
        </body>

        </html>
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
            
                window.addEventListener("message", (event) => {
              
                  console.log("Received message: ", event.data);
                  console.log(event);
                  
                  if(event.data === "user_connect"){
                        var iframe=document.createElement("iframe");
                        
                        iframe.src = "https://192.168.0.68:3000/customerchat/123";
                        iframe.style.height = "300px";
                        iframe.style.width = "300px";
                        iframe.className = "second_iframe"
                        document.getElementById("live_chat").appendChild(iframe);
                        console.log("second_iframe"+"불림")

                    }else if (event.data === "leave_chatting") {
                   
                   var iframeRemove = document.querySelector(".second_iframe");
                   if (iframeRemove) {
                   iframeRemove.parentNode.removeChild(iframeRemove);
                   }
               }
                    
                },true)

            });
      
            </script>
            <title>실시간 문의 사항</title>
        </head>
        <body>
            <jsp:include page="../../../../header_after.jsp"></jsp:include>
            <div class="mybotpage" id="live_chat">
                <iframe src="https://192.168.0.68:3000/customerchat/123" style="height: 300px; width: 300px;" class="first_iframe"></iframe>        

            </div>
        </body>
        <jsp:include page="../../../../footer.jsp"></jsp:include>
        </html>
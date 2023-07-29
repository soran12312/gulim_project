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
                    if(event.data === "user_connect"){

                        var iframe=document.createElement("iframe");
                        iframe.src = "https://192.168.0.68:3000/customerchat/123";
                        iframe.style.height = "300px";
                        iframe.style.width = "300px";
                        document.getElementById("live_chat").appendChild(iframe);
                      
                    }
                }, true);

            
        });
            </script>
            <title>실시간 문의 사항</title>
        </head>
        <body>
            <jsp:include page="../../../../header_after.jsp"></jsp:include>
            <div class="mybotpage" id="live_chat">
                <iframe src="https://192.168.0.68:3000/customerchat/123" style="height: 300px; width: 300px;"></iframe>
            </div>
        </body>
        <jsp:include page="../../../../footer.jsp"></jsp:include>
        </html>
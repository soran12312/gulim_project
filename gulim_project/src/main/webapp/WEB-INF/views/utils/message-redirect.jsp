<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
    <body>
        <c:if test="${not empty params}">
		    <form name="dataForm" action="${redirectUri}" method="${method}" style="display: none;">
		        <c:forEach items="${params}" var="entry">
		            <input type="hidden" name="${entry.key}" value="${entry.value}" />
		        </c:forEach>
		    </form>
		</c:if>
		
		<script>
		    window.onload = function() {
		        var message = "${message}";
		        console.log("Message:", message);
		
		        // Check if params is null, and if so, set it to an empty object
		        var params = ${params ? params : {}};
		        console.log("Params:", params);
		
		        if (message) {
		            alert(message);
		        }
		
		        if (params && Object.keys(params).length > 0) {
		            document.dataForm.submit();
		        } else {
		            var redirectUri = "${redirectUri}";
		            location.href = redirectUri;
		        }
		    };
		</script>
    </body>
</html>
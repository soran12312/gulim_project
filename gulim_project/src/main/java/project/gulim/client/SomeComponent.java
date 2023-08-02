package project.gulim.client;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.service.MainService;

@Component
public class SomeComponent {

    @Autowired
    private Client client;
    
    @Autowired
   	private MainService mainService;
    
    @Autowired
    private HttpServletRequest request;

    public void someMethod() {
 
    	// 쿠키에서 JWT 토큰 값 가져오기
        Cookie[] cookies = request.getCookies();
        String jwtToken = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("access_token")) {
                    jwtToken = cookie.getValue();
                    break;
                }
            }
        }

        // JWT 토큰으로 로그인 중인 사용자 ID 가져오기
        Claims claims = mainService.getClaims(jwtToken);
        String id = claims.get("id", String.class);
    	
    	
        client.getRecommendations(id);
    }
}
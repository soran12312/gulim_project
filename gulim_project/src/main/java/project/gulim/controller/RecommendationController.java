package project.gulim.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.service.MainService;

@RestController
public class RecommendationController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private HttpServletRequest request;
	
	@PostMapping("/recommendations")
    public List<Map<String, Object>> getRecommendations(@RequestBody Map<String, String> param) {
		
		
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
		
		Claims claims = mainService.getClaims(jwtToken);
		
//			System.out.println(claims);
		String loggedInUserId = claims.get("id", String.class);  
		System.out.println(loggedInUserId);
		
		
        // 로그인한 사용자 ID를 Python 소켓 서버로 보내고 권장 사항 수신
        List<Map<String, Object>> recommendations = fetchRecommendationsFromPython(loggedInUserId);

        return recommendations;
    }

    private List<Map<String, Object>> fetchRecommendationsFromPython(String loggedInUserId) {
        // Python socket server address
        String host = "192.168.0.41";
        int port = 5555;

        // Python 소켓 서버와 통신할 RestTemplate 생성
        RestTemplate restTemplate = new RestTemplate();

        // 로그인한 사용자 ID를 Python 소켓 서버로 전송
        String url = "http://" + host + ":" + port;
        byte[] idBytes = loggedInUserId.getBytes(); // Convert ID to bytes
        List<Map<String, Object>> recommendations = restTemplate.postForObject(url, idBytes, List.class);
        
        System.out.println(recommendations);

        return recommendations;
    }

}
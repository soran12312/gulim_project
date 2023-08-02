package project.gulim.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.service.MainService;

// 추천데이터 받아올 클라이언트
@Component
public class Client {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private MainService mainService;

    public void getRecommendations() {
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

        // 추천 데이터를 가져올 서버 URL 설정
        String serverUrl = "http://192.168.0.41:5555/get_recommendations";

        // 서버와 통신을 위한 RestTemplate 객체 생성
        RestTemplate restTemplate = new RestTemplate();

        // 서버로 ID 값을 JSON 형태로 보내고, 추천 데이터를 받아옴
        String response = restTemplate.postForObject(serverUrl, id, String.class);

        // 서버로부터 받은 추천 데이터 (JSON 형태)를 원하는 방식으로 처리하여 사용
        // 예시) JSON 문자열을 자바 객체로 변환
        List<Recommendation> recommendations = parseJson(response);
    }

    // JSON 문자열을 자바 객체로 변환하는 메서드
    private List<Recommendation> parseJson(String jsonString) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            return objectMapper.readValue(jsonString, new TypeReference<List<Recommendation>>() {});
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 자바 객체 클래스 (추천 데이터를 담을 클래스, 필요에 따라 변경 가능)
    public static class Recommendation {
        private String book_title;
        private String character_role;

        // Getter, Setter, 생성자 등은 필요에 따라 구현
    }
}
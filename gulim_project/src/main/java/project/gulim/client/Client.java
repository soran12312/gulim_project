package project.gulim.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

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

    public void getRecommendations(String userId) {
    	
    	try {
    		
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

            
            // 서버 정보 설정
            String serverHost = "192.168.0.41";
            int serverPort = 5555;

            // 소켓 연결
            Socket socket = new Socket(serverHost, serverPort);

            // 아이디 전송
            OutputStream outputStream = socket.getOutputStream();
            outputStream.write(id.getBytes("UTF-8"));
            
            
            // 추가 데이터를 기록하거나 다른작업을 수행할 준비
            outputStream.flush();

            // 바이트 스트림과 문자 스트림간의 연결 담당
            BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            
            
            
            // 서버로 ID 값을 JSON 형태로 보내고, 추천 데이터를 받아옴
            String response = reader.readLine();

            // 서버로부터 받은 추천 데이터 (JSON 형태)를 원하는 방식으로 처리하여 사용
            // 예시) JSON 문자열을 자바 객체로 변환
            List<Recommendation> recommendations = parseJson(response);
            
            
            System.out.println(recommendations);

            // 연결 종료
            socket.close();
    		
    		
    		
    		
    	}
    	
    	 catch (IOException e) {
             e.printStackTrace();
         }

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
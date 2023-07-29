package project.gulim.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


// 추천데이터 받아올 클라이언트
public class Client {
	
	
	public List<Map<String, Object>> generate_recommendations(String logged_in_user_id) {
        List<Map<String, Object>> recommendations = new ArrayList<>();

        try {
        	
        	 // 서버 정보 설정
            String host = "localhost";
            int port = 8888;

        	
        	
            // 소켓 연결
            Socket socket = new Socket(host, port);

            // 현재 로그인 중인 id전송
            
            
            
            
    

            // 바이트 스트림과 문자 스트림 간의 연결 담당
            BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));

            // 서버에서 받은 추천 결과 파싱
            String line;
            while ((line = reader.readLine()) != null) {
                // 예시로 추천 데이터를 JSON 형태로 받아서 파싱하여 리스트에 추가하는 방식
            	Map<String, Object> recommendation = new HashMap<>();
                // 추천 데이터를 적절하게 파싱하여 recommendation 맵에 추가
                // 예: recommendation.put("book_title", "Recommended Book Title");
                // 예: recommendation.put("character_role", "Recommended Character Role");
                recommendations.add(recommendation);
            }

            // 연결 종료
            socket.close();

        } catch (IOException e) {
            e.printStackTrace();
        }

        return recommendations;
    }

}

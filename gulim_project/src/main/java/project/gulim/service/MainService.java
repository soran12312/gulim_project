package project.gulim.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import project.gulim.util.ConfigUtils;

@Service
public class MainService {
	
    private final RestTemplate restTemplate = new RestTemplate();
    @Autowired
    private ConfigUtils util;
    
    // 구글 로그인
	public String googleLogin(String code) {
        String accessToken = getAccessToken(code);
        //System.out.println("accessToken = " + accessToken);
        JsonNode userResourceNode = getUserResource(accessToken);
        
        String email = userResourceNode.get("email").asText();
        
        //System.out.println("email = " + email);
        
        return email;
	}
	
	// 구글 엑세스토큰 얻어오기
	private String getAccessToken(String authorizationCode) {
		// security.properties에서 각 값 가져온다.
        String clientId = util.getGoogleClientId();
        String clientSecret = util.getGoogleSecret();
        String redirectUri = util.getGoogleRedirectUri();
        String tokenUri = util.getGoogleTokenUrl();
        
        // uri에 담을 params setting
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("code", authorizationCode);
        params.add("client_id", clientId);
        params.add("client_secret", clientSecret);
        params.add("redirect_uri", redirectUri);
        params.add("grant_type", "authorization_code");

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        HttpEntity entity = new HttpEntity(params, headers);

        ResponseEntity<JsonNode> responseNode = restTemplate.exchange(tokenUri, HttpMethod.POST, entity, JsonNode.class);
        JsonNode accessTokenNode = responseNode.getBody();
        return accessTokenNode.get("access_token").asText();
    }
	
	// 구글 엑세스토큰으로 유저정보(이메일) 얻어오기
	private JsonNode getUserResource(String accessToken) {
        String resourceUri = util.getGoogleResourceUrl();

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);
        HttpEntity entity = new HttpEntity(headers);
        return restTemplate.exchange(resourceUri, HttpMethod.GET, entity, JsonNode.class).getBody();
    }
	
	// 카카오 로그인
	public String kakaoLogin(String code) {
		String accessToken = getKakaoToken(code);
        String email = getUserInfo(accessToken);
        //System.out.println(email);
		
		return email;
	}
	
	// 카카오 엑세스토큰 가져오기
	private String getKakaoToken(String authorize_code) {
		String access_token = "";
		String reqURL = util.getKakaoTokenUrl();
		try {
			URL url = new URL(reqURL);
	
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
	
			sb.append("&client_id="+util.getKakaoClientId()); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri="+util.getKakaoRedirectUri()); // REDIRECT_URI 본인이 설정한 주소 넣어주기
	
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
	
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			//System.out.println("responseCode : " + responseCode);
	
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
	
			while ((line = br.readLine()) != null) {
				result += line;
			}
			//System.out.println("response body : " + result);
	
			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
	
			access_token = jsonMap.get("access_token").toString();
			
			//System.out.println("access_token : " + access_token);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return access_token;
	}
	
	// 카카오 엑세스토큰으로 유저정보(이메일) 얻어오기
	private String getUserInfo(String access_token) {
		String reqURL = util.getKakaoResourceUrl();
		String email = "";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_token);

			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			try {
				// jackson objectmapper 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});

				Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

				// System.out.println(properties.get("nickname"));
				// System.out.println(kakao_account.get("email"));

				email = kakao_account.get("email").toString();

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return email;
	}
}

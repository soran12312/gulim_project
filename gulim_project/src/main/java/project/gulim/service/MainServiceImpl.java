package project.gulim.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletResponse;
import project.gulim.config.ConfigUtils;
import project.gulim.dao.MainDAO;
import project.gulim.domain.JwtDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.SurveyDTO;

@Service
public class MainServiceImpl implements MainService{
	
    private final RestTemplate restTemplate = new RestTemplate();
    
    @Autowired
    private ConfigUtils util;
    
    @Autowired
    private JavaMailSender javaMailSender;
    
    @Autowired
    private MainDAO mainDAO;
    
    private Integer authNumber;
    
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
	
	private void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	
	
	//이메일 보낼 양식 -> 컨트롤러에서 호출되는 함수
	public Integer mailCheck(String email) {
		makeRandomNumber();
		String setFrom = util.getUsername(); // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return authNumber;
	}
	
	//이메일 전송 메소드
	private void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true);
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			javaMailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// id 중복검사
	@Override
	public Boolean idCheck(String id) {
		String check;
		
		check = mainDAO.idCheck(id);
		
		if(check == null)return true;
		else return false;
	}

	@Override
	public String sLoginCheck(MemberDTO member) {
		String id;
		
		id = mainDAO.sLoginCheck(member);
		
		if(id == null)return "";
		else return id;
	}

	@Override
	public void regist(MemberDTO member) {
		
		String pw = BCrypt.hashpw(member.getPassword(), BCrypt.gensalt());
		member.setPassword(pw);
		
		mainDAO.regist(member);
	}

	// 로그인 시 비밀번호가 db값과 같은지 확인
	@Override
	public String loginCheck(MemberDTO member) {
		
		String password = mainDAO.loginCheck(member);
		
		if(BCrypt.checkpw(member.getPassword(), password)) return member.getId();
		else return "";
	}

	// memberDTO로 jwt 토큰 생성
	public String createToken(MemberDTO member, Date expireDate) {
		
		byte[] secret = util.getJwt_secret().getBytes();
	    Key key = Keys.hmacShaKeyFor(secret);
		
		return Jwts.builder()
                .claim("id", member.getId())
                .claim("name", member.getName())
                .claim("address", member.getAddress())
                .claim("tel", member.getTel())
                .claim("email", member.getEmail())
                .claim("nickname", member.getNickname())
                .claim("birthday", member.getBirthday())
                .claim("introduce", member.getIntroduce())
                .claim("regist_type", member.getRegist_type())
                .claim("dist_search", member.getDist_search())
                .claim("name_search", member.getName_search())
                .claim("manager", member.getManager())
                .claim("member_state", member.getMember_state())
                .setExpiration(expireDate)
                .signWith(key)
                .compact();
	}

	// 토큰으로 유저정보 확인
	@Override
	public Claims getClaims(String token) {
		
		byte[] secret = util.getJwt_secret().getBytes();
		Key key = Keys.hmacShaKeyFor(secret);
			
		return Jwts.parserBuilder()
	               .setSigningKey(key)
	               .build()
	               .parseClaimsJws(token)
	               .getBody();
		
	}
	
	// jwt 생성
	@Override
	public JwtDTO createJwt(MemberDTO member) {
		Date access_token_valid = getExpireDateAccessToken();
		Date refresh_token_valid = getExpireDateRefreshToken();
		MemberDTO ref_tk_value = new MemberDTO();
		ref_tk_value.setId(member.getId());
        String accessToken = createToken(member, access_token_valid);
        String refreshToken = createToken(ref_tk_value, refresh_token_valid);
        
        JwtDTO jwt = new JwtDTO();
        jwt.setAccess_token(accessToken);
        jwt.setRefresh_token(refreshToken);
        jwt.setAccess_token_valid(access_token_valid);
        jwt.setRefresh_token_valid(refresh_token_valid);
        jwt.setId(member.getId());
        
        mainDAO.insertJWT(jwt);
        
        return jwt;
    }

	// 엑세스토큰 유효기한 설정
	public Date getExpireDateAccessToken() {
	    long expireTimeMils = 1000 * 60 * 60;
	    return new Date(System.currentTimeMillis() + expireTimeMils);
	 }
	
	// 리프레쉬토큰 유효기한 설정
	public Date getExpireDateRefreshToken() {
	    long expireTimeMils = 1000L * 60 * 60 * 24 * 60;
	    return new Date(System.currentTimeMillis() + expireTimeMils);
	}

	@Override
	public MemberDTO selectById(MemberDTO member) {
		
		return mainDAO.selectById(member);
	}

	@Override
	public void serveyInsert(SurveyDTO servey) {
		mainDAO.serveyInsert(servey);
		
	}

	@Override
	public String selectRefreshByAccess(String access_token) {
		
		return mainDAO.selectRefreshByAccess(access_token);
	}

	@Override
	public JwtDTO selectExpiration(String refresh_token) {
		
		return mainDAO.selectExpiration(refresh_token);
	}

	@Override
	public void setJwtStateDiscard(String access_token) {
		mainDAO.setJwtStateDiscard(access_token);
		
	}

	@Override
	public void insertJWT(JwtDTO jwt) {
		mainDAO.insertJWT(jwt);
		
	}
	
}

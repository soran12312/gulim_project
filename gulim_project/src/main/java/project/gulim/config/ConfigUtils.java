package project.gulim.config;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@PropertySource({ "classpath:security.properties" })
public class ConfigUtils {
	// 각 값들은 security.properties에서 가져옴
	@Value("${google.auth.url}")
	private String googleAuthUrl;

	@Value("${google.login.url}")
	private String googleLoginUrl;

	@Value("${google.redirect.uri}")
	private String googleRedirectUrl;

	@Value("${google.client.id}")
	private String googleClientId;

	@Value("${google.secret}")
	private String googleSecret;

	@Value("${google.auth.scope}")
	private String scopes;

	// Google 로그인 URL 생성 로직
	public String googleInitUrl() {
		Map<String, Object> params = new HashMap<>();
		params.put("client_id", getGoogleClientId());
		params.put("redirect_uri", getGoogleRedirectUri());
		params.put("response_type", "code");
		params.put("scope", getScopeUrl());

		String paramStr = params.entrySet().stream().map(param -> param.getKey() + "=" + param.getValue())
				.collect(Collectors.joining("&"));

		return getGoogleLoginUrl() + "/o/oauth2/v2/auth" + "?" + paramStr;
	}

	public String getGoogleTokenUrl() {
		return googleAuthUrl + "/token";
	}

	public String getGoogleResourceUrl() {
		return "https://www.googleapis.com/oauth2/v2/userinfo";
	}

	public String getGoogleAuthUrl() {
		return googleAuthUrl;
	}

	public String getGoogleLoginUrl() {
		return googleLoginUrl;
	}

	public String getGoogleClientId() {
		return googleClientId;
	}

	public String getGoogleRedirectUri() {
		return googleRedirectUrl;
	}

	public String getGoogleSecret() {
		return googleSecret;
	}

	public String getScopeUrl() {

		return scopes;
	}

	@Value("${kakao.login.uri}")
	private String kakaoLoginUri;

	@Value("${kakao.client.id}")
	private String kakaoClientId;

	@Value("${kakao.redirect.uri}")
	private String kakaoRedirectUri;

	@Value("${kakao.resource.url}")
	private String kakaoResourceUrl;

	@Value("${kakao.token.url}")
	private String kakaoTokenUrl;

	public String getKakaoLoginUri() {
		return kakaoLoginUri;
	}

	public String getKakaoClientId() {
		return kakaoClientId;
	}

	public String getKakaoRedirectUri() {
		return kakaoRedirectUri;
	}

	public String getKakaoResourceUrl() {
		return kakaoResourceUrl;
	}

	public String getKakaoTokenUrl() {
		return kakaoTokenUrl;
	}

	// Kakao 로그인 URL 생성 로직
	public String kakaoInitUrl() {
		Map<String, Object> params = new HashMap<>();
		params.put("client_id", getKakaoClientId());
		params.put("redirect_uri", getKakaoRedirectUri());
		params.put("response_type", "code");

		String paramStr = params.entrySet().stream().map(param -> param.getKey() + "=" + param.getValue())
				.collect(Collectors.joining("&"));

		return getKakaoLoginUri() + "?" + paramStr;
	}

	@Value("${spring.mail.username}")
	private String username;
	@Value("${spring.mail.password}")
	private String password;
	@Value("${spring.mail.host}")
	private String host;
	@Value("${spring.mail.port}")
	private int port;

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getHost() {
		return host;
	}

	public int getPort() {
		return port;
	}

	@Value("${jwt.secret.key}")
	private String jwt_secret;

	public String getJwt_secret() {
		return jwt_secret;
	}

}

package project.gulim.domain;

import lombok.Data;

@Data
public class JwtDTO {
	
	private String access_token;
	private String refresh_token;
	private String access_token_valid; // 유효기한(날짜)
	private String refresh_token_valid;
	private Integer jwt_state; // 폐기여부(0-폐기되지않음 / 1-비정상접근으로 인한 폐기상태)
	private String id;
}

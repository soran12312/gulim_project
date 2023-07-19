package project.gulim.service;

import java.util.Date;
import java.util.Map;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletResponse;
import project.gulim.domain.JwtDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.SurveyDTO;

public interface MainService {

	public String googleLogin(String code);

	public String kakaoLogin(String code);

	public Integer mailCheck(String email);

	public Boolean idCheck(String id);

	public String sLoginCheck(MemberDTO member);

	public String loginCheck(MemberDTO member);

	public void regist(MemberDTO member);

	public Claims getClaims(String token);

	public JwtDTO createJwt(MemberDTO member);

	public MemberDTO selectById(MemberDTO member);

	public void serveyInsert(SurveyDTO servey);
	
	public String createToken(MemberDTO member, Date expireDate);
	
	public Date getExpireDateAccessToken();
	
	public String selectRefreshByAccess(String access_token);

}

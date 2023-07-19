package project.gulim.controller;

import java.security.Key;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import project.gulim.config.ConfigUtils;
import project.gulim.domain.MemberDTO;
import project.gulim.exception.WrongContectException;
import project.gulim.service.MainService;

@Controller
public class ExceptionController {
	
	@Autowired
	private HttpServletRequest req;
	
	@Autowired
	private HttpServletResponse res;
	
	@Autowired
    private ConfigUtils util;
	
	@Autowired
	private MainService mainService;
	
	
	@ExceptionHandler(WrongContectException.class)
	public String handleWrongContectException(WrongContectException ex) {
		
		return "redirect:/error_page/wrong_contect";
	}
	
	@ExceptionHandler(ExpiredJwtException.class)
	public String handleExpiredJwtException(ExpiredJwtException ex) {
		
		String access_token = null;
		String refresh_token = null;
		
		Cookie[] cookies = req.getCookies();
		
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if (cookie.getName().equals("access_token")) {
					access_token = cookie.getValue();
                }else if(cookie.getName().equals("refresh_token")) {
                	refresh_token = cookie.getValue();
                }
			}
		}
		// 리프레쉬토큰이 유효한지 확인
		if(isTokenValid(refresh_token)) {
			// 엑세스토큰으로 db에 매칭되어있는 리프레쉬토큰을 찾아서 사용자에게 받아온 리프레쉬토큰과 비교
			if(refresh_token != mainService.selectRefreshByAccess(access_token)) {
				return "redirect:/error_page/wrong_contect";
			}
			// 리프레쉬토큰에서 사용자id 받아옴
			Claims claims = mainService.getClaims(refresh_token);
			String id = claims.get("id", String.class);
			MemberDTO member = new MemberDTO();
			member.setId(id);
			// 사용자id로 사용자정보 받아옴
			member = mainService.selectById(member);
			// 엑세스토큰 재발급
			Date access_token_valid = mainService.getExpireDateAccessToken();
			String accessToken = mainService.createToken(member, access_token_valid);
			
			// *************** 할일: 리프레쉬토큰 유효기한 얻어와서 쿠키에 엑세스토큰 넣기 + 이후 처리
		}
		
		return "redirect:/error_page/wrong_contect";
	}
	
	public boolean isTokenValid(String token) {
        try {
        	
        	byte[] secret = util.getJwt_secret().getBytes();
    		Key key = Keys.hmacShaKeyFor(secret);
    		
            Claims claims = Jwts.parserBuilder()
 	               .setSigningKey(key)
 	               .build()
 	               .parseClaimsJws(token)
 	               .getBody();
            
            // 토큰의 Claims 정보에서 유효기한 확인
            Date expirationDate = claims.getExpiration();
            Date now = new Date();
            if (now.before(expirationDate)) {
                // 토큰이 유효한 경우
                return true;
            } else {
                // 토큰이 만료된 경우
                return false;
            }
        } catch (ExpiredJwtException ex) {
            // 토큰이 만료된 경우
            return false;
        } catch (Exception ex) {
            // 토큰 파싱 오류 등의 예외 발생 시
            return false;
        }
    }
}

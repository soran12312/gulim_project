package project.gulim.controller;

import java.security.Key;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import project.gulim.config.ConfigUtils;
import project.gulim.domain.JwtDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.SurveyDTO;
import project.gulim.service.MainService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	private ConfigUtils util;
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) { // 페이지 이동(DB접속없는경우)
		return "main/"+step;
	}
	
	// 구글 로그인
	@RequestMapping(value = "/google_login", method = RequestMethod.GET)
	public String googleLogin(@RequestParam@PathVariable String code, Model m) {
		String email = mainService.googleLogin(code);
		MemberDTO member = new MemberDTO();
		member.setEmail(email);
		member.setRegist_type("google");
		String id = mainService.sLoginCheck(member);
		
		if(id != "") {
			m.addAttribute("id", id);
			return "/main/main";
		}else {
			m.addAttribute("member", member);
			return "/main/regist_form";
		}
	}
	
	// 카카오 로그인
	@RequestMapping(value = "/kakao_login", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam@PathVariable String code, Model m) {
		String email = mainService.kakaoLogin(code);
		String regist_type = "kakao";
		
		MemberDTO member = new MemberDTO();
		member.setEmail(email);
		member.setRegist_type(regist_type);
		System.out.println(member);
		String id = mainService.sLoginCheck(member);
		
		if(id != "") {
			m.addAttribute("id", id);
			return "/main/main";
		}else {
			m.addAttribute("member", member);
			return "/main/regist_form";
		}
	}
	
	// 구글 로그인 uri 생성해서 가져가기
	@RequestMapping("/getGoogleLoginUri")
	@ResponseBody
	public String getGoogleLoginUri() {
		
		return util.googleInitUrl();
	}
	
	// 카카오 로그인 uri 생성해서 가져가기
	@RequestMapping("/getKakaoLoginUri")
	@ResponseBody
	public String getKakaoLoginUri() {
		
		return util.kakaoInitUrl();
	}
	
	// 이메일 인증페이지 이동
	@RequestMapping("/email_confirm")
	public String email_confirm(MemberDTO member, Model m) {
		
		if(member.getRegist_type()=="") { // 구글, 카카오 회원가입이 아닌 경우 이메일 인증화면으로 이동
			member.setRegist_type("common");
			
			m.addAttribute("member", member);
			
			return "/main/email_confirm";
		}else {								// 구글, 카카오 회원가입인 경우 이메일인증 없이 바로 회원가입 method 호출
			mainService.regist(member);
			m.addAttribute("id", member.getId());
			return "/main/servey";
		}
	}
	
	// 일반 로그인 확인
	@RequestMapping("/loginCheck")
	@ResponseBody
	public String loginCheck(MemberDTO member) {
		String id = mainService.loginCheck(member);
		
		return id;
	}
	
	// 로그인 jwt토큰 생성
	@RequestMapping("/login")
	public String login(MemberDTO id, HttpServletResponse res) {
		MemberDTO member = mainService.selectById(id);
		
		JwtDTO jwt = mainService.createJwt(member);
		long refresh_token_valid = jwt.getRefresh_token_valid().getTime() - System.currentTimeMillis(); // 만료 날짜와 현재 시간의 차이를 계산
		
		Cookie cookie1 = new Cookie("access_token", jwt.getAccess_token());
		
		cookie1.setHttpOnly(true); // 보안설정 -> JavaScript코드로 쿠키에 접근 불가
        cookie1.setMaxAge((int) (refresh_token_valid / 1000)); // 쿠키 유효기간은 초 단위로 설정 -> 엑세스토큰 유효기한 1시간 // 쿠키에 남아있는 기한 리프레쉬토큰과 같게
        cookie1.setPath("/"); // 쿠키의 범위를 전체 애플리케이션으로 설정 (루트 패스 이하 모든 경로에서 쿠키 접근 가능)
        res.addCookie(cookie1);
        
        Cookie cookie2 = new Cookie("refresh_token", jwt.getRefresh_token());
		
		cookie2.setHttpOnly(true);
		cookie2.setMaxAge((int) ((refresh_token_valid) / 1000)); // 쿠키 유효기간은 초 단위로 설정 -> 리프레쉬토큰 유효기한 60일
		cookie2.setPath("/"); // 쿠키의 범위를 전체 애플리케이션으로 설정 (루트 패스 이하 모든 경로에서 쿠키 접근 가능)
        res.addCookie(cookie2);
		
		return "/main/login_main";
	}
	
	// 회원가입
	@RequestMapping("/regist")
	public String regist(MemberDTO member, Model m) {
		mainService.regist(member);
		
		m.addAttribute("id", member.getId());
		return "/main/servey";
	}
	
	// 이메일 인증
	@RequestMapping("/mailCheck")
	@ResponseBody
	public Integer mailCheck(String email) {
		
		//System.out.println(email);
		Integer authNumber = mainService.mailCheck(email);
		
		return authNumber;
	}
	
	//아이디 중복확인
	@RequestMapping("/idCheck")
	@ResponseBody
	public Boolean idCheck(String id) {
		
		return mainService.idCheck(id);
	}
	
	// 설문조사 db에 입력
	@RequestMapping("/servey_insert")
	public String serveyInsert(SurveyDTO servey) {
		
		mainService.serveyInsert(servey);
		
		return "/main/login_main";
	}
}

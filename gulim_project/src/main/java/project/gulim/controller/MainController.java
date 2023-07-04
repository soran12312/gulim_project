package project.gulim.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.gulim.config.ConfigUtils;
import project.gulim.domain.MemberDTO;
import project.gulim.service.MainService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Value("${google.client.id}")
	private String google_client_id;
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private ConfigUtils util;
	
	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) { // 페이지 이동(DB접속없는경우)
		return "main/"+step;
	}
	
	@RequestMapping("/main")
	public String mainPage(Model m) {
		m.addAttribute("g_client_id", google_client_id);
		
		return "main/main";
	}
	
	// 구글 로그인
	@RequestMapping(value = "/google_login", method = RequestMethod.GET)
	public String googleLogin(@RequestParam@PathVariable String code, Model m) {
		String email = mainService.googleLogin(code);
		MemberDTO member = new MemberDTO();
		member.setEmail(email);
		member.setRegist_type("google");
		
		if(mainService.loginCheck(member)) {
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
		
		if(mainService.loginCheck(member)) {
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
			
			return "/main/main";
		}
	}
	
	// 회원가입
	@RequestMapping("/regist")
	public String regist(MemberDTO member) {
		mainService.regist(member);
		
		return "/main/main";
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
	
}

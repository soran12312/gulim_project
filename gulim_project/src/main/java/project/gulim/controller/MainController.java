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

import project.gulim.domain.MemberDTO;
import project.gulim.service.MainService;
import project.gulim.util.ConfigUtils;

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
		return "/main/"+step;
	}
	
	@RequestMapping("/main")
	public String mainPage(Model m) {
		m.addAttribute("g_client_id", google_client_id);
		
		return "/main/main";
	}
	
	@RequestMapping(value = "/google_login", method = RequestMethod.GET)
	public String googleLogin(@RequestParam@PathVariable String code) {
		String email = mainService.googleLogin(code);
		MemberDTO member = new MemberDTO();
		member.setEmail(email);
		member.setRegist_type("google");
		
		return "";
	}
	
	@RequestMapping(value = "/kakao_login", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam@PathVariable String code) {
		String email = mainService.kakaoLogin(code);
		
		return "";
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
	
}

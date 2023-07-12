package project.gulim.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.gulim.domain.MemberDTO;
import project.gulim.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageContoroller {
	
	@Autowired
	MypageService mypageService;

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) { // 페이지 이동(DB접속없는경우)
		return "/mypage/"+step;
	}
	@RequestMapping("/game/my_game_list")
	public String viewPage2() { // 페이지 이동(DB접속없는경우)
		return "/mypage/game/my_game_list";
	}
	@RequestMapping("/user_info/info_modify")
	public String viewPage3() { // 페이지 이동(DB접속없는경우)
		return "/mypage/user_info/info_modify";
	}
	

	@RequestMapping("/my_message")
	public String my_message() {
		
		return "/mypage/my_message";
	}
	
	//마이페이지/회원정보 접속 시 패스워드 체크 
	@RequestMapping("/user_info/mypage_password_check")
	@ResponseBody
	public Boolean mypage_password_check(MemberDTO member) { // 페이지 이동(DB접속없는경우)
		Boolean result = mypageService.mypage_password_check(member);

		return result;
	}
	
	@RequestMapping("/user_info/find_info")
	@ResponseBody
	public Map find_info(MemberDTO member) { // 페이지 이동(DB접속없는경우)
		Map result = new HashMap();
		
		Map vo = mypageService.find_info(member);
		result.putAll(vo);
		
		return result;
	}
	
	@RequestMapping("/user_info/modify_info")
	@ResponseBody
	public void modify_info(MemberDTO member) {
		mypageService.modify_info(member);
	}
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

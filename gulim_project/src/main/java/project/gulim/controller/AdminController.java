package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/member_management")
	public String viewPage() { // 페이지 이동(DB접속없는경우)
		return "/admin/member/member_management";
	}

}

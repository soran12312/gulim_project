package project.gulim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.gulim.domain.MemberDTO;
import project.gulim.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/question")
	public String viewPage_question() { // 페이지 이동(DB접속없는경우)
		return "/admin/member/question";
	}
	
	@RequestMapping("/list_question")
	// Model 객체: 데이터를 뷰(view, 웹 페이지 화면/UI 등을 모두 칭하는 것)로 전달하기 위한 것
	public void qnalist(Model m) {
		// List: 순서가 있는 데이터의 집합
		// List 객체 내에서도 QnaVO 타입의 객체들만 담는 List임
		// 그 List 객체 안에 qnaService내의 listQna 메소드를 담음
		List<MemberDTO> result = adminService.listQuestion();
		// result를 list라는 이름으로 모델에 추가함 => list라는 이름으로 데이터를 뷰에 전달
		m.addAttribute("list_question", result);
	}
	
	@RequestMapping("/member_management")
	public String viewPage_member_management() { // 페이지 이동(DB접속없는경우)
		return "/admin/member/member_management";
	}
	
	

}

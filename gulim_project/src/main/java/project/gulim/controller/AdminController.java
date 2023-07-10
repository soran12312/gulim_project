package project.gulim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.gulim.domain.QuestionDTO;
import project.gulim.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/question")
	public String viewPage_question(Model m) {
	    List<QuestionDTO> listQuestion = adminService.listQuestion();
	    m.addAttribute("listQuestion", listQuestion);
	    return "/admin/member/question";
	}
	
	@ResponseBody
	@RequestMapping(value = "/question", method=RequestMethod.POST)
	public void answerQuestion(@RequestBody QuestionDTO qDTO) {
		System.out.println(qDTO);
		adminService.answerQuestion(qDTO);
	}
	
	
	@RequestMapping("/member_management")
	public String viewPage_member_management() { // 페이지 이동(DB접속없는경우)
		return "/admin/member/member_management";
	}
	
	@RequestMapping("/place_list")
	public String viewPage_place_list() {
		return "/admin/place/place_list";
	}
	
	@RequestMapping("/sales_stats")
	public String viewPage_sales_stats() {
		return "/admin/sales/sales_stats";
	}
	
	@RequestMapping("/delivery_refund")
	public String viewPage_delivery_refund() {
		return "/admin/sales/delivery_refund";
	}
	
	@RequestMapping("/view_list")
	public String viewPage_view_list() {
		return "/admin/event_announce_contest/view_list";
	}
	
	@RequestMapping("/insert_form")
	public String viewPage_insert_form() {
		return "/admin/event_announce_contest/insert_form";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String save() {
		return "";
	}
	
	@RequestMapping("/product_list")
	public String viewPage_product_list() {
		return "/admin/product/product_list";
	}
	
	@RequestMapping("/product_insert")
	public String viewPage_product_insert() {
		return "/admin/product/product_insert";
	}
	
	@RequestMapping("/product_modify")
	public String viewPage_product_modify() {
		return "/admin/product/product_modify";
	}
	
	@RequestMapping("/game_stats")
	public String viewPage_game_stats() {
		return "/admin/game_stats/game_stats";
	}

}

package project.gulim.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.gulim.domain.BasketDTO;
import project.gulim.domain.ContestDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.PlaceDTO;
import project.gulim.domain.PostDTO;
import project.gulim.domain.QuestionDTO;
import project.gulim.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 문의사항 리스트 보기
	@RequestMapping("/question")
	public String viewPage_question(Model m) {
	    List<QuestionDTO> listQuestion = adminService.listQuestion();
	    m.addAttribute("listQuestion", listQuestion);
	    return "/admin/member/question";
	}
	
	// 문의사항 답변하기
	@ResponseBody
	@RequestMapping(value = "/question", method=RequestMethod.POST)
	public void answerQuestion(@RequestBody QuestionDTO qDTO) {
		System.out.println(qDTO);
		adminService.answerQuestion(qDTO);
	}
	
	// 제재 리스트 보기
	@RequestMapping("/member_management")
	public String viewPage_member_management(Model m) { // 페이지 이동(DB접속없는경우)
		List<MemberDTO> listMember = adminService.listMember();
		m.addAttribute("listMember", listMember);
		return "/admin/member/member_management";
	}
	
	// 제재 상태 변경
	@ResponseBody
	@RequestMapping(value = "/member_management", method=RequestMethod.POST)
	public void changeMemberState(@RequestBody MemberDTO mDTO) {
		System.out.println(mDTO);
		adminService.changeMemberState(mDTO);
	}
	
	// 모임장소 리스트 보기
	@RequestMapping("/place_list")
	public String viewPage_place_list(Model m) {
		List<PlaceDTO> listPlace = adminService.listPlace();
		m.addAttribute("listPlace", listPlace);
		return "/admin/place/place_list";
	}
	
	@RequestMapping("/sales_stats")
	public String viewPage_sales_stats() {
		return "/admin/sales/sales_stats";
	}
	
	@RequestMapping("/delivery_refund")
    public String viewPageDeliveryRefund(Model m) {
        
		List<HashMap> listRefund = adminService.listRefund();
		m.addAttribute("listRefund", listRefund);
		
        return "/admin/sales/delivery_refund";
    }
	
	@ResponseBody
	@RequestMapping(value = "/delivery_refund", method=RequestMethod.POST)
	public void changeDeliveryState(@RequestBody BasketDTO bDTO) {
		adminService.changeDeliveryState(bDTO);
	}
	
	@RequestMapping("/view_list")
	public String viewPage_view_list(Model m) {
		
		List<HashMap> listPost = adminService.listPost();
		m.addAttribute("listPost", listPost);
		
		return "/admin/event_announce_contest/view_list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/view_list", method=RequestMethod.POST)
	public void changePostState(@RequestBody PostDTO pDTO) {
		adminService.changePostState(pDTO);
	}
	
	@RequestMapping("/insert_form")
	public String viewPage_insert_form() {
		return "/admin/event_announce_contest/insert_form";
	}
	
	
	@RequestMapping(value="/insert_form", method=RequestMethod.POST)
	public String save() {
		return "";
	}
	
	@RequestMapping("/product_list")
	public String viewPage_product_list(Model m) {
		List<HashMap> listProduct = adminService.listProduct();
		m.addAttribute("listProduct", listProduct);
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

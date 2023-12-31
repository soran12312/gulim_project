package project.gulim.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.constant.Method;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.QuestionDTO;
import project.gulim.service.Customer_service;
import project.gulim.service.MainService;
@CrossOrigin(origins = "*", allowedHeaders = "*")
@Controller
@RequestMapping("/customer_service")
public class Customer_serviceController {

	@Autowired
	private Customer_service customer_service;
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request,Model m,MemberDTO member) {
		
		//쿠키 배열에 요청 받은 쿠키 담음
				Cookie[] cookies = request.getCookies();
			    String jwtToken = null;
			    
			    // 쿠키가 null이 아니라면
			    if (cookies != null) {
			    	// 반복문 구동
		            for (Cookie cookie : cookies) {
		            	//쿠키 이름이 access_token이랑 같으면
		                if (cookie.getName().equals("access_token")) {
		                	//토큰에 쿠키의 값 넣음
		                    jwtToken = cookie.getValue();
		                    break;
		                }
		            }
		        }
	    
	    // jwtToken을 사용하여 클레임 정보를 가져옵니다.	    
	    Claims claims = mainService.getClaims(jwtToken);
	    // 클레임 정보에서 "id" 값을 가져와서 String 타입으로 변환합니다.
	    String id = claims.get("id", String.class);
	    // 가져온 id 값을 member 객체에 설정합니다.
	    member.setId(id);
	    m.addAttribute("member", member);

	return "/customer_service/main";
	}
	
	@RequestMapping("/question")
	public String question(QuestionDTO questionDTO,HttpServletRequest request,Model m) {
		
		//쿠키 배열에 요청 받은 쿠키 담음
				Cookie[] cookies = request.getCookies();
			    String jwtToken = null;
			    
			    // 쿠키가 null이 아니라면
			    if (cookies != null) {
			    	// 반복문 구동
		            for (Cookie cookie : cookies) {
		            	//쿠키 이름이 access_token이랑 같으면
		                if (cookie.getName().equals("access_token")) {
		                	//토큰에 쿠키의 값 넣음
		                    jwtToken = cookie.getValue();
		                    break;
		                }
		            }
		        }
	    
	    Claims claims = mainService.getClaims(jwtToken);
	    String id = claims.get("id", String.class);
	    questionDTO.setId(id);
	    m.addAttribute("questionDTO", questionDTO);
			
		return "/customer_service/detail_question_form";
	}
	
	//문의 사항 보내기 버튼을 누르면 발생함
	@RequestMapping(value = "/send_question",method = RequestMethod.POST)
	public String send_question(QuestionDTO questionDTO,HttpServletRequest request) {
		
		//쿠키 배열에 요청 받은 쿠키 담음
		Cookie[] cookies = request.getCookies();
	    String jwtToken = null;
	    
	    // 쿠키가 null이 아니라면
	    if (cookies != null) {
	    	// 반복문 구동
            for (Cookie cookie : cookies) {
            	//쿠키 이름이 access_token이랑 같으면
                if (cookie.getName().equals("access_token")) {
                	//토큰에 쿠키의 값 넣음
                    jwtToken = cookie.getValue();
                    break;
                }
            }
        }
	    
	    Claims claims = mainService.getClaims(jwtToken);
	    String id = claims.get("id", String.class);
	    
	    //questionDTO에 id 붙힘
	    questionDTO.setId(id);
		customer_service.send_question(questionDTO);
		return "redirect:/mypage/my_question";
	}
	
	@RequestMapping("/customer_chat")
	@ResponseBody
	public Integer chating(@RequestParam String id){
		Integer manager = customer_service.isManager(id);
		
		return manager;
	}
}

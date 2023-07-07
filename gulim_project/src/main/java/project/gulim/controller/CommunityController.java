package project.gulim.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.PostDTO;
import project.gulim.service.CommunityService;
import project.gulim.service.MainService;

@Controller
@RequiredArgsConstructor
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private MainService mainService;
	
	// 자유게시판 입력페이지
	@RequestMapping(value = "/free")
	public String free(PostDTO params) {
	    
		return "community/free_board/free_board_insert";		
	}
	
	
	
	// 자유게시판 글 입력
	@RequestMapping(value = "/freeinsert", method = RequestMethod.POST)
	public String insert(PostDTO params, ImageDTO image ,Model m) { // 리뷰등록(트랜잭션) 
		
		Cookie[] cookies = request.getCookies();
		String jwtToken = null;

		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		        if (cookie.getName().equals("access_token")) {
		            jwtToken = cookie.getValue();
		            break;
		        }
		    }
		}
		
		Claims claims = mainService.getClaims(jwtToken);
		
//		System.out.println(claims);
		String id = claims.get("id", String.class);      // 로그인한 사용자 id
		params.setId(id);                                // 
		
		
		System.out.println(params); 
		
		// db저장
	    communityService.savePost(params);  
	    
	    return "redirect:/freelist";
	    
	}
	

	// 자유게시판 글 목록
	@RequestMapping("/freelist")
	public String list(Model model) {
		
		List<PostDTO> posts = communityService.findAllPost();
        model.addAttribute("posts", posts);
		
		return "community/free_board/free_board_list";
	}
	
	
	// 자유게시판 글 상세
	@RequestMapping("/freedetail")
	public String openPostView(@RequestParam("post_num") Integer post_num, Model model) {
		PostDTO post = communityService.findPostById(post_num);
        model.addAttribute("post", post);
	     
        Cookie[] cookies = request.getCookies();
		String jwtToken = null;

		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		        if (cookie.getName().equals("access_token")) {
		            jwtToken = cookie.getValue();
		            break;
		        }
		    }
		}
		
		Claims claims = mainService.getClaims(jwtToken);
		
//		System.out.println(claims);
		String loggedInUserId = claims.get("id", String.class);
		model.addAttribute("loggedInUserId", loggedInUserId);
		
		return "community/free_board/free_board_detail";
	}
	
	
	// 자유게시판 글 수정
	@RequestMapping(value = "/freeupdate", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("post") PostDTO params) {
		communityService.updatePost(params);
	     
		
		 return "redirect:/freelist";
	}
	
	
	// 자유게시판 글 삭제
	@RequestMapping(value = "/freedelete", method = RequestMethod.POST)
	public String deletePost(@RequestParam("post_num") Integer post_num) {
		communityService.deletePost(post_num);
	     
		
		 return "redirect:/freelist";
	}
	
	
	// 이미지 업로드
	
	

	// 이벤트 글 목록
	@RequestMapping("/event")
	public String eventist() {
		return "community/event/event_list";
	}

	// 이벤트 글 상세

	// 공모전
	@RequestMapping("/contest")
	public String contest() {
		return "community/contest/contest_main";
	}
}

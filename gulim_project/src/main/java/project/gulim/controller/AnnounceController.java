package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AnnounceController {
	
	// 공지사항
	@GetMapping("/announce")
	public String Announce()
	{
		return "community/announce/announce_list";
		
	}
	
	
	//공모전게시판
	
	
	
	
	// 이벤트 게시판
	
	
	
	
	
	
	
	// 자유게시판
	
	
	
	

}

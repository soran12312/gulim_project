package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {

	// 자유게시판 작성
	@RequestMapping("/freeinsert")
	public String insert()
	{
		return "community/free_board/free_board_insert";
	}
	
	
	// 자유게시판 글 목록
	@RequestMapping("/freelist")
	public String list()
	{
		return "community/free_board/free_board_list";
	}
	
	
	// 이벤트 글 목록
	@RequestMapping("/event")
	public String eventist()
	{
		return "community/event/event_list";
	}
	
	// 이벤트 글 상세
	
	
	// 공모전
	@RequestMapping("/contest")
	public String contest()
	{
		return "community/contest/contest_main";
	}
}

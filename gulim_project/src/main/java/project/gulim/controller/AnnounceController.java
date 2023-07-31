package project.gulim.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.gulim.domain.PostDTO;
import project.gulim.service.CommunityService;

@Controller
@RequestMapping(value = "/community")
public class AnnounceController {

	@Autowired
	CommunityService communityService;

	// 공지사항
	@RequestMapping("/announce_list")
	public String Announce(Model m,
			@RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size) {
		
		
		
		// 전체 게시글 수 조회
		int totalCount = communityService.countAllAnnounce();
		
		// 페이징 처리를 위한 정보 계산
		int totalPages = (int) Math.ceil((double) totalCount / size);
		int start = (page - 1) * size;
		
		// 특정 페이지의 게시글 목록 조회

		List<HashMap> announces = communityService.findAllAnnounce(start, size);
		m.addAttribute("announces", announces);
		m.addAttribute("currentPage", page);
		m.addAttribute("totalPages", totalPages);
		
		return "community/announce/announce_list";

	}
	
	
	

}

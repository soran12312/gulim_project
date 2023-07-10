package project.gulim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.gulim.domain.PostDTO;
import project.gulim.service.CommunityService;

@Controller
public class AnnounceController {
	
	@Autowired
	CommunityService communityService;
	
	// 공지사항
	@RequestMapping("/announce")
	public String Announce(Model m)
	{
		
		List<PostDTO> announces = communityService.findAllAnnounce();
        m.addAttribute("announces", announces);
		return "community/announce/announce_list";
		
	}
	
	
	
	
	
	

}

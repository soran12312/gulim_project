package project.gulim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.gulim.domain.ImageDTO;
import project.gulim.domain.PostDTO;
import project.gulim.service.CommunityService;

@Controller
@RequestMapping(value = "/community")
public class AnnounceController {

	@Autowired
	CommunityService communityService;

	// 공지사항
	@RequestMapping("/announce_list")
	public String Announce(Model m) {

		List<PostDTO> announces = communityService.findAllAnnounce();
		m.addAttribute("announces", announces);
		
		List<ImageDTO> announceimages = communityService.findAllAnnounceImg();
		m.addAttribute("announceimages", announceimages);
		System.out.println(announceimages);
		
		
		return "community/announce/announce_list";

	}
	
	
	

}

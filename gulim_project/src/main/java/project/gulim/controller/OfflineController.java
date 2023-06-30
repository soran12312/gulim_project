package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("/offline")
public class OfflineController {
	

	@RequestMapping("/map")
	public String find_place(){
		
		return "/offline/find_place";
	}
	
	@RequestMapping("/offline_friend")
	public String offline_friend() {
		
		return "/offline/find_near_friend";
	}
	
	
	
	
}

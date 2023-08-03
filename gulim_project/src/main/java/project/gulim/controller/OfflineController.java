package project.gulim.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.gulim.domain.PlaceDTO;
import project.gulim.service.OfflineService;

@Controller
@RequestMapping("/offline")
public class OfflineController {
	
	@Autowired
	private OfflineService offlineService;

	@RequestMapping("/map")
	public String find_place(Model m,PlaceDTO vo){
		// 지도에 마커를 만들기
		List<PlaceDTO> Marker = offlineService.getMarker(vo);
		
		m.addAttribute("Marker",Marker);

		return "/offline/find_place";	
	}
	
	
	@RequestMapping("/show_partnership")
	@ResponseBody
	//파트너쉽 매장 보기
	public List<PlaceDTO> showPartnership(PlaceDTO vo) {
	    List<PlaceDTO> showPartnership = offlineService.showPartnership(vo);
	    
	    return showPartnership;
	}

	
	
}

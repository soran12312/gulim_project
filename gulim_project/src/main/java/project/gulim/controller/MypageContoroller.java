package project.gulim.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.gulim.domain.ChatingDTO;
import project.gulim.service.MypageService;

@CrossOrigin(origins = "http://localhost:3000")
@Controller
@RequestMapping("/mypage")
public class MypageContoroller {
	
	@Autowired
	MypageService mypageService;

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) { // 페이지 이동(DB접속없는경우)
		return "/mypage/"+step;
	}
	@RequestMapping("/game/my_game_list")
	public String viewPage2() { // 페이지 이동(DB접속없는경우)
		return "/mypage/game/my_game_list";
	}
	@RequestMapping("/user_info/info_modify")
	public String viewPage3() { // 페이지 이동(DB접속없는경우)
		return "/mypage/user_info/info_modify";
	}
	
	@RequestMapping(value = "/{room_num}", method = RequestMethod.GET)
	@ResponseBody
	public Map getRoomInfo(@PathVariable Integer room_num) {
		String user_id = "nahs001";
		
		Map map = new HashMap();
		List member_info = new ArrayList();
		
		HashMap room = mypageService.getRoomInfo(room_num);
		map.putAll(room);
		
		String master_nickname = mypageService.getNicknameById((String)(room.get("id")));
		map.put("master_nickname", master_nickname);
		
		List<Integer> join_list = mypageService.getJoinNumByRoomNum(room_num);
		
		for(Integer join_num : join_list) {
			HashMap sheet = mypageService.getSheetByJoinNum(join_num);
			String id = mypageService.getIdByJoinNum(join_num);
			sheet.put("id", id);
			member_info.add(sheet);
		}
		map.put("member_info", member_info);
		map.put("user_id", user_id);
		System.out.println(map.toString());
		
		
		return map;
	}
}

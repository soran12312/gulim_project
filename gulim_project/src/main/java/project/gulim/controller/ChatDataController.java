package project.gulim.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import project.gulim.service.ChatDataService;

@CrossOrigin(origins = {"https://192.168.0.68:3000"})
@RestController
@RequestMapping("/chatData")
public class ChatDataController {
	
	@Autowired
	ChatDataService chatDataService;
	
	@GetMapping(value = "/room/{room_num}")
	public Map getRoomInfo(@PathVariable Integer room_num) {
		String user_id = "123";
		
		Map map = new HashMap();
		List member_info = new ArrayList();
		
		HashMap room = chatDataService.getRoomInfo(room_num);
		map.putAll(room);
		
		String master_nickname = chatDataService.getNicknameById((String)(room.get("id")));
		map.put("master_nickname", master_nickname);
		
		List<Integer> join_list = chatDataService.getJoinNumByRoomNum(room_num);
		
		for(Integer join_num : join_list) {
			HashMap sheet = chatDataService.getSheetByJoinNum(join_num);
			String id = chatDataService.getIdByJoinNum(join_num);
			sheet.put("id", id);
			member_info.add(sheet);
		}
		map.put("member_info", member_info);
		map.put("user_id", user_id);
		System.out.println(map.toString());
		
		
		return map;
	}
}

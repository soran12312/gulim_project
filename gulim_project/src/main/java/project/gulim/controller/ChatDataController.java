package project.gulim.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import project.gulim.domain.InventoryDTO;
import project.gulim.domain.ItemDTO;
import project.gulim.service.ChatDataService;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/chatData")
public class ChatDataController {
	
	@Autowired
	ChatDataService chatDataService;
	
	@GetMapping(value = "/room/{room_num}")
	public Map getRoomInfo(@PathVariable Integer room_num) {
		
		// 채팅방에서 쓰일 전체 유저정보 및 방정보
		Map map = new HashMap();
		// 채팅방의 유저(게임마스터 제외) 정보
		List member_info = new ArrayList();
		// 방정보를 가져와서 map에 담음
		HashMap room = chatDataService.getRoomInfo(room_num);
		map.putAll(room);
		// 게임마스터의 메모를 모두 가져와서 map에 담음(메모가 있을 경우에만)
		List<HashMap> master_memos = chatDataService.getMasterMemos(room_num);
		if(master_memos.size() != 0) {
			map.put("master_memos", master_memos);
		}
		
		// 채팅방에 참가하는 유저들 중 join_state가 1인(참가 허용) 유저의 join_num를 모두 가져옴
		List<Integer> join_list = chatDataService.getJoinNumByRoomNum(room_num);
		
		for(Integer join_num : join_list) {
			// 캐릭터시트 가져오기
			HashMap sheet = chatDataService.getSheetByJoinNum(join_num);
			// 해당 맴버의 id 가져오기
			String id = chatDataService.getIdByJoinNum(join_num);
			// 해당 캐릭터시트의 skill들 모두 가져오기
			List<HashMap> skills = chatDataService.getSkillsBySheetNum((Integer)sheet.get("sheet_num"));
			// 해당 캐릭터시트의 인벤토리와 그 안의 아이템을 모두 가져오기
			HashMap inventory = chatDataService.getInventoryByJoinNum(join_num);
			List<HashMap> items = chatDataService.getItemsByInvenNum((Integer)inventory.get("inventory_num"));
			// 인벤토리에 아이템 넣기
			inventory.put("items", items);
			
			// 캐릭터시트에 해당 유저의 id와 skills 넣기
			sheet.put("id", id);
			sheet.put("skills", skills);
			// 캐릭터시트에 인벤토리 넣기
			sheet.put("inventory", inventory);
			
			// 캐릭터시트에 해당 유저의 메모 넣기(메모가 있을 경우에만)
			List<HashMap> memos = chatDataService.getMemosByJoinNum(join_num);
			if(memos.size() != 0) {
				sheet.put("memos", memos);
			}
			
			
			member_info.add(sheet);
		}
		map.put("member_info", member_info);
		System.out.println(map.toString());
		
		
		return map;
	}
	
	@PostMapping("/insertItem")
	public void insertItem(@RequestBody ItemDTO item) {
		//System.out.println(item);
		chatDataService.insertItem(item);
	}
	
	@PostMapping("/modifyItem")
	public void modifyItem(@RequestBody ItemDTO item) {
		//System.out.println(item);
		chatDataService.modifyItem(item);
	}
	
	@GetMapping("/deleteItem")
	public void deleteItem(Integer item_num) {
		//System.out.println(item_num);
		chatDataService.deleteItem(item_num);
	}
	
	@GetMapping("/modifyMoney")
	public void modifyMoney(InventoryDTO inven) {
		
		chatDataService.modifyMoney(inven);
	}
	
}

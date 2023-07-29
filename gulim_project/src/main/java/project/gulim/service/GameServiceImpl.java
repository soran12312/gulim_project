package project.gulim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.GameDAO;
import project.gulim.domain.CharacterSheetDTO;
import project.gulim.domain.ChatingDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.InventoryDTO;
import project.gulim.domain.ItemDTO;
import project.gulim.domain.JoinDTO;
import project.gulim.domain.SkillDTO;
import project.gulim.domain.SupportImgBoardDTO;
import project.gulim.domain.TagDTO;

@Service
public class GameServiceImpl implements GameService {
	
	@Autowired
	GameDAO gameDAO;

	@Override
	public Integer room_insert(ChatingDTO room) {
		gameDAO.room_insert(room);
		return room.getRoom_num();
	}

	@Override
	public void room_img_insert(ImageDTO img) {
		gameDAO.room_img_insert(img);
		
	}

	@Override
	public void tag_insert(TagDTO tag) {
		gameDAO.tag_insert(tag);
		
	}

	@Override
	public List<Map> select_room_list() {
		
		return gameDAO.select_room_list();
	}

	@Override
	public List<String> select_tag_by_room_num(Integer room_num) {
		
		return gameDAO.select_tag_by_room_num(room_num);
	}

	@Override
	public String select_nickname_by_id(String id) {
		
		return gameDAO.select_nickname_by_id(id);
	}

	@Override
	public Map select_room_detail(Integer room_num) {
		
		return gameDAO.select_room_detail(room_num);
	}

	@Override
	public String select_room_img(Integer room_num) {
		
		return gameDAO.select_room_img(room_num);
	}

	@Override
	public List<Integer> select_join(JoinDTO join) {
		
		return gameDAO.select_join(join);
	}

	@Override
	public List<HashMap> support_data() {
		return gameDAO.support_data();
	}
	public Integer etc2(SupportImgBoardDTO dto) {
		gameDAO.etc2(dto);
		return dto.getS_img_num();
	}
	public Integer etc(HashMap map) {
		return gameDAO.etc(map);
	}

	@Override
	public Integer insert_join(JoinDTO join) {
		gameDAO.insert_join(join);
		return join.getJoin_num();
	}

	@Override
	public Integer insert_sheet(CharacterSheetDTO cs) {
		gameDAO.insert_sheet(cs);
		return cs.getSheet_num();
	}

	@Override
	public Integer insert_inventory(InventoryDTO inv) {
		gameDAO.insert_inventory(inv);
		return inv.getInventory_num();
	}

	@Override
	public void insert_skill(SkillDTO skill) {
		
		gameDAO.insert_skill(skill);
	}

	@Override
	public void insert_item(ItemDTO item) {
		
		gameDAO.insert_item(item);
	}


}

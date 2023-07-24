package project.gulim.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.GameDAO;
import project.gulim.domain.ChatingDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.JoinDTO;
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

}

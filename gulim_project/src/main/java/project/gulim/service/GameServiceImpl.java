package project.gulim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.GameDAO;
import project.gulim.domain.ChatingDTO;
import project.gulim.domain.ImageDTO;
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

}

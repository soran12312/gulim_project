package project.gulim.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.ChatDataDAO;
import project.gulim.dao.MypageDAO;
import project.gulim.domain.ChatingDTO;

@Service
public class ChatDataServiceImpl implements ChatDataService {
	
	@Autowired
	ChatDataDAO chatdataDAO;

	@Override
	public HashMap getRoomInfo(Integer room_num) {
		
		return chatdataDAO.getRoomInfo(room_num);
	}

	@Override
	public List<Integer> getJoinNumByRoomNum(Integer room_num) {
		
		return chatdataDAO.getJoinNumByRoomNum(room_num);
	}

	@Override
	public HashMap getSheetByJoinNum(Integer join_num) {
		
		return chatdataDAO.getSheetByJoinNum(join_num);
	}

	@Override
	public String getNicknameById(String id) {
		
		return chatdataDAO.getNicknameById(id);
	}

	@Override
	public String getIdByJoinNum(Integer join_num) {
		
		return chatdataDAO.getIdByJoinNum(join_num);
	}

	@Override
	public List<HashMap> getSkillsBySheetNum(Integer sheet_num) {
		
		return chatdataDAO.getSkillsBySheetNum(sheet_num);
	}

	@Override
	public HashMap getInventoryByJoinNum(Integer join_num) {
		
		return chatdataDAO.getInventoryByJoinNum(join_num);
	}

	@Override
	public List<HashMap> getItemsByInvenNum(Integer inventory_num) {
		
		return chatdataDAO.getItemsByInvenNum(inventory_num);
	}

	@Override
	public List<HashMap> getMasterMemos(Integer room_num) {
		
		return chatdataDAO.getMasterMemos(room_num);
	}

	@Override
	public List<HashMap> getMemosByJoinNum(Integer join_num) {
		
		return chatdataDAO.getMemosByJoinNum(join_num);
	}

}

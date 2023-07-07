package project.gulim.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.MypageDAO;
import project.gulim.domain.ChatingDTO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDAO mypageDAO;

	@Override
	public HashMap getRoomInfo(Integer room_num) {
		
		return mypageDAO.getRoomInfo(room_num);
	}

	@Override
	public List<Integer> getJoinNumByRoomNum(Integer room_num) {
		
		return mypageDAO.getJoinNumByRoomNum(room_num);
	}

	@Override
	public HashMap getSheetByJoinNum(Integer join_num) {
		
		return mypageDAO.getSheetByJoinNum(join_num);
	}

	@Override
	public String getNicknameById(String id) {
		
		return mypageDAO.getNicknameById(id);
	}

	@Override
	public String getIdByJoinNum(Integer join_num) {
		
		return mypageDAO.getIdByJoinNum(join_num);
	}

}

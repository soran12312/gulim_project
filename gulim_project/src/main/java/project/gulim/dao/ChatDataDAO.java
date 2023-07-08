package project.gulim.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.ChatingDTO;

@Mapper
public interface ChatDataDAO {

	public HashMap getRoomInfo(Integer room_num);
	public List<Integer> getJoinNumByRoomNum(Integer room_num);
	public HashMap getSheetByJoinNum(Integer join_num);
	public String getIdByJoinNum(Integer join_num);
	public String getNicknameById(String id);
	
}

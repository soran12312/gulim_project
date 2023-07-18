package project.gulim.service;

import java.util.HashMap;
import java.util.List;

import project.gulim.domain.ChatingDTO;

public interface ChatDataService {
	
	public HashMap getRoomInfo(Integer room_num);
	public List<Integer> getJoinNumByRoomNum(Integer room_num);
	public HashMap getSheetByJoinNum(Integer join_num);
	public List<HashMap> getSkillsBySheetNum(Integer sheet_num);
	public String getIdByJoinNum(Integer join_num);
	public String getNicknameById(String id);
	public HashMap getInventoryByJoinNum(Integer join_num);
	public List<HashMap> getItemsByInvenNum(Integer inventory_num);
	public List<HashMap> getMasterMemos(Integer room_num);
	public List<HashMap> getMemosByJoinNum(Integer join_num);

}

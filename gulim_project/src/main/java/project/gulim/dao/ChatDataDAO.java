package project.gulim.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestBody;

import project.gulim.domain.CharacterSheetDTO;
import project.gulim.domain.ChatingDTO;
import project.gulim.domain.InventoryDTO;
import project.gulim.domain.ItemDTO;
import project.gulim.domain.MemoDTO;
import project.gulim.domain.SkillDTO;

@Mapper
public interface ChatDataDAO {

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
	public void insertItem(ItemDTO item);
	public void modifyItem(ItemDTO item);
	public void deleteItem(Integer item_num);
	public void modifyMoney(InventoryDTO inven);
	public void modifyStat(CharacterSheetDTO sheet);
	public void insertSkill(SkillDTO skill);
	public void modifySkill(SkillDTO skill);
	public void deleteSkill(Integer skill_num);
	public void charExplainModify(CharacterSheetDTO sheet);
	public void updateMemo(MemoDTO memo);
	public void insertMemo(MemoDTO memo);
	public void deleteMemo(Integer memo_num);
	
}

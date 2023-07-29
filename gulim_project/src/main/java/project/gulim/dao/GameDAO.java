package project.gulim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.CharacterSheetDTO;
import project.gulim.domain.ChatingDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.InventoryDTO;
import project.gulim.domain.ItemDTO;
import project.gulim.domain.JoinDTO;
import project.gulim.domain.SkillDTO;
import project.gulim.domain.SupportImgBoardDTO;
import project.gulim.domain.TagDTO;

@Mapper
public interface GameDAO {

	public void room_insert(ChatingDTO room);
	public void room_img_insert(ImageDTO img);
	public void tag_insert(TagDTO tag);
	public List<Map> select_room_list();
	public List<String> select_tag_by_room_num(Integer room_num);
	public String select_nickname_by_id(String id);
	public Map select_room_detail(Integer room_num);
	public String select_room_img(Integer room_num);
	public List<Integer> select_join(JoinDTO join);
	public List<HashMap> support_data();
	public Integer etc(HashMap map);
	public void etc2(SupportImgBoardDTO dto);
	public void insert_join(JoinDTO join);
	public void insert_sheet(CharacterSheetDTO cs);
	public void insert_inventory(InventoryDTO inv);
	public void insert_skill(SkillDTO skill);
	public void insert_item(ItemDTO item);
}

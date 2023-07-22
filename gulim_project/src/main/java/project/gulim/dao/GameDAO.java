package project.gulim.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.ChatingDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.TagDTO;

@Mapper
public interface GameDAO {

	public void room_insert(ChatingDTO room);
	public void room_img_insert(ImageDTO img);
	public void tag_insert(TagDTO tag);
	public List<Map> select_room_list();
	public List<String> select_tag_by_room_num(Integer room_num);
	public String select_nickname_by_id(String id);
}
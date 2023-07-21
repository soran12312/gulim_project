package project.gulim.dao;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.ChatingDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.TagDTO;

@Mapper
public interface GameDAO {

	public void room_insert(ChatingDTO room);
	public void room_img_insert(ImageDTO img);
	public void tag_insert(TagDTO tag);
}

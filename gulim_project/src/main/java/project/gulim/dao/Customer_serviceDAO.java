package project.gulim.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.ImageDTO;
import project.gulim.domain.QuestionDTO;

@Mapper
public interface Customer_serviceDAO {
	
	public void send_question(QuestionDTO questionDTO);
	
	public List<Map> chat(ImageDTO imageDTO);
	
	

}

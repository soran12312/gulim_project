package project.gulim.dao;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.MemberDTO;
import project.gulim.domain.QuestionDTO;

@Mapper
public interface Customer_serviceDAO {
	
	public void send_question(QuestionDTO questionDTO);
	
	public Integer isManager(String id);
	
	public void main(MemberDTO member);

}

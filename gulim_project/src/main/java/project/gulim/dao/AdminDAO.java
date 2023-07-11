package project.gulim.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.BasketDTO;
import project.gulim.domain.BookDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.PlaceDTO;
import project.gulim.domain.QuestionDTO;


@Mapper
public interface AdminDAO {
	public List<QuestionDTO> listQuestion();
	public void answerQuestion(QuestionDTO qDTO);
	public List<MemberDTO> listMember();
	public void changeMemberState(MemberDTO mDTO);
	public List<PlaceDTO> listPlace();
}

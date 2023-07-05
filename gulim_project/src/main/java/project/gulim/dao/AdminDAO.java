package project.gulim.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.QuestionDTO;


@Mapper
public interface AdminDAO {
	public List<QuestionDTO> listQuestion();
	public void answerQuestion(QuestionDTO qDTO);
}

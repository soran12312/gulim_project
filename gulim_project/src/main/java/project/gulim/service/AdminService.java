package project.gulim.service;

import java.util.List;

import project.gulim.domain.QuestionDTO;

public interface AdminService {
	
	public List<QuestionDTO> listQuestion();
	public void answerQuestion(QuestionDTO qDTO);

}

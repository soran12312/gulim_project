package project.gulim.service;

import java.util.HashMap;
import java.util.List;

import project.gulim.domain.MemberDTO;
import project.gulim.domain.PlaceDTO;
import project.gulim.domain.QuestionDTO;

public interface AdminService {
	
	public List<QuestionDTO> listQuestion();
	public void answerQuestion(QuestionDTO qDTO);
	public List<MemberDTO> listMember();
	public void changeMemberState(MemberDTO mDTO);
	public List<PlaceDTO> listPlace();
}

package project.gulim.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.AdminDAO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.PlaceDTO;
import project.gulim.domain.QuestionDTO;
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired	// 의존성 주입: QnaDAO에 사용
	private AdminDAO adminDAO;	// 변수명: 소문자로 시작, DAO 쓰기
	
	public List<QuestionDTO> listQuestion(){
		return adminDAO.listQuestion();
	}
	
	public void answerQuestion(QuestionDTO qDTO) {
		adminDAO.answerQuestion(qDTO);
	}
	
	public List<MemberDTO> listMember(){
		return adminDAO.listMember();
	}
	
	public void changeMemberState(MemberDTO mDTO) {
		adminDAO.changeMemberState(mDTO);
	}
	
	public List<PlaceDTO> listPlace(){
		return adminDAO.listPlace();
	}
	
}

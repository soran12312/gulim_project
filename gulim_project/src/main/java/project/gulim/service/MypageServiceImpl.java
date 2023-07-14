package project.gulim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.gulim.dao.MypageDAO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.QuestionDTO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDAO mypageDAO;

//=========== START of 회원정보 ======================================================================================================	
	@Override
	public Boolean mypage_password_check(MemberDTO member) {
		
		String password = mypageDAO.mypage_password_check(member);
		
		if(BCrypt.checkpw(member.getPassword(), password)) return true;
		else return false;
	}

	public Map find_info(MemberDTO member) {
		return mypageDAO.find_info(member);
	}
	public void modify_info(MemberDTO member) {
		mypageDAO.modify_info(member);
	}
	@Transactional
	public Integer modify_info_img(HashMap map) {
		mypageDAO.modify_info_imgDelete(map);
		Integer result = mypageDAO.modify_info_img(map);
		return result;
	}
	public String find_info_img(MemberDTO member) {
		String result = mypageDAO.find_info_img(member);
		return result;
	}
//=========== END of 회원정보 ======================================================================================================	
	public List<QuestionDTO>find_question(QuestionDTO question){
	      return mypageDAO.find_question(question);
	   }
}

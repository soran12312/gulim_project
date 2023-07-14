package project.gulim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.tags.shaded.org.apache.regexp.recompile;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.gulim.dao.MypageDAO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.MessageDTO;
import project.gulim.domain.QuestionDTO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDAO mypageDAO;
//=========== START of 쪽지 ======================================================================================================	
	
	public List<MessageDTO> my_message(String id){
		return mypageDAO.my_message(id);
	}
	public String send_id_name(String send_id) {
		return mypageDAO.send_id_name(send_id);
	}
	public void save_message(HashMap map) {
		mypageDAO.save_message(map);
	}
	public MessageDTO detail_message(Integer num) {
		return mypageDAO.detail_message(num);
	}
//=========== END of 쪽지 ======================================================================================================	

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

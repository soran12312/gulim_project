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
import project.gulim.domain.CalenderDTO;
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
	
	public List<MessageDTO> my_message2(String id) {
		return mypageDAO.my_message2(id);
	}

	public String nick_same_id(String nick_same_id) {
		return mypageDAO.nick_same_id(nick_same_id);
	}
	
	public void save_message(HashMap map) {
		mypageDAO.save_message(map);
	}
	
	public MessageDTO detail_message(Integer num) {
		return mypageDAO.detail_message(num);
	}
	
	public Integer message_delete(Integer num) {
		return mypageDAO.message_delete(num);
	}

 
//=========== END of 쪽지 ======================================================================================================	
//=========== START of 캘린더 ======================================================================================================	
	public Integer select_evt(CalenderDTO calenderDTO) {
		Integer result = mypageDAO.select_evt(calenderDTO);
		return result;
	}
	
	public List<CalenderDTO> find_evt(String id) {
		return mypageDAO.find_evt(id);
	}
	
	public void delete_evt(Integer calender_num) {
		mypageDAO.delete_evt(calender_num);
	}

//=========== END of 캘린더 ======================================================================================================	
//=========== START of 회원정보 ======================================================================================================	
	public Boolean mypage_password_check(MemberDTO member) {
		//패스워드 받아오기
		String password = mypageDAO.mypage_password_check(member);
		
		//받아온 패스워드(토큰값) == 패스워드(String이라 토큰값으로 변환해서) 동일한지 확인
		if(BCrypt.checkpw(member.getPassword(), password)) return true;
		else return false;
	}
	
	public Map find_info(MemberDTO member) {
		return mypageDAO.find_info(member);
	}
	
	
	public void modify_info(MemberDTO member) {
		mypageDAO.modify_info(member);
	}
	
	
	@Transactional //프사저장안되면 삭제두 안됨
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

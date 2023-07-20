package project.gulim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.gulim.domain.CalenderDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.MessageDTO;
import project.gulim.domain.QuestionDTO;

public interface MypageService {
	//=========== START of 쪽지 ======================================================================================================	
	public List<MessageDTO> my_message(String id);
	public List<MessageDTO> my_message2(String id);
	public String nick_same_id(String nick_same_id);
	public void save_message(HashMap map);
	public MessageDTO detail_message(Integer num);
	public Integer message_delete(Integer num);
	//=========== END of 쪽지 ======================================================================================================	
	
	
	//=========== START of 캘린더 ======================================================================================================	
	public Integer select_evt(CalenderDTO calenderDTO);
	public List<CalenderDTO> find_evt(String id);
	public void delete_evt(Integer calender_num);
	//=========== END of 캘린더 ======================================================================================================	
	
	
	//=========== START of 회원정보 ======================================================================================================	
	public Boolean mypage_password_check(MemberDTO member);
	public Map find_info(MemberDTO member);
	public void modify_info(MemberDTO member);
	public Integer modify_info_img(HashMap map);
	public String find_info_img(MemberDTO member);
	//=========== END of 회원정보 ======================================================================================================	
	public List<QuestionDTO>find_question(QuestionDTO question);
	
	

	
	
	
	
	

	
}

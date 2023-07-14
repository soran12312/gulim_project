package project.gulim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.gulim.domain.MemberDTO;
import project.gulim.domain.QuestionDTO;

public interface MypageService {
	//=========== START of 회원정보 ======================================================================================================	
	public Boolean mypage_password_check(MemberDTO member);
	public Map find_info(MemberDTO member);
	public void modify_info(MemberDTO member);
	public Integer modify_info_img(HashMap map);
	public String find_info_img(MemberDTO member);
	//=========== END of 회원정보 ======================================================================================================	
	public List<QuestionDTO>find_question(QuestionDTO question);
}

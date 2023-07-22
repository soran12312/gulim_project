package project.gulim.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.gulim.domain.CalenderDTO;
import project.gulim.domain.FriendDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.MessageDTO;
import project.gulim.domain.PostDTO;
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
	public Integer insert_evt(CalenderDTO calenderDTO);
	public List<CalenderDTO> find_evt(String id);
	public void delete_evt(Integer calender_num);
	//=========== END of 캘린더 ======================================================================================================	
	//=========== START of 게임관리 ======================================================================================================	
	public List<Map> selectRoomById(String id);
	public Integer selectNumOfJoinByRoomNum(Integer roon_num);
	public String selectImgPathByRoomNum(Integer roon_num);
	public List<Integer> selectAllJoinedRoomNumById(String id);
	public String selectRoomNameByPK(Integer roon_num);

	//=========== END of 게임관리 ========================================================================================================
	//=========== START of 나의 게시물 ======================================================================================================	
	public ArrayList<HashMap> my_post(PostDTO post);
	//=========== END of 나의 게시물 ======================================================================================================	

	//=========== START of 회원정보 ======================================================================================================	
	public Boolean mypage_password_check(MemberDTO member);
	public Map find_info(MemberDTO member);
	public void modify_info(MemberDTO member);
	public Integer modify_info_img(HashMap map);
	public String find_info_img(MemberDTO member);
	//=========== END of 회원정보 ======================================================================================================	
	public List<QuestionDTO>find_question(QuestionDTO question);

	//=========== START of 친구관리 ======================================================================================================	
	public List<FriendDTO> friend(String id);
	public MemberDTO checked(String id);
	public void dist_search0(String id);
	public void dist_search1(String id);
	public void name_search0(String id);
	public void name_search1(String id);
	public List<MemberDTO> search_friend_id(String id);
	public MemberDTO friend_profile(String id);
	public String friend_img(String id);
	public void make_friend(FriendDTO friend);
	public void no_friend(FriendDTO friend);
	public List<Integer> friend_playlist(String id);
	public HashMap find_gamename(Integer num);
	//=========== END of 친구관리 ======================================================================================================	
	
	
	
	
	
	
	
	

	

	
	
	
	
	

	
}

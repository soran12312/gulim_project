package project.gulim.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.gulim.domain.CalenderDTO;
import project.gulim.domain.ChatingDTO;
import project.gulim.domain.FriendDTO;
import project.gulim.domain.JoinDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.MessageDTO;
import project.gulim.domain.PostDTO;
import project.gulim.domain.QuestionDTO;
import project.gulim.domain.TagDTO;

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
	public List<JoinDTO> selectAllJoinedRoomNumById(String id);
	public String selectRoomNameByPK(Integer roon_num);
	public ArrayList<Integer> char_sheet_list(Integer room_num);
	public HashMap find_joininfo(Integer list);
	public HashMap char_sheet_confirm(Integer join_num);
	public ArrayList<HashMap> skills(Integer sheet_num);
	public ArrayList<HashMap> items(Integer inventory_num);
	public void agree_brother(Integer join_num);
	public Integer selectJoinStateByJoinNum(Integer join_num);
	public void join_cancle(Integer join_num);
	public void room_delete(Integer roon_num);
	public ChatingDTO select_room_detail(Integer roon_num);
	public List<String> select_tag_by_room_num(Integer roon_num);
	public void room_modify(ChatingDTO room);
	public void delete_room_img(Integer roon_num);
	public void delete_room_tag(Integer roon_num);
	public void inc_curr_member(Integer roon_num);
	public void dec_curr_member(Integer roon_num);
	//=========== END of 게임관리 ========================================================================================================
	//=========== START of 나의 게시물 ======================================================================================================	
	public ArrayList<HashMap> my_post(PostDTO post);
	public ArrayList<HashMap> my_post2(PostDTO post);
	public void deletePosts(String postNums);
	//=========== END of 나의 게시물 ======================================================================================================	

	//=========== START of 회원정보 ======================================================================================================	
	public Boolean mypage_password_check(MemberDTO member);
	public Map find_info(MemberDTO member);
	public List<Integer> my_playlist(MemberDTO member);
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
	//=========== START of 결제내역 ======================================================================================================	
	public String my_purchase(String id);
	public List<HashMap> my_purchase2(String id);
	//=========== END of 결제내역 ======================================================================================================	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	

	

	
	
	
	
	

	
}

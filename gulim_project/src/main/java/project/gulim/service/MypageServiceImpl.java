package project.gulim.service;

import java.util.ArrayList;
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
import project.gulim.domain.FriendDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.MessageDTO;
import project.gulim.domain.PostDTO;
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
	   public Integer insert_evt(CalenderDTO calenderDTO) {
	      Integer result = mypageDAO.insert_evt(calenderDTO);
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
	public List<Integer> my_playlist(MemberDTO member){
		return mypageDAO.my_playlist(member);
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
	//=========== START of 나의 게시물 ======================================================================================================	
	public ArrayList<HashMap> my_post(PostDTO post){
	return mypageDAO.my_post(post);
	}
	
	public ArrayList<HashMap> my_post2(PostDTO post){
		return mypageDAO.my_post2(post);
	}
	public void deletePosts(String postNums) {
		mypageDAO.deletePosts(postNums);
	}

//=========== END of 나의 게시물 ======================================================================================================
	
	public List<QuestionDTO>find_question(QuestionDTO question){
	      return mypageDAO.find_question(question);
	   }

	@Override
	public List<Map> selectRoomById(String id) {
		
		return mypageDAO.selectRoomById(id);
	}

	@Override
	public Integer selectNumOfJoinByRoomNum(Integer roon_num) {
		
		return mypageDAO.selectNumOfJoinByRoomNum(roon_num);
	}

	@Override
	public String selectImgPathByRoomNum(Integer roon_num) {
		
		return mypageDAO.selectImgPathByRoomNum(roon_num);
	}

	@Override
	public List<Integer> selectAllJoinedRoomNumById(String id) {
		
		return mypageDAO.selectAllJoinedRoomNumById(id);
	}

	@Override
	public String selectRoomNameByPK(Integer roon_num) {
		
		return mypageDAO.selectRoomNameByPK(roon_num);
	}


//=========== START of 친구관리 ======================================================================================================	
	public List<FriendDTO> friend(String id) {
		return mypageDAO.friend(id);
	}
	public MemberDTO checked(String id) {
		return mypageDAO.checked(id);
	}
	public void dist_search0(String id) {
		mypageDAO.dist_search0(id);
	}
	public void dist_search1(String id) {
		mypageDAO.dist_search1(id);
	}
	public void name_search0(String id) {
		mypageDAO.name_search0(id);
	}
	public void name_search1(String id) {
		mypageDAO.name_search1(id);
	}
	public List<MemberDTO> search_friend_id(String id){
		return mypageDAO.search_friend_id(id);
	}
	public MemberDTO friend_profile(String id) {
		return mypageDAO.friend_profile(id);
	}
	public String friend_img(String id){
		return mypageDAO.friend_img(id);
	}
	public void make_friend(FriendDTO friend) {
			mypageDAO.make_friend(friend);
	}
	public void no_friend(FriendDTO friend) {
		mypageDAO.no_friend(friend);
	}
	public List<Integer> friend_playlist(String id){
		return mypageDAO.friend_playlist(id);
	}
	public HashMap find_gamename(Integer num) {
		return mypageDAO.find_gamename(num);
	}
	
//=========== END of 친구관리 ======================================================================================================	






	







}

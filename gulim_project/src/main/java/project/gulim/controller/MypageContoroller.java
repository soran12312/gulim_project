package project.gulim.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.domain.CalenderDTO;
import project.gulim.domain.ChatingDTO;
import project.gulim.domain.FriendDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.JoinDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.MessageDTO;
import project.gulim.domain.PostDTO;
import project.gulim.domain.QuestionDTO;
import project.gulim.domain.TagDTO;
import project.gulim.service.GameService;
import project.gulim.service.MainService;
import project.gulim.service.MypageService;
import project.gulim.util.MD5Generator;

@Controller
@RequestMapping("/mypage")
public class MypageContoroller {
	
	@Autowired
	private HttpServletRequest req;
	
	@Autowired
	private GameService gameService;
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) { // 페이지 이동(DB접속없는경우)
		return "mypage/"+step;
	}
	
	@RequestMapping("/game/chat_room")
	public String chat_room() { // 페이지 이동(DB접속없는경우)
		return "/mypage/game/chat_room";
	}

//=========== START of 쪽지 ======================================================================================================	

//id기준으로 쪽지목록 불러오기
	@RequestMapping("/my_message")
	@Transactional
	public String my_message(MemberDTO memberDTO, Model m) {
		
		String id = myId_is_in_cookies();  	    
	    memberDTO.setId(id);
	    m.addAttribute("memberDTO", memberDTO);	
		
		
		//받은 쪽지함========================
		//서비스에서  MessageDTO를 List에 담아서 쪽지내용 받아오기
		List<MessageDTO> result = mypageService.my_message(id);
		
		//모델 allmessage에 쪽지목록 담기 
		m.addAttribute("allmessage",result);
		
		Map nickname = new HashMap();
		
		//보낸 아이디옆에 출력할 닉네임 불러오기
		for(MessageDTO message : result){
			String nick_same_id = mypageService.nick_same_id(message.getSend_id());
			
			//key=id  value=nickname 으로 해쉬맵에 담기
			nickname.put(message.getSend_id(), nick_same_id);
		}
		//모델 nickname에 해쉬맵담기
		m.addAttribute("nickname",nickname);
		
		
		
		//보낸 쪽지함========================
		//서비스에서  MessageDTO를 List에 담아서 쪽지내용 받아오기
		List<MessageDTO> result2 = mypageService.my_message2(id);
		
		//모델 allmessage2에 쪽지목록 담기 
		m.addAttribute("allmessage2",result2);
			
		Map nickname2 = new HashMap();
			
		//보낸 아이디옆에 출력할 닉네임 불러오기
		for(MessageDTO message2 : result2){
			String nick_same_id = mypageService.nick_same_id(message2.getReceive_id());
		
			//key=id  value=nickname 으로 해쉬맵에 담기
			nickname2.put(message2.getReceive_id(), nick_same_id);
		}
		//모델 nickname에 해쉬맵담기
		m.addAttribute("nickname2",nickname2);
		
		
		return "/mypage/my_message";
	}
	
	
	
//쪽지보내기로 이동하면서 아이디 가져가기
	@RequestMapping("/send_message")
	public String send_message(String send_id, Model m) {
		//보낸사람이 null일경우 빈공간으로(바로 쪽지보내기눌렀을 경우)
		if(send_id == null) {
			send_id="";
		}
		
		//모델에 받은사람 아이디 담기(답글에서 바로 아이디 출력)
		m.addAttribute("send_id", send_id);
		return "/mypage/send_message";
	}
	
	
	
    //쪽지상세보기로 이동
	@RequestMapping("/detail_message")
	public String detail_message(Integer num, Model m) {
		//글넘버 가지고 서비스단으로 이동해서 해당 메세지데이터 가져오기
		MessageDTO message = mypageService.detail_message(num);
		
		//모델에 메세지 담기
		m.addAttribute("message", message);
		return "/mypage/detail_message";
	}
	

	
    //쪽지 보내기
	@RequestMapping("/save_message")
	public String save_message(
								@RequestParam ("message_title") String message_title, 
								@RequestParam("receive_id") String receive_id, 
								@RequestParam("message_content") String message_content){
		
		
		String send_id = myId_is_in_cookies();
		
		//쪽지 내용 해쉬맵에 담기
		HashMap map = new HashMap();
		map.put("message_title", message_title);
		map.put("receive_id", receive_id);
		map.put("message_content", message_content);
		map.put("send_id", send_id);
		
		//쪽지내용들고 DB로 이동
		mypageService.save_message(map);
	return "/mypage/my_message";	
	}
	
	//쪽지삭제하기로 이동
	@RequestMapping("/message_delete")
	public String message_delete(Integer num, Model m) {
		//글넘버 가지고 서비스단으로 이동해서 해당 메세지데이터 가져오기
		Integer result = mypageService.message_delete(num);
		return "redirect:/mypage/my_message";
	}
//=========== END of 쪽지 ========================================================================================================
//=========== START of 캘린더 ======================================================================================================   

   
   

	   
	   
	//캘린더 페이지 진입 시 일정 리스트 받아오기
	   @RequestMapping("/calender")
	   public String find_evt(CalenderDTO calenderDTO, Model m) {
		   String id = myId_is_in_cookies();         

	       List<CalenderDTO> list = mypageService.find_evt(id);
	       List<HashMap> result = new ArrayList<HashMap>();
	       //model안에 list안에 map안에 일정 정보 담기
	       for(CalenderDTO c : list) {
	            HashMap map = new HashMap();
	            map.put("num", c.getCalender_num());
	            map.put("start", c.getCalender_date());
	            map.put("title", c.getCalender_title());
	            map.put("description", c.getCalender_content());
	            result.add(map);
	         }
	       m.addAttribute("evt", result);      
	       return "/mypage/calender";
	   }
	   
	   
	   
	   
	//일정 저장하기
	   @RequestMapping("/insert_evt")
	   @ResponseBody 
	   public void insert_evt(String calender_date, String calender_title,String calender_content
	                        ,CalenderDTO calenderDTO, Model m) {
	      
	      
		   String id = myId_is_in_cookies();  
	       
	       //calenderDTO에 일정정보 담아서 DB에 입력
	       calenderDTO.setId(id);
	       calenderDTO.setCalender_date(calender_date);
	       calenderDTO.setCalender_title(calender_title);
	       calenderDTO.setCalender_content(calender_content);
	       
	       Integer result = mypageService.insert_evt(calenderDTO);
	       m.addAttribute("calenderDTO", calenderDTO);
	   }
	      
	      

	//캘린더 삭제 시 패스워드 체크 
	   @RequestMapping("/mypage_password_check_calender")
	   @ResponseBody
	   public Boolean mypage_password_check_calender(MemberDTO memberDTO) {
		  String id = myId_is_in_cookies();         
	      memberDTO.setId(id);
	      
	      //비밀번호 체크 (일치 : True 불일치 False)
	      Boolean result = mypageService.mypage_password_check(memberDTO);  
	      return result;
	      }
	   
	//일정 삭제   
	   @RequestMapping("/delete_evt")
	   public String delete_evt(Integer calender_num) {
	      //일정넘버 가지고 서비스단으로 이동해서 해당 일정 삭제
	      mypageService.delete_evt(calender_num);
	      return "/mypage/calender";
	   }

//=========== END of 캘린더 ========================================================================================================
//=========== START of 게임관리 ======================================================================================================	

	@RequestMapping("/game/my_game_list")
	public String my_game_list(Model m) {
		
		String id = myId_is_in_cookies();
		
		// 유저의 게임 리스트를 모두 담을 map
		Map map = new HashMap();
		
		// 내가 마스터인 방의 room_num, room_name, 조인 요청 갯수, 방 이미지 path 가져오기
		List<Map> game_master_list = mypageService.selectRoomById(id);
		for(Map room : game_master_list) {
			Integer num_of_join = mypageService.selectNumOfJoinByRoomNum((Integer)room.get("room_num"));
			if(num_of_join != null) {
				room.put("num_of_join", num_of_join);
			}
			String img_path = mypageService.selectImgPathByRoomNum((Integer)room.get("room_num"));
			if(img_path != null){
				room.put("img_path", img_path);
			}
		}
		map.put("master", game_master_list);
		
		// 내가 플레이어로 참가 허가된 방의 room_num, room_name, 방 이미지 path 가져오기
		List<Map> player_list = new ArrayList();
		List<JoinDTO> room_list = mypageService.selectAllJoinedRoomNumById(id);
		
		for(JoinDTO room : room_list) {
			Map player = new HashMap();
			String room_name = mypageService.selectRoomNameByPK(room.getRoom_num());
			String img_path = mypageService.selectImgPathByRoomNum(room.getRoom_num());
			
			// 얻어온 room_num의 방이 개설상태가 개설중인 경우(== room_name을 얻어온 경우)
			if(room_name != null) {
				player.put("room_num", room.getRoom_num());
				player.put("room_name", room_name);
				player.put("join_state", room.getJoin_state());
				player.put("join_num", room.getJoin_num());
				if(img_path != null) {
					player.put("img_path", img_path);
				}
				player_list.add(player);
			}
		}
		map.put("player", player_list);
		
		System.out.println(map);
		
		m.addAttribute("room_info", map);
		
		
		return "/mypage/game/my_game_list";
	}
	
	@RequestMapping("/game/get_id")
	@ResponseBody
	public String get_id() {
		String id = myId_is_in_cookies();		
		return id;
	}
	
	// 참가취소
	@RequestMapping("/game/join_cancle")
	public String join_cancle(Integer join_num, Integer room_num) {
		
		Integer join_state = mypageService.selectJoinStateByJoinNum(join_num);
		
		if(join_state == 1) {
			mypageService.dec_curr_member(room_num);
		}
		
		mypageService.join_cancle(join_num);
		
		return "redirect:/mypage/game/my_game_list";
	}
	
	@RequestMapping("/game/my_game_modify")
	public String my_game_modify(Integer room_num, Model m) {
		
		ChatingDTO room = mypageService.select_room_detail(room_num);
		List<String> tagList = mypageService.select_tag_by_room_num(room_num);
		
		m.addAttribute("room", room);
		m.addAttribute("tagList", tagList);
		
		return "/mypage/game/my_game_modify";
	}
	
	@RequestMapping("/game/room_delete")
	public String room_delete(Integer room_num) {
		
		mypageService.room_delete(room_num);
		
		return "redirect:/mypage/game/my_game_list";
	}
	
	public String getId() {
		Cookie[] cookies = req.getCookies();
	    String jwtToken = null;
	      
	    if (cookies != null) {
	    	for (Cookie cookie : cookies) {
	    		if (cookie.getName().equals("access_token")) {
	    			jwtToken = cookie.getValue();
	                break;
	            }
	        }
	    }
	        
	    Claims claims = mainService.getClaims(jwtToken);
	    String id = claims.get("id", String.class);
	    
	    return id;
	}
	
	public static String getRealPath(String resourcePath) {
        try {
            ClassPathResource classPathResource = new ClassPathResource(resourcePath);
            Path path = Paths.get(classPathResource.getURI());
            return path.toString();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
	
	@RequestMapping("/game/room_modify")
	@Transactional
	public String room_modify(ChatingDTO room, String hashtag, MultipartFile room_img) {
		
	    String id = this.getId();
	    room.setId(id);
		
		System.out.println(room);
		System.out.println(hashtag);
		System.out.println(room_img);
		
		// 관전허용이 null로 넘어올 경우(체크박스를 건들지않고 submit 한 경우)
		if(room.getWatching()==null) {
			room.setWatching(1);
		}
		
		Integer room_num = room.getRoom_num();
		
		mypageService.room_modify(room);
		
		// 기존 이미지 경로 얻어오기
		String pre_img_path = mypageService.selectImgPathByRoomNum(room_num);
		
		System.out.println(room_num);
		System.out.println(pre_img_path);
		// 기존 이미지 db에서 제거
		mypageService.delete_room_img(room_num);
		
		if(!room_img.isEmpty()) {
			ImageDTO img = new ImageDTO();
			
			img.setRoom_num(room_num);
			
			img.setOrigin_img_name(room_img.getOriginalFilename());
			img.setImg_size(room_img.getSize());
			
			Long time = System.currentTimeMillis();
			
			String path = "/files/room_img/" + time + "_" + img.getOrigin_img_name();
			String realPath = getRealPath("static/files/room_img/")+"\\"+ time + "_" + img.getOrigin_img_name();
			
			img.setPath(path);
			
	        System.out.println(realPath);
			System.out.println(path);
			
			File serverFile = new File(realPath); // 저장할 파일의 경로를 생성합니다.

			try {
				// 기존 이미지 삭제
				Path absolutePath = Paths.get(pre_img_path).toAbsolutePath();
				Files.deleteIfExists(absolutePath);
				
				// MultipartFile의 transferTo 메서드를 이용하여 파일을 저장.
				room_img.transferTo(serverFile);
				
				// 저장된 파일정보를 DB에 저장
				gameService.room_img_insert(img);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// 기존의 태그 db에서 삭제
		mypageService.delete_room_tag(room_num);
		
		if(!hashtag.equals("")) {
			String[] tag_contents = hashtag.split(",");
			for(String tag_content : tag_contents) {
				TagDTO tag = new TagDTO();
				tag.setTag_content(tag_content);
				tag.setRoom_num(room_num);
				
				gameService.tag_insert(tag);
			}
		}
		
		return "redirect:/mypage/game/my_game_list";
	}
	
		
//=========== END of 게임관리 ========================================================================================================

	
	
	
	
//=========== START of 회원정보 ======================================================================================================	
//아이디 가져가기
	@RequestMapping("/user_info/info_modify")
	public String info_modify(MemberDTO memberDTO,Model m) {
		
		String id = myId_is_in_cookies();    
	    memberDTO.setId(id);
	    m.addAttribute("memberDTO", memberDTO);

	    
		return "/mypage/user_info/info_modify";
	}

//마이페이지/회원정보 접속 시 패스워드 체크 
	@RequestMapping("/user_info/mypage_password_check")
	@ResponseBody
	public Boolean mypage_password_check(MemberDTO member) {
		Boolean result = mypageService.mypage_password_check(member);
		return result;
	}
	
	
	
//회원정보리스트 불러오기
	@RequestMapping("/user_info/find_info")
	@ResponseBody
	public Map find_info(MemberDTO member) {
		
		Map result = new HashMap();
		//서비스에서 맵으로 회원정보 받아오기
		Map vo = mypageService.find_info(member);
		// result에 서비스에서 받아온 맵 넣기
		result.putAll(vo);
		
		return result;
	}
	
	@RequestMapping("/user_info/find_playlist")
	@ResponseBody
	public ArrayList<HashMap> find_playlist(MemberDTO member) {
		
	//id기반으로 플레이 리스트 가져오기
	List<Integer> room = mypageService.my_playlist(member);
	ArrayList<HashMap> gamelist = new ArrayList(); 
		for(Integer num : room) {
			HashMap gameinfo = mypageService.find_gamename(num);
			gamelist.add(gameinfo);
		}
		
	return gamelist;
	}		
//프로필 이미지 불러오기
	@RequestMapping("/user_info/find_info_img")
	@ResponseBody
	public String find_info_img(MemberDTO member) { // 페이지 이동(DB접속없는경우)
		
		//이미지 path값 String result에 가져오기
		String result = mypageService.find_info_img(member);
			
			//result가 null이면 이미지없음 이미지 result에 넣기
			if(result == null) {
				result = "/files/images/no_image.jpg";
			}
		return result;
	}
	
	
	
//회원정보 수정
	@RequestMapping("/user_info/modify_info")
	@ResponseBody
	public void modify_info(MemberDTO member) {
		//수정된 회원정보 MemberDTO에 담아서 DB에 저장
		mypageService.modify_info(member);
	}
	
	
	
//프로필 이미지 DB저장
	@RequestMapping("/user_info/modify_info_img")
	@ResponseBody
	public Boolean modify_info_img(MultipartFile file, MemberDTO member) {

		//파일 첨부 안됬을때
		try {
			if (file == null || file.isEmpty()) {
	            System.out.println("파일이 첨부안됫음");
	            return false;
	        }			
			
			//스트링 originFilename에 파일 오리진네임 가져와서 넣기
			String originFilename = file.getOriginalFilename();
			
			//originFilename이 널이 아니면 
			if(originFilename != null && !originFilename.equals("")) {
				System.out.println("파일첨부 있음");
				
				//*MD5 해시는 임의의 데이터를 고정된 길이의 128비트 해시 값으로 변환하는 알고리즘
				//해당 파일 이름에 대한 MD5 해시가 계산 후 toString으로 문자열로 변환
				String filename = new MD5Generator(originFilename).toString();
				
				//현재 작업 디렉토리를 기준으로 파일 저장 경로를 지정
				String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\files\\images\\mypage\\info_profile";
				
				//폴더 없으면 폴더 생성
				if(!new File(savePath).exists()) {
					new File(savePath).mkdir();
				}
				
				//파일경로 + 파일 이미지합치기
				String filepath = savePath + "\\" +filename;
				//String path ="https://localhost:8080/files/images/mypage/info_profile/" +filename;
//나중에 최종때 변경
				String path ="/files/images/mypage/info_profile/" +filename;
				//fillpath = "기본폴더"\files\zxxxxxxxxxxxxxxxxxxxxxx.png
				
				//업로드된 파일을 지정된 파일 경로로 이동
				file.transferTo(new File(filepath));
				
				//ImageDTO에 originFilename, filepath 주입
				ImageDTO fo = new ImageDTO();
				fo.setOrigin_img_name(originFilename);
				fo.setPath(filepath);
				
				//해쉬맵에 originFilename, filepath, id 주입
				HashMap map= new HashMap();
				map.put("originFilename", originFilename);
				map.put("filepath", path);
				map.put("id", member.getId());
							
				//서비스에  originFilename, filepath, id 보내고 반환값으로 성공여부 받기
				Integer result = mypageService.modify_info_img(map);
				
				//성공이면 True 반환
				if (result == 1) {
					return true;
					}
			}
		
		//오류 시 실패 출력
		}catch (Exception e) {
			System.out.println("★modify_info_img 실패"+e.getMessage());
		}
	return false;
	}	

	
	
//=========== END of 회원정보 ======================================================================================================	

	
//=========== START of 나의게시글 ======================================================================================================	
	
//전체 게시글 받아오기
	@RequestMapping("/my_post")
	public void my_post(PostDTO post, Model m, String subject){
		String id = myId_is_in_cookies();

		//postDTO에 id값 입력
		post.setId(id);											
		
		//받아온 게시물 목록 모델에 담아서 보내기
		ArrayList<HashMap> list = mypageService.my_post(post);		
		m.addAttribute("list",list);		
	}
		
//말머리기준 게시글 받아오기
	@RequestMapping("/my_post2")
	@ResponseBody
	public ArrayList<HashMap> my_post(PostDTO post, String subject){
		String id = myId_is_in_cookies();
		post.setId(id);									
		//리스트에 담아서 리턴
		ArrayList<HashMap> list = mypageService.my_post2(post);
		return list;
	}

//postnum(여러개일 수 있음)받아서 삭제하기(삭제==게시중단)
	@RequestMapping("/delete_posts")
	@ResponseBody
	public String deletePosts(@RequestParam(value = "postNums[]") List<String> postNums) {
	    // postNums 배열에 있는 post_num들을 사용하여 삭제 로직을 구현 
		for (String i : postNums) {
	    mypageService.deletePosts(i);
		}
	    return "success"; // 삭제가 성공적으로 이루어졌을 때 "success"를 반환
	}
//=========== END of 나의게시글 ========================================================================================================
//=========== START of 나의 문의사항 ======================================================================================================	
//나의 문의사항 목록 받아서 출력
	@RequestMapping("/my_question")
	   public String find_question(QuestionDTO question, Model m){

		String id = myId_is_in_cookies();
	             
		//questionDTO에 id 붙힘
		question.setId(id);
     
		List<QuestionDTO> quest = mypageService.find_question(question); 
     
		m.addAttribute("list", quest); 
       
		return "/mypage/my_question";
	   }

//=========== END of 나의 문의사항 ========================================================================================================
//=========== START of 친구관리 ======================================================================================================	

//친구관리로 이동 시 친구목록 가져가기 + 내 아이디에서 검색허용여부 가지고 가기
	@RequestMapping("/friends")
	public void friend(Model m){
		String id = myId_is_in_cookies();
		List<FriendDTO> list = mypageService.friend(id);
		MemberDTO member = mypageService.checked(id);
		m.addAttribute("list", list);
		m.addAttribute("member",member);
	}
	
	
	
//id 가지고와서 아이디, 닉네임, 이름 중에 겹치는거 있는지 검색
	@RequestMapping("/search_friend_id")
	@ResponseBody
	public List<MemberDTO> search_friend_id(String id){		
		List<MemberDTO> list = mypageService.search_friend_id(id);
		return list;
	}

	
	
//검색허용 바꼈을 시 DB저장
	@RequestMapping("/dist_search0")
	public String dist_search0(){
		String id = myId_is_in_cookies();
		mypageService.dist_search0(id);
		return "redirect:/mypage/friends";
	}
	@RequestMapping("/dist_search1")
	public String dist_search1() {
		String id = myId_is_in_cookies();
		mypageService.dist_search1(id);
		return "redirect:/mypage/friends";
	}
	@RequestMapping("/name_search0")
	public String name_search0() {
		String id = myId_is_in_cookies();
		mypageService.name_search0(id);
		return "redirect:/mypage/friends";
	}
	@RequestMapping("/name_search1")
	public String name_search1() {
		String id = myId_is_in_cookies();
		mypageService.name_search1(id);
		return "redirect:/mypage/friends";
	}
	
	
	
//친구 프로필정보 가져오기 + 친구 프로필 사진 가져오기
	@RequestMapping("/friend_profile")
	public String friend_profile(String id,Model m){
		MemberDTO friend = mypageService.friend_profile(id);

		//이미지 path값 String result에 가져오기
		String result = mypageService.friend_img(id);
			
		//result가 null이면 이미지없음 이미지 result에 넣기
		if(result == null) {
			result = "/files/images/no_image.jpg";
		}

		//모델에 메세지 담기
		m.addAttribute("friend", friend);
		m.addAttribute("friend_img", result);
		
		return "/mypage/friend_profile";
	}
	
	
	
//친구추가하기
	@RequestMapping("/make_friend")
	public void make_friend(String friend_id,FriendDTO friend){
		String id = myId_is_in_cookies();
		friend.setFriend_id(friend_id);
		friend.setMy_id(id);
		mypageService.make_friend(friend);
	}
	
	
//친구 삭제	
	@RequestMapping("/no_friend")
	public String no_friend(String friend_id,FriendDTO friend){
		String id = myId_is_in_cookies();
		friend.setFriend_id(friend_id);
		friend.setMy_id(id);
		mypageService.no_friend(friend);
		return "redirect:/mypage/friends";
	}
	
	

//친구 플레이리스트 방넘버 가져오기 + 방넘버 기준으로 방 정보 가져오기
	@RequestMapping("/friend_playlist")
	public String friend_playlist(String id, Model m){
		List<Integer> room = mypageService.friend_playlist(id);
		
		ArrayList<HashMap> gamelist = new ArrayList(); 
		for(Integer num : room) {
			HashMap gameinfo = mypageService.find_gamename(num);
			gamelist.add(gameinfo);
		}
		m.addAttribute("gamelist",gamelist);
		return "/mypage/playlist";
	}
	
	
//=========== END of 친구관리 ========================================================================================================
//=========== START of 결제내역 ======================================================================================================	
	@RequestMapping("/my_purchase")
	public String my_purchase(Model m){
		String id = myId_is_in_cookies();
		
		//마지막 구독권 종료일 가져와서 넣기
		String end = mypageService.my_purchase(id);
		if(end==null) {end = "0";}
		m.addAttribute("end",end);
		
		//결제내역 가져오기
		List<HashMap> list = mypageService.my_purchase2(id);
		for(HashMap map: list) {
			System.out.println("title:  "+map.get("title") );
			System.out.println("path:  "+map.get("path") );
			System.out.println("state:  "+map.get("state") );
		}
		System.out.println(list);
		m.addAttribute("list", list);
		
		return "/mypage/my_purchase";
	}
	
//=========== END of 결제내역 ========================================================================================================
	
	
//쿠키기준으로 아이디값 받기
   public String myId_is_in_cookies(){

	   //쿠키 배열에 요청 받은 쿠키 담음
       Cookie[] cookies = request.getCookies();
       String jwtToken = null;
         
       // 쿠키가 null이 아니라면
       if (cookies != null) {
    	   // 반복문 구동
    	   for (Cookie cookie : cookies) {
    		   //쿠키 이름이 access_token이랑 같으면
    		   if (cookie.getName().equals("access_token")) {
    			   //토큰에 쿠키의 값 넣음
    			   jwtToken = cookie.getValue();
    			   break;
    		   }
    	   }
       }
         
       Claims claims = mainService.getClaims(jwtToken);
       String id = claims.get("id", String.class);
       return id;
   }
	
	

 //=========== START of 캐릭터시트리스트 ======================================================================================================	

 //받아온 게임방번호로 참가요청한 캐릭터 시트정보를 리스트로 띄우기
   @RequestMapping("/game/char_sheet_list")
	public String char_sheet_list(@RequestParam Integer room_num, Model m) {	
		//채팅방 번호로 참가번호가져옴 
		ArrayList<Integer> join_num_list= mypageService.char_sheet_list(room_num);
		
		//참가번호(여러개)를 보내서 해당 참가번호의 정보를 map(캐릭터 아이디 성향 직업 종족 아이디)에 담고 
		ArrayList<HashMap> joinlist = new ArrayList(); 
		for(Integer list : join_num_list) {
			HashMap joininfo = mypageService.find_joininfo(list);
			//받아서 해시맵 리스트(joinlist)에 추가하고 모델에 담아줌 
			joinlist.add(joininfo);
		}
		m.addAttribute("join",joinlist);
		return "mypage/game/char_sheet_list";
	}
   
   
   
   
   //받아온 게임방번호로 참가요청한 캐릭터 시트정보를 리스트로 띄우기
   @RequestMapping("/game/char_sheet_confirm")
	public String char_sheet_confirm(@RequestParam Integer join_num, Model m) {	
	   	//참가번호로 캐릭터 시트 내용 가져오기
	   	HashMap sheet = mypageService.char_sheet_confirm(join_num);
		m.addAttribute("sheet",sheet);
		
		//보낼PK값들을 Interger로 변환해서 변수에 넣고 보냄
		Integer sheet_num = (Integer) sheet.get("sheet_num");
		Integer inventory_num = (Integer) sheet.get("inventory_num");
		
		//시트넘버로 스킬리스트 가져옴
		ArrayList<HashMap> skills = mypageService.skills(sheet_num);
		m.addAttribute("skills",skills);
	
		//인벤토리넘버로 아이템 리스트 가져옴
		ArrayList<HashMap> items = mypageService.items(inventory_num);
		m.addAttribute("items",items);
		//etc 분할
		String str = (String)sheet.get("char_etc");
		
		//etc 별 쪼개기
		String[] word = str.split("\n");
		String word1 = word[0]; //인격특성 : ---
		String word2 = word[1]; //이상 : ---
		String word3 = word[2]; //유대 : ---
		String word4 = word[3]; //단점 : ---
		
		//필요없는부분 분리
		String[] etc1_1 = word1.split(" : ");
		String[] etc2_1 = word2.split(" : ");
		String[] etc3_1 = word3.split(" : ");
		String[] etc4_1 = word4.split(" : ");

		//내용만 남음
		String etc1_2 = etc1_1[1];
		String etc2_2 = etc2_1[1];
		String etc3_2 = etc3_1[1];
		String etc4_2 = etc4_1[1];

		
		//개행 삭제
		String etc1 = etc1_2.replace("\r", "");
		String etc2 = etc2_2.replace("\r", "");
		String etc3 = etc3_2.replace("\r", "");
		String etc4 = etc4_2.replace("\r", "");

		
		HashMap etc = new HashMap();
		etc.put("etc1", etc1);
		etc.put("etc2", etc2);
		etc.put("etc3", etc3);
		etc.put("etc4", etc4);
		
		m.addAttribute("etc" ,etc);
		
	return "mypage/game/char_sheet_confirm";
	}
   
//동료영입
   @RequestMapping("/game/agree_brother")
   public String agree_brother(Integer join_num, Integer room_num){
	   
	    mypageService.agree_brother(join_num);
	    mypageService.inc_curr_member(room_num);
	    
	   return "redirect:/mypage/game/my_game_list";
   }
 //=========== END of 캐릭터시트리스트 =======================================================================================================	
	
	
	
}


package project.gulim.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.MessageDTO;
import project.gulim.domain.QuestionDTO;
import project.gulim.service.MainService;
import project.gulim.service.MypageService;
import project.gulim.util.MD5Generator;

@Controller
@RequestMapping("/mypage")
public class MypageContoroller {
	
	@Autowired
	MypageService mypageService;
	
	@Autowired
	   private MainService mainService;

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) { // 페이지 이동(DB접속없는경우)
		return "mypage/"+step;
	}
	@RequestMapping("/game/my_game_list")
	public String viewPage2() { // 페이지 이동(DB접속없는경우)
		return "/mypage/game/my_game_list";
	}
	@RequestMapping("/game/chat_room")
	public String chat_room() { // 페이지 이동(DB접속없는경우)
		return "/mypage/game/chat_room";
	}

//=========== START of 쪽지 ======================================================================================================	

//id기준으로 쪽지목록 불러오기
	@RequestMapping("/my_message")
	@Transactional
	public String my_message(MemberDTO memberDTO,HttpServletRequest request, Model m) {
		
		//쿠키에서 아이디 얻어오기
		Cookie[] cookies = request.getCookies();
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
		System.out.println(nickname2);
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
	public String save_message(MemberDTO memberDTO,HttpServletRequest request,
								@RequestParam ("message_title") String message_title, 
								@RequestParam("receive_id") String receive_id, 
								@RequestParam("message_content") String message_content){
		
		
		//쿠키에서 아이디 얻어오기
		Cookie[] cookies = request.getCookies();
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
	    String send_id = claims.get("id", String.class);  	    

		
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
	@RequestMapping("/select_evt")
	@ResponseBody 
	public void select_evt(String calender_date, String calender_title,String calender_content
							,CalenderDTO calenderDTO,HttpServletRequest request, Model m) {
	System.out.println(calender_date+calender_title+calender_content);
	
	
	//쿠키에서 아이디 얻어오기
	Cookie[] cookies = request.getCookies();
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
   // String id = claims.get("id", String.class);    ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
    
    
    
    String id = "ekqls1102";
    calenderDTO.setId(id);
    calenderDTO.setCalender_date(calender_date);
    calenderDTO.setCalender_title(calender_title);
    calenderDTO.setCalender_content(calender_content);
    
    Integer result = mypageService.select_evt(calenderDTO);
    
    m.addAttribute("calenderDTO", calenderDTO);
}
	
	@RequestMapping("/calender")
	public String find_evt(CalenderDTO calenderDTO, Model m) {
		String id = "ekqls1102";
		System.out.println(calenderDTO);
		List<CalenderDTO> list = mypageService.find_evt(id);
		List<HashMap> result = new ArrayList<HashMap>();
		
		for(CalenderDTO c : list) {
			HashMap map = new HashMap();
			map.put("start", c.getCalender_date());
			map.put("title", c.getCalender_title());
			map.put("description", c.getCalender_content());
			result.add(map);
		}
		
		
		m.addAttribute("evt", result);
		
		
		
		return "/mypage/calender";
	}
	
	//마이페이지/회원정보 접속 시 패스워드 체크 
	@RequestMapping("/mypage_password_check_calender")
	@ResponseBody
	public Boolean mypage_password_check_calender(MemberDTO memberDTO,HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
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
	    memberDTO.setId(id);
	    
		Boolean result = mypageService.mypage_password_check(memberDTO);
		return result;
	}
	
	@RequestMapping("/delete_evt")
	public String delete_evt(CalenderDTO calender, Model m) {
		//글넘버 가지고 서비스단으로 이동해서 해당 메세지데이터 가져오기
		Integer result = mypageService.delete_evt(calender);
		return "redirect:/mypage/my_message";
	}

//=========== END of 캘린더 ========================================================================================================
//=========== START of 게임관리 ======================================================================================================	
//=========== END of 게임관리 ========================================================================================================

	
	
	
	
//=========== START of 회원정보 ======================================================================================================	
//아디디 가져가기
	@RequestMapping("/user_info/info_modify")
	public String info_modify(MemberDTO memberDTO,HttpServletRequest request,Model m) {
		
		Cookie[] cookies = request.getCookies();
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
				String path ="https://localhost:8080/files/images/mypage/info_profile/" +filename;
//나중에 최종때 변경
				//String filepath ="https://192.168.0.68:8080/files/images/mypage/info_profile/" +filename;
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
//=========== END of 나의게시글 ========================================================================================================
//=========== START of 나의 문의사항 ======================================================================================================	
	@RequestMapping("/my_question")
	   public String find_question(QuestionDTO question, Model m,HttpServletRequest request){

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
	             
	             //questionDTO에 id 붙힘
	             question.setId(id);
	             
	            List<QuestionDTO> quest = mypageService.find_question(question); 
	             
	             m.addAttribute("list", quest); 
	               
	            return "/mypage/my_question";
	   }

//=========== END of 나의 문의사항 ========================================================================================================
//=========== START of 친구관리 ======================================================================================================	
//=========== END of 친구관리 ========================================================================================================
//=========== START of 게임관리 ======================================================================================================	
//=========== END of 게임관리 ========================================================================================================
//=========== START of 결제내역 ======================================================================================================	
//=========== END of 결제내역 ========================================================================================================
//=========== START of 공모전 ======================================================================================================	
//=========== END of 공모전 =======================================================================================================
	
	
	
	
	
	
	
	
	
	
	
	
	
}


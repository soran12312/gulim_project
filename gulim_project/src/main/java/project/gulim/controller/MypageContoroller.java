package project.gulim.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.service.MypageService;
import project.gulim.util.MD5Generator;

@Controller
@RequestMapping("/mypage")
public class MypageContoroller {
	
	@Autowired
	MypageService mypageService;

	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) { // 페이지 이동(DB접속없는경우)
		return "/mypage/"+step;
	}
	@RequestMapping("/game/my_game_list")
	public String viewPage2() { // 페이지 이동(DB접속없는경우)
		return "/mypage/game/my_game_list";
	}
	@RequestMapping("/user_info/info_modify")
	public String viewPage3() { // 페이지 이동(DB접속없는경우)
		return "/mypage/user_info/info_modify";
	}
	

	@RequestMapping("/my_message")
	public String my_message() {
		
		return "/mypage/my_message";
	}
	
	//마이페이지/회원정보 접속 시 패스워드 체크 
	@RequestMapping("/user_info/mypage_password_check")
	@ResponseBody
	public Boolean mypage_password_check(MemberDTO member) { // 페이지 이동(DB접속없는경우)
		Boolean result = mypageService.mypage_password_check(member);

		return result;
	}
	
	@RequestMapping("/user_info/find_info")
	@ResponseBody
	public Map find_info(MemberDTO member) { // 페이지 이동(DB접속없는경우)
		Map result = new HashMap();
		
		Map vo = mypageService.find_info(member);
		result.putAll(vo);
		
		return result;
	}
	
	@RequestMapping("/user_info/modify_info")
	@ResponseBody
	public void modify_info(MemberDTO member) {
		mypageService.modify_info(member);
	}
	
	
	@RequestMapping("/user_info/modify_info_img")
	@ResponseBody
	public Boolean modify_info_img(MultipartFile file, MemberDTO member,Model m) {
		System.out.println("컨트롤러로 넘어가긴했니?");
		
		try {
			if (file == null || file.isEmpty()) {
	            System.out.println("파일이 첨부안됫음");
	        }			
			
			String originFilename = file.getOriginalFilename();
			if(originFilename != null && !originFilename.equals("")) {
				System.out.println("파일첨부 있음");
				String filename = new MD5Generator(originFilename).toString();
				
				String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\files\\images\\mypage\\info_profile";
				
				
				if(!new File(savePath).exists()) {
					new File(savePath).mkdir();
				}
				
				String filepath = savePath + "\\" +filename;
				//fillpath = "기본폴더"\files\zxxxxxxxxxxxxxxxxxxxxxx.png
				
				file.transferTo(new File(filepath));
				
				ImageDTO fo = new ImageDTO();
				fo.setOrigin_img_name(originFilename);
				fo.setPath(filepath);
				
				HashMap map= new HashMap();
				map.put("originFilename", originFilename);
				map.put("filepath", filepath);
				map.put("id", member.getId());
				
				System.out.println("originFilename" +originFilename +"filepath" +filepath);
				
				
				Integer result = mypageService.modify_info_img(map);
				if (result == 1) {
					m.addAttribute("originFilename", originFilename);
					m.addAttribute("filepath", filepath);
					m.addAttribute("id", member.getId());
					System.out.println(originFilename+"\n"+filepath+"\n");
					return true;
					}
			}
		
		}catch (Exception e) {
			System.out.println("★modify_info_img 실패"+e.getMessage());
		}
	return false;
	}	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}


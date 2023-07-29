package project.gulim.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import io.jsonwebtoken.Claims;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import lombok.Data;

import java.io.File;
import java.io.IOException;

import project.gulim.domain.CharacterSheetDTO;
import project.gulim.domain.ChatingDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.InventoryDTO;
import project.gulim.domain.ItemDTO;
import project.gulim.domain.JoinDTO;
import project.gulim.domain.SkillDTO;
import project.gulim.domain.SupportImgBoardDTO;
import project.gulim.domain.TagDTO;
import project.gulim.service.GameService;
import project.gulim.service.MainService;
import project.gulim.util.MD5Generator;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@Controller
@RequestMapping("/game")
public class GameController {
	
	@Autowired
    private ServletContext servletContext;
	
	@Autowired
	private GameService gameService;
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private HttpServletRequest req;
	
	private final ResourceLoader resourceLoader;
	
	@Autowired
    public GameController(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }

	@RequestMapping("/play/room_create")
	public String room_create() {
		
		return "/game/play/room_create";
	}
	
	@RequestMapping("/play/getList")
	@ResponseBody
	public List<Map> getList() {
		
		List<Map> list = gameService.select_room_list();
		
		for(Map room : list) {
			List<String> tag_contents = gameService.select_tag_by_room_num((Integer)room.get("room_num"));
			String nickname = gameService.select_nickname_by_id((String)room.get("id"));
			
			room.put("tag_contents", tag_contents);
			room.put("nickname", nickname);
		}
		
		return list;
	}
	
	@RequestMapping("/play/char_sheet_form")
	public String char_sheet_form(Integer room_num, Model m) {
		
		m.addAttribute("room_num", room_num);
		
		return "/game/play/char_sheet_form";
	}
	
	@RequestMapping("/play/insertJoin")
	@Transactional
	public String insertJoin(CharacterSheetDTO c, @ModelAttribute SkillDTOList skillListWrapper, JoinDTO j, @ModelAttribute ItemDTOList itemListWrapper, InventoryDTO i) {

	    List<SkillDTO> skillList = skillListWrapper.getSkills();
	    List<ItemDTO> itemList = itemListWrapper.getItems();

	    System.out.println("CharacterSheetDTO"+c);
	    System.out.println("SkillDTO"+skillList);
	    System.out.println("JoinDTO"+j);
	    System.out.println("ItemDTO"+itemList);
	    System.out.println("InventoryDTO"+i);
	    
	    String id = this.getId();
	    
	    j.setId(id);
	    
	    Integer join_num = gameService.insert_join(j);
	    
	    c.setJoin_num(join_num);
	    i.setJoin_num(join_num);
	    
	    Integer sheet_num = gameService.insert_sheet(c);
	    Integer inventory_num = gameService.insert_inventory(i);
	    
	    for(SkillDTO skill : skillList) {
	    	skill.setSheet_num(sheet_num);
	    	
	    	if(!(skill.getSkill_name().equals("") && skill.getSkill_detail().equals(""))) {
	    		gameService.insert_skill(skill);
	    	}
	    }
	    
	    for(ItemDTO item : itemList) {
	    	item.setInventory_num(inventory_num);
	    	
	    	if(!(item.getItem_name().equals("") && item.getItem_detail().equals(""))) {
	    		gameService.insert_item(item);
	    	}
	    	
	    }

	    return "/game/play/room_list";
	}
	
	@Data
	public static class SkillDTOList {
        private List<SkillDTO> skills;
        
        public SkillDTOList() {
            this.skills = new ArrayList<>();
        }
    }

	@Data
    public static class ItemDTOList {
        private List<ItemDTO> items;
        
        public ItemDTOList() {
            this.items = new ArrayList<>();
        }
    }
	
	@RequestMapping("/play/room_detail")
	public String room_detail(Integer room_num, Model m) {
		//System.out.println(room_num);
		String id = this.getId();
		
		Map room = gameService.select_room_detail(room_num);
		String path = gameService.select_room_img(room_num);
		if(path != null) {
			room.put("room_img", path);
		}
		// 유저가 해당 방에 참가 했는지
		JoinDTO join = new JoinDTO();
		join.setId(id);
		join.setRoom_num(room_num);
		
		List<Integer> join_nums = gameService.select_join(join);
		
		if(id.equals((String)room.get("id"))) {
			room.put("join", 0);
		}
		
		if(join_nums.size()>0) {
			room.put("join", 0);
		}
		
		m.addAttribute("room", room);
		
		return "/game/play/room_detail";
	}
	
	@RequestMapping("/play/room_list")
	public String room_list() {
		
		return "/game/play/room_list";
	}
	
	@RequestMapping("/play/room_insert")
	@Transactional
	public String room_insert(ChatingDTO room, String hashtag, MultipartFile room_img) {
		
	    String id = this.getId();
	    room.setId(id);
		
		System.out.println(room);
		System.out.println(hashtag);
		System.out.println(room_img);
		
		// 관전허용이 null로 넘어올 경우(체크박스를 건들지않고 submit 한 경우)
		if(room.getWatching()==null) {
			room.setWatching(1);
		}
		
		Integer room_num = gameService.room_insert(room);
		
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
				// MultipartFile의 transferTo 메서드를 이용하여 파일을 저장.
				room_img.transferTo(serverFile);
				
				// 저장된 파일정보를 DB에 저장
				gameService.room_img_insert(img);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(!hashtag.equals("")) {
			String[] tag_contents = hashtag.split(",");
			for(String tag_content : tag_contents) {
				TagDTO tag = new TagDTO();
				tag.setTag_content(tag_content);
				tag.setRoom_num(room_num);
				
				gameService.tag_insert(tag);
			}
		}
		
		return "/game/play/room_list";
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
	@RequestMapping("/support/map_create")
	public String map_create() {
		return "/game/support/map_create";
	}
	
	
	
	@RequestMapping("/support/data")
	@ResponseBody
	public List<HashMap> support_data() {
		System.out.println("리스트 호출");
		List<HashMap> lists = gameService.support_data();
		System.out.println(lists);
		return lists;
	}
	
	
	
	@RequestMapping("/support/etc2")
	@ResponseBody
	public Boolean etc(MultipartFile file, SupportImgBoardDTO dto) {
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
						String savePath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\files\\images\\support";
						
						//폴더 없으면 폴더 생성
						if(!new File(savePath).exists()) {
							new File(savePath).mkdir();
						}
						
						//파일경로 + 파일 이미지합치기
						String filepath = savePath + "\\" +filename;
						String path ="/support_img/" +filename;
		//나중에 최종때 변경
						//String filepath ="https://192.168.0.68:8080/files/images/mypage/info_profile/" +filename;
						//fillpath = "기본폴더"\files\zxxxxxxxxxxxxxxxxxxxxxx.png
						
						//업로드된 파일을 지정된 파일 경로로 이동
						file.transferTo(new File(filepath));
						
						//ImageDTO에 originFilename, filepath 주입
						ImageDTO fo = new ImageDTO();
						fo.setOrigin_img_name(originFilename);
						fo.setPath(filepath);

						Integer datanum = gameService.etc2(dto);					
						
						//해쉬맵에 originFilename, filepath, id 주입
						HashMap map= new HashMap();
						map.put("originFilename", originFilename);
						map.put("filepath", path);
						map.put("s_img_num", datanum);
						System.out.println(map);
						//서비스에  originFilename, filepath, id 보내고 반환값으로 성공여부 받기
						Integer result = gameService.etc(map);
						
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
	
	@RequestMapping("/support/etc")
	public String etc3() {
		return "/game/support/etc";
	}
}

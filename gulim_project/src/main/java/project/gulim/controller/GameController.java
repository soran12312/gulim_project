package project.gulim.controller;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import io.jsonwebtoken.Claims;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.IOException;
import project.gulim.domain.ChatingDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.TagDTO;
import project.gulim.service.GameService;
import project.gulim.service.MainService;

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
	
	@RequestMapping("/play/room_list")
	public String room_list() {
		
		return "/game/play/room_list";
	}
	
	@RequestMapping("/play/room_insert")
	@Transactional
	public String room_insert(ChatingDTO room, String hashtag, MultipartFile room_img) {
		
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
		
		if(hashtag != null) {
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
	
	
}

package project.gulim.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import io.jsonwebtoken.Claims;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.PostDTO;
import project.gulim.service.CommunityService;
import project.gulim.service.MainService;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/community")
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private ServletContext servletContext;
	
	// 자유게시판 입력페이지
	@RequestMapping(value = "/free_board_insert")
	public String free(PostDTO params) {
	    
		return "community/free_board/free_board_insert";		
	}
	
	
	
	// 자유게시판 글 입력
	@RequestMapping(value = "/freeinsert", method = RequestMethod.POST)
	public String insert(PostDTO params, ImageDTO image ,Model m) { 
		
		Cookie[] cookies = request.getCookies();
		String jwtToken = null;
		
		
		// 이미지 등록 여부 확인
	    String postContent = params.getPost_content();
	    
	    
	    // post_content 값에서 base64 인코딩된 이미지 값을 추출
	    List<String> imageBase64List = extractBase64Image(postContent);

	    // 추출한 이미지 값을 활용하여 필요한 작업 수행
	    if (!imageBase64List.isEmpty()) {
	        // 이미지가 포함된 경우
	        for (String imageBase64 : imageBase64List) {
	            // 이미지 처리 로직
	            // ...
	        	System.out.println(imageBase64);
	        	// base64 디코딩
	            byte[] imageData = Base64.getDecoder().decode(imageBase64);

	            // 이미지 파일의 원래 이름, 저장 경로, 크기 추출
	            String originImageName = generateUniqueFileName();
	            String imagePath = "/images/gulim/";
	            int imageSize = imageData.length;

	            // 이미지 파일 저장
	            saveImageFile(imageData, imagePath, originImageName);

	            // 이미지 정보 설정
	            ImageDTO img = new ImageDTO();
	            img.setOrigin_img_name(originImageName);
	            img.setPath(imagePath);
	            img.setImg_size(imageSize);
	            
	            if (cookies != null) {
				    for (Cookie cookie : cookies) {
				        if (cookie.getName().equals("access_token")) {
				            jwtToken = cookie.getValue();
				            break;
				        }
				    }
				}
				
				Claims claims = mainService.getClaims(jwtToken);
				
//				System.out.println(claims);
				String id = claims.get("id", String.class);      // 로그인한 사용자 id
				params.setId(id);                                // 
				
				// post_content에서 이미지 태그를 제거하여 나머지 내용만 저장
			    String contentWithoutImages = removeImageTags(postContent);
			    params.setPost_content(contentWithoutImages);
				
				System.out.println(params); 
				
				// post  DB에 저장
			    communityService.savePost(params);
	            
	            
			    img.setId(id);

	            // 이미지 DB에 저장
	            communityService.saveImage(img);
	        }
	    } 
	    else {// 이미지가 포함되지 않은 경우
	    	if (cookies != null) {
			    for (Cookie cookie : cookies) {
			        if (cookie.getName().equals("access_token")) {
			            jwtToken = cookie.getValue();
			            break;
			        }
			    }
			}
			
			Claims claims = mainService.getClaims(jwtToken);
			
//			System.out.println(claims);
			String id = claims.get("id", String.class);      // 로그인한 사용자 id
			params.setId(id);                                // 
			
			System.out.println(params); 
			
			// db저장
		    communityService.savePost(params);
	    }
	    
	    return "redirect:/community/free_board_list";
	    
	}
	

	
	// 파일 이름을 고유하게 생성하는 메서드
	private String generateUniqueFileName() {
	    // 고유한 파일 이름 생성 로직 구현
	    // 예시: UUID를 활용하여 파일 이름 생성
	    return UUID.randomUUID().toString();
	}

	// 이미지 파일 저장 메서드
//	private void saveImageFile(byte[] imageData, String imagePath, String imageName) {
//	    // 이미지 파일 저장 로직 구현
//	    // 예시: 파일 시스템 경로에 이미지 파일 저장
//	    String filePath = imagePath + imageName + ".png";
//	    try (OutputStream outputStream = new FileOutputStream(filePath)) {
//	        outputStream.write(imageData);
//	    } catch (IOException e) {
//	        // 파일 저장 실패 시 예외 처리
//	        e.printStackTrace();
//	        e.getMessage();
//	    }
//	}
	
	
	// 이미지 파일 저장
//	private void saveImageFile(byte[] imageData, String imagePath, String fileName) {
//	    try {
//	        // 저장 경로가 없을 경우 디렉토리 생성
//	        File directory = new File(imagePath);
//	        if (!directory.exists()) {
//	            directory.mkdirs();
//	        }
//
//	        // 이미지 파일 생성
//	        File imageFile = new File(imagePath + fileName +".png");
//	        FileOutputStream fos = new FileOutputStream(imageFile);
//	        fos.write(imageData);
//	        fos.close();
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	    }
//	}
	
	
	// 이미지 파일 저장
	private void saveImageFile(byte[] imageData, String imagePath, String fileName) {
	    try {
	        // 서버 내 저장 경로
	        String serverPath = servletContext.getRealPath(imagePath);

	        // 저장 디렉토리 생성
	        File directory = new File(serverPath);
	        if (!directory.exists()) {
	            directory.mkdirs();
	        }

	        // 이미지 파일 생성
	        File imageFile = new File(serverPath + fileName + ".png");
	        FileOutputStream fos = new FileOutputStream(imageFile);
	        fos.write(imageData);
	        fos.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
	
	
	// 썸머노트 파라미터로 넘어간 내용에서 <img> 태그 제거
	private String removeImageTags(String content) {
	    return content.replaceAll("<img[^>]+>", "");
	}
	
	
	// base64 인코딩된 이미지 값을 추출
	private List<String> extractBase64Image(String content) {
	    List<String> base64Images = new ArrayList<>();

	    // <img> 태그의 base64 인코딩된 이미지 값을 추출
	    Pattern pattern = Pattern.compile("<img[^>]+src=\"data:image/[^>]+base64,([^\"]+)\"");
	    Matcher matcher = pattern.matcher(content);

	    while (matcher.find()) {
	        String base64Image = matcher.group(1);
	        base64Images.add(base64Image);
	    }

	    return base64Images;
	}
	
	
	
	

	// 자유게시판 글 목록
	@RequestMapping("/free_board_list")
	public String list(Model model,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "size", defaultValue = "10") int size) {

			// 전체 게시글 수 조회
			int totalCount = communityService.countAllPosts();
			
			// 페이징 처리를 위한 정보 계산
			int totalPages = (int) Math.ceil((double) totalCount / size);
			int start = (page - 1) * size;
			
			// 특정 페이지의 게시글 목록 조회
			List<PostDTO> posts = communityService.findPostsByPage(start, size);
			model.addAttribute("posts", posts);
			model.addAttribute("currentPage", page);
			model.addAttribute("totalPages", totalPages);
			
			return "community/free_board/free_board_list";
	}
	
	
	// 자유게시판 글 상세
	@RequestMapping("/free_board_detail")
	public String openPostView(@RequestParam("post_num") Integer post_num, Model model, ImageDTO image) {
		PostDTO post = communityService.findPostById(post_num);
        model.addAttribute("post", post);
        
        List<ImageDTO> images = communityService.findImagesByPostNum(post_num);
        System.out.println(images);
        model.addAttribute("images", images);
	     
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
		
//		System.out.println(claims);
		String loggedInUserId = claims.get("id", String.class);
		model.addAttribute("loggedInUserId", loggedInUserId);
		
		return "community/free_board/free_board_detail";
	}
	
	
	// 자유게시판 글 수정
	@RequestMapping(value = "/freeupdate", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("post") PostDTO params) {
		
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
		
//			System.out.println(claims);
		String id = claims.get("id", String.class);      // 로그인한 사용자 id
		params.setId(id);                                // 
		
		System.out.println(params); 
		
		// db update
	    communityService.updatePost(params);
	    
		
		 return "redirect:/community/free_board_list";
	}
	
	
	// 자유게시판 글 삭제
	@RequestMapping(value = "/freedelete", method = RequestMethod.POST)
	public String deletePost(@RequestParam("post_num") Integer post_num) {
		communityService.deletePost(post_num);
		
		
		 return "redirect:/community/free_board_list";
	}
	
	
	

	// 이벤트 글 목록
	@RequestMapping("/event_list")
	public String eventist(Model model) {
		List<PostDTO> events = communityService.findAllEvent();
		model.addAttribute("events", events);

		System.out.println(events);
		
		List<ImageDTO>eventimages =  communityService.findEventImg();
		model.addAttribute("eventimages", eventimages);
		
		System.out.println(eventimages);
		
		return "community/event/event_list";
	}

	// 이벤트 글 상세
	@RequestMapping("/event_detail")
	public String eventdetail(Model model,@RequestParam("post_num") int post_num) {
		
		// Retrieve the image and post content based on the postNum value
		PostDTO event = communityService.findPostById(post_num);
        List<ImageDTO> images = communityService.findImagesByPostNum(post_num);
        System.out.println(images);
        
	    
	    // Add the image and post content to the model for the view
	    model.addAttribute("images", images);
	    model.addAttribute("event", event);
		
		return "community/event/event_detail";
	}
	

	// 공모전 
	@RequestMapping("/contest_main")
	public String contest() {
		return "community/contest/contest_main";
	}
	
	
	// 공모전 리스트
	@RequestMapping("/contest_list")
	public String contestlist() {
		return "community/contest/contest_list";
	}
	
	
	// 공모전 상세
	@RequestMapping("/contest_detail")
	public String contestlistdetail() {
		return "community/contest/contest_list";
	}
	
	
	
}

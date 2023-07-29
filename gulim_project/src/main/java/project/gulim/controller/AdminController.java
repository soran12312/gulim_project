package project.gulim.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.apache.http.HttpHost;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.constant.Method;
import project.gulim.domain.BasketDTO;
import project.gulim.domain.BookDTO;
import project.gulim.domain.CharacterSheetDTO;
import project.gulim.domain.ContestDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.PlaceDTO;
import project.gulim.domain.PostDTO;
import project.gulim.domain.QuestionDTO;
import project.gulim.service.AdminService;
import project.gulim.service.MainService;
import project.gulim.util.UiUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private HttpServletRequest request;
	
	private final UiUtils uiUtils = new UiUtils();
	
	private static final String ES_HOST = "localhost";
    private static final int ES_PORT = 9200;
	
	// 문의사항 리스트 보기
	@RequestMapping("/question")
	public String viewPage_question(Model m) {
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}
		
		List<QuestionDTO> listQuestion = adminService.listQuestion();
		m.addAttribute("listQuestion", listQuestion);
		return "/admin/member/question";
	}

	// 문의사항 답변하기
	@ResponseBody
	@RequestMapping(value = "/question", method = RequestMethod.POST)
	public void answerQuestion(@RequestBody QuestionDTO qDTO) {
		adminService.answerQuestion(qDTO);
	}

	// 제재 리스트 보기
	@RequestMapping("/member_management")
	public String viewPage_member_management(Model m) { // 페이지 이동(DB접속없는경우)
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}
		
		List<MemberDTO> listMember = adminService.listMember();
		m.addAttribute("listMember", listMember);
		return "/admin/member/member_management";
	}

	// 제재 상태 변경
	@ResponseBody
	@RequestMapping(value = "/member_management", method = RequestMethod.POST)
	public void changeMemberState(@RequestBody MemberDTO mDTO) {
		adminService.changeMemberState(mDTO);
	}

	// 모임장소 리스트 보기
	@RequestMapping("/place_list")
	public String viewPage_place_list(Model m) {
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}
		
		List<PlaceDTO> listPlace = adminService.listPlace();
		m.addAttribute("listPlace", listPlace);
		return "/admin/place/place_list";
	}

	@RequestMapping("/sales_stats")
	public String viewPage_sales_stats(Model m) {
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}
		
		List<HashMap> salesStatsYear = adminService.salesStatsYear();
		m.addAttribute("salesStatsYear", salesStatsYear);
		List<HashMap> salesStatsYear_subs = adminService.salesStatsYear_subs();
		m.addAttribute("salesStatsYear_subs", salesStatsYear_subs);
		List<HashMap> salesStatsYear_book = adminService.salesStatsYear_book();
		m.addAttribute("salesStatsYear_book", salesStatsYear_book);
		List<HashMap> selectYear = adminService.selectYear();
		m.addAttribute("selectYear", selectYear);
		List<HashMap> selectYear_mon = adminService.selectYear_mon();
		m.addAttribute("selectYear_mon", selectYear_mon);
		
		return "/admin/sales/sales_stats";
	}
	
	@ResponseBody
    @RequestMapping(value = "/sales_stats/quarter", method = RequestMethod.POST)
    public List<HashMap> salesStats_quarter(@RequestBody String purchase_year_qua) {
		String year = purchase_year_qua.substring(purchase_year_qua.length() - 4);
		return adminService.salesStatsQuarter(year);
	}
	
	@ResponseBody
    @RequestMapping(value = "/sales_stats/month", method = RequestMethod.POST)
    public List<HashMap> salesStats_month(@RequestBody String purchase_year_mon) {
		String year = purchase_year_mon.substring(purchase_year_mon.length() - 4);
		return adminService.salesStatsMonth(year);
	}
	
	@ResponseBody
    @RequestMapping(value = "/sales_stats/month_sub", method = RequestMethod.POST)
    public List<HashMap> salesStats_month_subs(@RequestBody String purchase_year_mon) {
		String year = purchase_year_mon.substring(purchase_year_mon.length() - 4);
		return adminService.salesStatsMonth_subs(year);
	}
	
	@ResponseBody
    @RequestMapping(value = "/sales_stats/month_book", method = RequestMethod.POST)
    public List<HashMap> salesStatsMonth_book(@RequestBody String purchase_year_mon) {
		String year = purchase_year_mon.substring(purchase_year_mon.length() - 4);
		return adminService.salesStatsMonth_book(year);
	}
	
	@ResponseBody
    @RequestMapping(value = "/sales_stats/day", method = RequestMethod.POST)
    public List<HashMap> salesStatsDay(@RequestBody String purchase_day) {
		String day = purchase_day;
		return adminService.salesStatsDay(day);
	}
	
	@RequestMapping("/delivery_refund")
	public String viewPageDeliveryRefund(Model m) {
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}
		
		List<HashMap> listRefund = adminService.listRefund();
		m.addAttribute("listRefund", listRefund);
		return "/admin/sales/delivery_refund";
	}

	@ResponseBody
	@RequestMapping(value = "/delivery_refund", method = RequestMethod.POST)
	public void changeDeliveryState(@RequestBody BasketDTO bDTO) {
		adminService.changeDeliveryState(bDTO);
	}

	@RequestMapping("/view_list")
	public String viewPage_view_list(Model m) {
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}

		List<HashMap> listPost = adminService.listPost();
		m.addAttribute("listPost", listPost);

		return "/admin/event_announce_contest/view_list";
	}
	
	@RequestMapping("/insert_form")
	public String viewPage_insert_form(Model m) {
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}
		
		return "/admin/event_announce_contest/insert_form";
	}
	
	@RequestMapping(value = "/insert_form/noContest", method = RequestMethod.POST)
	public String insertEvt(PostDTO pDTO, ImageDTO iDTO, Model m) {
		
		// 이미지 등록 여부 확인
	    String postContent = pDTO.getPost_content();
	    
	    // post_content 값에서 base64 인코딩된 이미지 값을 추출
	    List<String> imageBase64List = extractBase64Image(postContent);
	    if (!imageBase64List.isEmpty()) {
	    	for (String imageBase64 : imageBase64List) {
	    		byte[] imageData = Base64.getDecoder().decode(imageBase64);
	    		
	    		String originImageName = generateUniqueFileName();
	            Long imageSize = (long)imageData.length;
	            
	            String baseURL = request.getRequestURL().toString();
	            String basePath = baseURL.substring(0, baseURL.lastIndexOf("/admin"));

	            Long time = System.currentTimeMillis();
	            
	            String path = "/admin/images/post/" + time + "_" + originImageName;
				String realPath = getRealPath("static/admin/images/post/")+"\\"+ time + "_" + originImageName;
	            
	            // 이미지 파일 저장 
	            saveImageFile(imageData, realPath, originImageName);
	            
	            // 이미지 정보 설정
	            iDTO.setOrigin_img_name(originImageName);
	            iDTO.setPath(path); 
	            iDTO.setImg_size(imageSize);
	            
	            String jwtToken = adminService.getJwtTokenFromCookies(request);
	    		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트 
	    		if(jwtToken == null)
	    		{
	    			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
	    		}
	            
	            Claims claims = mainService.getClaims(jwtToken);
	            
	            // post  DB에 저장
				String id = claims.get("id", String.class);      // 로그인한 사용자 id
				pDTO.setId(id);
			    iDTO.setId(id);		
				
	            // post_content에서 이미지 태그를 제거하여 나머지 내용만 저장
			    String contentWithoutImages = removeImageTags(postContent);
			    pDTO.setPost_content(contentWithoutImages);
			    	    
			    adminService.insertNoContest(pDTO, iDTO);
	    	}
	    }else {// 이미지가 포함되지 않은 경우
	    	String jwtToken = adminService.getJwtTokenFromCookies(request);
    		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
    		if(jwtToken == null)
    		{
    			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
    		}
			
			Claims claims = mainService.getClaims(jwtToken);
			
			String id = claims.get("id", String.class);      // 로그인한 사용자 id
			pDTO.setId(id);
			iDTO.setId(id);              
			
			// db저장
			adminService.insertNoContest(pDTO, iDTO);
	    }
	    
	    List<HashMap> listPost = adminService.listPost();
		m.addAttribute("listPost", listPost);

		return "/admin/event_announce_contest/view_list";
	}
	
	
	@RequestMapping(value = "/insert_form/yesContest", method = RequestMethod.POST)
	public String insertCon(PostDTO pDTO, ImageDTO iDTO, ContestDTO cDTO, Model m) {
		
		// 이미지 등록 여부 확인
	    String contestContent = cDTO.getContest_content();
	    
	    // post_content 값에서 base64 인코딩된 이미지 값을 추출
	    List<String> imageBase64List = extractBase64Image(contestContent);
	    if (!imageBase64List.isEmpty()) {
	    	for (String imageBase64 : imageBase64List) {
	    		byte[] imageData = Base64.getDecoder().decode(imageBase64);
	    		
	    		String originImageName = generateUniqueFileName();
	            Long imageSize = (long)imageData.length;
	            
	            String baseURL = request.getRequestURL().toString();
	            String basePath = baseURL.substring(0, baseURL.lastIndexOf("/admin"));

	            Long time = System.currentTimeMillis();
	            
	            String path = "/admin/images/contest/" + time + "_" + originImageName;
				String realPath = getRealPath("static/admin/images/contest/")+"\\"+ time + "_" + originImageName;
	            
	            // 이미지 파일 저장 
	            saveImageFile(imageData, realPath, originImageName);
	            
	            // 이미지 정보 설정
	            iDTO.setOrigin_img_name(originImageName);
	            iDTO.setPath(path); 
	            iDTO.setImg_size(imageSize);
	            
	            String jwtToken = adminService.getJwtTokenFromCookies(request);
	    		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트 
	    		if(jwtToken == null)
	    		{
	    			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
	    		}
	            
	            Claims claims = mainService.getClaims(jwtToken);
	            
	            // post  DB에 저장
				String id = claims.get("id", String.class);      // 로그인한 사용자 id
				pDTO.setId(id);
			    iDTO.setId(id);		
				
	            // post_content에서 이미지 태그를 제거하여 나머지 내용만 저장
			    String contentWithoutImages = removeImageTags(contestContent);
			    cDTO.setContest_content(contentWithoutImages);

			    adminService.insertYesContest(pDTO, iDTO, cDTO);
	    	}
	    }else {// 이미지가 포함되지 않은 경우
	    	String jwtToken = adminService.getJwtTokenFromCookies(request);
    		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
    		if(jwtToken == null)
    		{
    			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
    		}
			
			Claims claims = mainService.getClaims(jwtToken);
			
			String id = claims.get("id", String.class);      // 로그인한 사용자 id
			pDTO.setId(id);
			iDTO.setId(id);              
			
			// db저장
			adminService.insertYesContest(pDTO, iDTO, cDTO);
	    }
	    
	    List<HashMap> listPost = adminService.listPost();
		m.addAttribute("listPost", listPost);

		return "/admin/event_announce_contest/view_list";
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
	
	// 파일 이름을 고유하게 생성하는 메서드
	private String generateUniqueFileName() {
	    // 고유한 파일 이름 생성 로직 구현
	    // 예시: UUID를 활용하여 파일 이름 생성
	    return UUID.randomUUID().toString();
	}

	// 이미지 파일 저장
	   private void saveImageFile(byte[] imageData, String imagePath, String fileName) {
	       try {

	           
	           // 이미지 파일 생성
	           File imageFile = new File(imagePath);
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

	@ResponseBody
	@RequestMapping(value = "/view_list", method = RequestMethod.POST)
	public void changePostState(@RequestBody PostDTO pDTO) {
		adminService.changePostState(pDTO);
	}

	@RequestMapping("/product_list")
	public String viewPage_product_list(Model m) {
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}
		
		List<HashMap> listProduct = adminService.listProduct();
		m.addAttribute("listProduct", listProduct);
		return "/admin/product/product_list";
	}

	@RequestMapping("/product_insert")
	public String viewPage_product_insert(Model m) {
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}
		
		return "/admin/product/product_insert";
	}

	@RequestMapping(value="/product_modify", method=RequestMethod.GET)
	public String viewPage_product_modify(BookDTO boDTO, Model m) {
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}
		
		HashMap<String, Object> getPost = adminService.getProduct(boDTO);
		
		// Convert issue_date to yyyy-MM-dd format
		try {
		    String issue_date = (String)getPost.get("issue_date"); // assuming that the issue_date in the HashMap is a String
		    SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy년 MM월");
		    Date date = inputFormat.parse(issue_date);
		    
		    // Set date to first of the month
		    Calendar calendar = Calendar.getInstance();
		    calendar.setTime(date);
		    calendar.set(Calendar.DAY_OF_MONTH, 1);
		    
		    SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
		    String outputDate = outputFormat.format(calendar.getTime());
		    
		    // Add outputDate to the model
		    m.addAttribute("outputDate", outputDate);
		} catch (ParseException e) {
		    e.printStackTrace();
		}
		
		m.addAttribute("getPost", getPost);
		
		return "/admin/product/product_modify";
	}
	
	@RequestMapping(value="/product_insert", method=RequestMethod.POST)
	public String insertProduct(@RequestParam("file") MultipartFile file, BookDTO boDTO, ImageDTO iDTO, Model m) {
		try {
	        String issueDateString = boDTO.getIssue_date();
	        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd"); // This should match the format of issueDateString
	        Date issueDate = inputFormat.parse(issueDateString); // Convert string to Date

	        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월"); // This is your desired format
	        String formattedDate = outputFormat.format(issueDate); // Convert Date to string in the desired format

	        boDTO.setIssue_date(formattedDate); // Update the issue_date
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
		
		try {
			if(file == null || file.isEmpty()) {
	            System.out.println("파일 첨부 실패");
	            adminService.insertProduct(boDTO, null);
	        }
	        
	        //스트링 originFilename에 파일 오리진네임 가져와서 넣기
	        iDTO.setOrigin_img_name(file.getOriginalFilename());
	        iDTO.setImg_size(file.getSize());
	        
	        System.out.println("getOriginalFilename: "+file.getOriginalFilename());
	        System.out.println("getSize: "+file.getSize());
	        
	        Long time = System.currentTimeMillis();
	        
	        System.out.println("time: "+time);
	        		        
		    String path = "/admin/images/product/" + time + "_"  + iDTO.getOrigin_img_name();
		    String realPath = getRealPath("static/admin/images/product/") + "\\" + time + "_" + iDTO.getOrigin_img_name();
		    
		    System.out.println("path: "+path);
		    System.out.println("realPath: "+realPath);
		    
		    iDTO.setPath(path);
		        
		    File serverFile = new File(realPath);
		    
		    System.out.println("serverFile: "+serverFile);
		        
		    try {
		    	file.transferTo(serverFile);
		        adminService.insertProduct(boDTO, iDTO);
		    }catch (Exception e) {
		    	System.out.println("실패: " + e.toString());
		    	e.printStackTrace();
		    }
		}catch(Exception e){
			System.out.println("실패: " + e.toString());

	        adminService.insertProduct(boDTO, null);
		}
		
		
		List<HashMap> listProduct = adminService.listProduct();
	    m.addAttribute("listProduct", listProduct);
	    
	    return "/admin/product/product_list";
	}
	
	
	@RequestMapping(value="/product_modify", method=RequestMethod.POST)
	public String updateProduct(@RequestParam("file") MultipartFile file, BookDTO boDTO, ImageDTO iDTO, Model m){
	    try {
	        String issueDateString = boDTO.getIssue_date();
	        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd"); // This should match the format of issueDateString
	        Date issueDate = inputFormat.parse(issueDateString); // Convert string to Date

	        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월"); // This is your desired format
	        String formattedDate = outputFormat.format(issueDate); // Convert Date to string in the desired format

	        boDTO.setIssue_date(formattedDate); // Update the issue_date
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    try {
	        if(file == null || file.isEmpty()) {
	            System.out.println("파일 첨부 실패");
	            adminService.updateProduct(boDTO, null);
	        }
	        
	        //스트링 originFilename에 파일 오리진네임 가져와서 넣기
	        iDTO.setOrigin_img_name(file.getOriginalFilename());
	        iDTO.setImg_size(file.getSize());
	        
	        System.out.println("getOriginalFilename: "+file.getOriginalFilename());
	        System.out.println("getSize: "+file.getSize());
	        
	        Long time = System.currentTimeMillis();
	        
	        System.out.println("time: "+time);
	        		        
		    String path = "/admin/images/product/" + time + "_"  + iDTO.getOrigin_img_name();
		    String realPath = getRealPath("static/admin/images/product/") + "\\" + time + "_" + iDTO.getOrigin_img_name();
		    
		    System.out.println("path: "+path);
		    System.out.println("realPath: "+realPath);
		    
		    iDTO.setPath(path);
		        
		    File serverFile = new File(realPath);
		    
		    System.out.println("serverFile: "+serverFile);
		        
		    try {
		    	file.transferTo(serverFile);
		        adminService.updateProduct(boDTO, iDTO);
		    }catch (Exception e) {
		    	System.out.println("실패: " + e.toString());
		    	e.printStackTrace();
		    }
	    } catch(Exception e) {
	        System.out.println("실패: " + e.toString());

	        adminService.updateProduct(boDTO, null);
	    }
	    
	    List<HashMap> listProduct = adminService.listProduct();
	    m.addAttribute("listProduct", listProduct);
	    
	    return "/admin/product/product_list";
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

	
	@RequestMapping("/game_stats")
	public String viewPage_game_stats(Model m, CharacterSheetDTO csDTO) {
		
		String jwtToken = adminService.getJwtTokenFromCookies(request);
		// 로그인 안한 상태로 페이지 접속시 로그인페이지 리다이렉트
		if(jwtToken == null)
		{
			return uiUtils.showMessageWithRedirect("로그인 후 이용가능한  페이지입니다.", "/main/main", Method.GET, null, m);
		}
		
		List<HashMap> playedRuleBook = adminService.playedRuleBook();
		m.addAttribute("playedTime", playedTime);
		List<CharacterSheetDTO> classForStats = adminService.classForStats();
		m.addAttribute("classForStats", classForStats);

		return "/admin/game_stats/game_stats";
	}
	
	@RequestMapping(value="/game_stats/survey", method=RequestMethod.GET)
	public ResponseEntity<Object> getChartData_survey() {
	    Map<String, Object> data = new HashMap<>();

	    try (RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

	        SearchRequest searchRequest = new SearchRequest("survey");
	        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

	        // ElasticSearch에 적절한 쿼리를 입력하여 필요한 데이터만 가져옵니다.
	        // 아래 코드는 모든 데이터를 가져오는 예시입니다.
	        searchSourceBuilder.query(QueryBuilders.matchAllQuery());

	        searchRequest.source(searchSourceBuilder);
	        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
	        SearchHits hits = searchResponse.getHits();

	        // 클라이언트가 차트를 그리기 위해 필요한 데이터 형식으로 변환합니다.
	        // 아래 코드는 모든 document를 배열로 반환하는 예시입니다.
	        data.put("data", Arrays.stream(hits.getHits())
	                               .map(SearchHit::getSourceAsMap)
	                               .collect(Collectors.toList()));

	    } catch (IOException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }

	    return ResponseEntity.ok(data);
	}
	
	@RequestMapping(value="/game_stats/character_sheet", method=RequestMethod.GET)
	public ResponseEntity<Object> getChartData_characterSheet() {
	    Map<String, Object> data = new HashMap<>();

	    try (RestHighLevelClient client = new RestHighLevelClient(RestClient.builder(new HttpHost(ES_HOST, ES_PORT, "http")))) {

	        SearchRequest searchRequest = new SearchRequest("character_sheet");
	        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

	        // ElasticSearch에 적절한 쿼리를 입력하여 필요한 데이터만 가져옵니다.
	        // 아래 코드는 모든 데이터를 가져오는 예시입니다.
	        searchSourceBuilder.query(QueryBuilders.matchAllQuery());

	        searchRequest.source(searchSourceBuilder);
	        SearchResponse searchResponse = client.search(searchRequest, RequestOptions.DEFAULT);
	        SearchHits hits = searchResponse.getHits();

	        // 클라이언트가 차트를 그리기 위해 필요한 데이터 형식으로 변환합니다.
	        // 아래 코드는 모든 document를 배열로 반환하는 예시입니다.
	        data.put("data_cs", Arrays.stream(hits.getHits())
	                               .map(SearchHit::getSourceAsMap)
	                               .collect(Collectors.toList()));

	    } catch (IOException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }

	    return ResponseEntity.ok(data);
	}
	
	@ResponseBody
	@RequestMapping(value = "/game_stats", method = RequestMethod.POST)
	public List<HashMap> preferredStatsByClasses(@RequestBody CharacterSheetDTO csDTO, Model m) {
		return adminService.preferredStatsByClasses(csDTO);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/live_question")
	public String live_question() {
		return "/admin/admin_question/admin_question";
	}
	
	
	
	
	
}

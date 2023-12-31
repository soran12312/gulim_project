package project.gulim.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.domain.BookDTO;
import project.gulim.service.MainService;
import project.gulim.service.SaleService;
@CrossOrigin(origins = "*", allowedHeaders = "*")
@Controller
@RequestMapping("/sale")
public class SaleController {
	
	@Autowired
	private SaleService saleService;
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private HttpServletRequest req;
	
	//구독권 설정집 선택 페이지
	@RequestMapping("/sale_main")
	public String Book()
	{
		return "sale/sale_main";
	}
	
	// 구독 페이지
	@RequestMapping("/subscribe")
	public String subscribe()
	{
		return "sale/subscribe/subscribe";
	}
	
	//설정집판매 페이지
	@RequestMapping("/sales")
	@ResponseBody
	public List<Map> sales(){
		
		List<Map> list = saleService.sales();
		return list;
		
	}
	
	//책 리스트 보는것
	@RequestMapping("/book/book_list")
	public String book_list(Model m) {
		
		Cookie[] cookies = req.getCookies();
	    String access_token = null;
	      
	    if (cookies != null) {
	    	for (Cookie cookie : cookies) {
	    		if (cookie.getName().equals("access_token")) {
	    			access_token = cookie.getValue();
	                break;
	            }
	        }
	    }
	    
	    Claims claims = mainService.getClaims(access_token);
        
        String id = claims.get("id", String.class);
        
        m.addAttribute("id", id);
		
		return "/sale/book/book_list";
	}
	
	
		// 책 상세보기
	  @RequestMapping("/book/book_detail") 
	  public String book_detail(BookDTO book,Model m){ 
		  
		  List<HashMap> list = saleService.product_detail(book);
		  
		  m.addAttribute("result", list);
		  
		  return "/sale/book/book_detail";
	  }
	 
	
	
	

	
}

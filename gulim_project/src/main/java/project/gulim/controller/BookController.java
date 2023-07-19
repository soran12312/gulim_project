package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sale")
public class BookController {
	
	
	
	// 장바구니 페이지 이동
	@RequestMapping("/basket")
	public String Cart()
	{
		return "sale/book/basket";
	}
	
	
	// 장바구니 추가
	@PostMapping("/api/add-to-cart")
    public String addCart() {
        
        return "Subscription added to cart successfully";
    }
	
	
	
	

}

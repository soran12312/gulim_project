package project.gulim.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.domain.BookDTO;
import project.gulim.domain.SubscribeDTO;
import project.gulim.service.BookService;
import project.gulim.service.MainService;
import project.gulim.service.SubscriptionService;

@Controller
@RequestMapping("/sale")
public class CartController {
	
	
	@Autowired
    private SubscriptionService subscriptionService;
	
	@Autowired
	private MainService mainService;
    
    
    @Autowired
	private HttpServletRequest request;
    
    @Autowired
    private BookService bookService;

	
	@RequestMapping("/basket")
	public String basket(Integer basketNum, Model model)
	{
		Cookie[] cookies = request.getCookies();
        String jwtToken = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("access_token")) {
                    jwtToken = cookie.getValue();
//                    System.out.println(jwtToken);
                    break;
                }
            }
        }

        Claims claims = mainService.getClaims(jwtToken);
        String id = claims.get("id", String.class); // 로그인한 사용자 id
        System.out.println(id);
		
        basketNum = subscriptionService.getUserBasketNumber(id);
		
		List<SubscribeDTO> subscriptionsInBasket = subscriptionService.getUserBasketSubscription(basketNum);
		
		model.addAttribute("subscription", subscriptionsInBasket);
		 
		System.out.println(subscriptionsInBasket);
		
		return "sale/book/basket";
	}
	
	
	// 룰북 장바구니
	@RequestMapping("/basket2")
	public String basket2(Integer basketNum, Model model)
	{
		Cookie[] cookies = request.getCookies();
        String jwtToken = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("access_token")) {
                    jwtToken = cookie.getValue();
//                    System.out.println(jwtToken);
                    break;
                }
            }
        }

        Claims claims = mainService.getClaims(jwtToken);
        String id = claims.get("id", String.class); // 로그인한 사용자 id
        System.out.println(id);
	
        
        basketNum = subscriptionService.getUserBasketNumber(id);
		
		List<BookDTO> BookInBasket = bookService.getUserBasketBook(basketNum);
		
		model.addAttribute("book", BookInBasket);
		 
		System.out.println(BookInBasket);
		
		return "sale/book/basket2";
	}
	
	
	
	// 구독권 친구에게 보내기
	@RequestMapping("/send_subscribe")
	public String send_message(String send_id, Model m) {
		//보낸사람이 null일경우 빈공간으로(바로 쪽지보내기눌렀을 경우)
		if(send_id == null) {
			send_id="";
		}

		return "/sale/subscribe/send_subscribe";
	}
	
}

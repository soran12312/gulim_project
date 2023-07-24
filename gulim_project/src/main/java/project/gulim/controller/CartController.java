package project.gulim.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.domain.SubscribeDTO;
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
	
}

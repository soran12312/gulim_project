package project.gulim.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.domain.BasketDTO;
import project.gulim.domain.PurchaseDTO;
import project.gulim.domain.SubscribeDTO;
import project.gulim.service.CartService;
import project.gulim.service.MainService;
import project.gulim.service.SubscriptionService;

@RestController
@RequestMapping("/api")
public class SubscriptionController {

    @Autowired
    private SubscriptionService subscriptionService;
    
    @Autowired
	private MainService mainService;
    
    
    @Autowired
	private HttpServletRequest request;
    
    @Autowired
    private CartService cartService;
    
    
    
    
    
    // 카트 구독권 추가
    // 클라이언트에서 보낸 구독권 정보를 처리하는 메서드
    @RequestMapping("/add-to-cart")
    public String addToCart(@RequestBody Map<String, Object> subscriptionDataMap) {
        try {
            // Convert the Map to a SubscribeDTO object 
            SubscribeDTO subscriptionData = SubscribeDTO.createFromMap(subscriptionDataMap);
            
            
            
         // 장바구니 테이블에 id값 저장
            Cookie[] cookies = request.getCookies();
            String jwtToken = null;

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("access_token")) {
                        jwtToken = cookie.getValue();
//                        System.out.println(jwtToken);
                        break;
                    }
                }
            }

            Claims claims = mainService.getClaims(jwtToken);
            String id = claims.get("id", String.class); // 로그인한 사용자 id
            System.out.println(id);
            
            
            subscriptionData.setId(id);

            System.out.println(subscriptionData);
            
            subscriptionService.saveSubscription(subscriptionData);        // db저장
            
            Integer userBasketNumber = subscriptionService.getUserBasketNumber(id);
            

            // 
            if (userBasketNumber == null) {
	            // 장바구니 정보를 구성하여 DB에 저장
	            BasketDTO basketData = new BasketDTO();
	            basketData.setId(id);
	            cartService.saveCart(basketData);
            }    
            
            
            // purchase sub_num, basket_num 저장
            PurchaseDTO purchaseData = new PurchaseDTO();
            purchaseData.setBasket_num(userBasketNumber );
            purchaseData.setSub_num(subscriptionData.getSub_num());
            
            System.out.println(purchaseData);
            
            subscriptionService.savePurchase(purchaseData);
            
            System.out.println(ResponseEntity.ok("Subscription added to cart successfully"));
            
            
//            return ResponseEntity.ok("Subscription added to cart successfully");
            return "Subscription added to cart successfully";
        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to add subscription to cart");
            return "Failed to add subscription to cart";
        }
    }
    
    
    
    

    
    
    
    
   
}
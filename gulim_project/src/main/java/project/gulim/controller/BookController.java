package project.gulim.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.jsonwebtoken.Claims;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.domain.BasketDTO;
import project.gulim.service.BookService;
import project.gulim.service.MainService;
import project.gulim.service.SubscriptionService;

@RestController
@RequestMapping("/api")
public class BookController {
	
	
	@Autowired
	private HttpServletRequest request;
	
    @Autowired
	private MainService mainService;
    
    @Autowired
    private SubscriptionService subscriptionService;
    
    @Autowired
    private BookService bookService;
    

	// 카트 book 추가
    // 클라이언트에서 보낸 구독권 정보를 처리하는 메서드
    @RequestMapping("/add-to-cart2")
    public String addToCart(@RequestBody Map<String, Object> bookDataMap, Model m) {
        try {
      
           String book_num_string = bookDataMap.get("book_num").toString();
           
           Integer book_num = Integer.parseInt(book_num_string);
           
           System.out.println("book_num : " + book_num);
           
            
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

            
            BasketDTO basketData = new BasketDTO();
            basketData.setId(id);
            
            
            // 로그인 중인 id의 장바구니 번호가 있으면
            Integer userBasketNumber = subscriptionService.getUserBasketNumber(id);
           
            System.out.println(userBasketNumber);

            // 로그인 중인 id의 장바구니 번호가 없으면
            if(userBasketNumber == null)
            {            	
            	// basket db 저장
            	bookService.saveCart(basketData);
            	userBasketNumber = basketData.getBasket_num();
            	
            	
            }
            
            
            // 장바구니 책번호 있는지 확인
            Integer existingAmount = bookService.getBookAmountInBasket(book_num, userBasketNumber);
            System.out.println("amount : " + existingAmount);

            // 카트에 책이 없으면, 수량 1
            if (existingAmount == null) {
                Map<String, Object> purchaseData = new HashMap<>();
                purchaseData.put("basket_num", userBasketNumber);
                purchaseData.put("book_num", book_num);
                purchaseData.put("amount", 1);
                bookService.savePurchase(purchaseData);
            } else {
                // 책이 있으면 1 증가
                Map<String, Object> updateData = new HashMap<>();
                updateData.put("basket_num", userBasketNumber);
                updateData.put("book_num", book_num);
                updateData.put("amount", existingAmount + 1);
                bookService.updatePurchaseAmount(updateData);
            }
            
            
            
            

            System.out.println(ResponseEntity.ok("Subscription added to cart successfully"));
            return "Subscription added to cart successfully";
            
            
        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to add subscription to cart");
        	e.printStackTrace();
            return "Failed to add subscription to cart";
        }
    }
    
    
	

	
	

}

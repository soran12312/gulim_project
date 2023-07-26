package project.gulim.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
import project.gulim.util.UiUtils;

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
    
    private final UiUtils uiUtils = new UiUtils();
    
 
    
    // 카트 구독권 추가
    // 클라이언트에서 보낸 구독권 정보를 처리하는 메서드
    @RequestMapping("/add-to-cart")
    public String addToCart(@RequestBody Map<String, Object> subscriptionDataMap, Model m) {
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
            

            // 장바구니 번호가 없을때
            if (userBasketNumber == null) {
	            // 장바구니 정보를 구성하여 DB에 저장
	            BasketDTO basketData = new BasketDTO();
	            basketData.setId(id);
	            cartService.saveCart(basketData);
            }    
            
            
            // 
            // 카트에 넣으려는 구독권 가격 있는지 확인
            Integer price = subscriptionData.getPrice();
            Integer existingAmount = subscriptionService.getExistingSubscriptionAmount(price,userBasketNumber);
            System.out.println("existingAmount:" + existingAmount);
            
            
            
            // 해당 구독권 장바구니에 있으면 수량 증가
            if (existingAmount != null) {
                Integer updatedAmount = existingAmount + 1;
                System.out.println(updatedAmount);
                
                Map<String, Object> params = new HashMap<>();
                params.put("updatedAmount", updatedAmount);
                params.put("basketNum", userBasketNumber); 
                params.put("price", subscriptionData.getPrice());
                
                subscriptionService.updatePurchaseAmount(params);    //db저장
               
                System.out.println("price: " + subscriptionData.getPrice());
                System.out.println("updatedAmount :" + updatedAmount);
                
            } else {
                // purchase sub_num, basket_num, amount = 1 저장
                PurchaseDTO purchaseData = new PurchaseDTO();
                purchaseData.setBasket_num(userBasketNumber);
                purchaseData.setSub_num(subscriptionData.getSub_num());
                purchaseData.setAmount(1);   
                subscriptionService.savePurchase(purchaseData); // db 저장
                System.out.println(purchaseData);
            }

            
            
            System.out.println(ResponseEntity.ok("Subscription added to cart successfully"));
            
            
//            return ResponseEntity.ok("Subscription added to cart successfully");
            return "Subscription added to cart successfully";
        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to add subscription to cart");
        	System.out.println(e.getMessage());
        	e.printStackTrace();
            return "Failed to add subscription to cart";
        }
    }
    
    
    
    

    
    
    // +, - 버튼 클릭시 수정
    @PostMapping("/update-quantity")
    public boolean updateQuantity(@RequestBody Map<String, Object> requestData) {
        try {
        	System.out.println("*************************");
        	System.out.println(requestData);
        	System.out.println("*************************");
            String sub_num_string = requestData.get("sub_num").toString();
            Integer sub_num = Integer.parseInt(sub_num_string);
            
            String amount_string = requestData.get("amount").toString();
            Integer amount = Integer.parseInt(amount_string);
            System.out.println("*************************");

            System.out.println(sub_num);
            System.out.println(amount);

            // Update the quantity in the database using the subscriptionService
            
            Integer result =subscriptionService.updateQuantity(sub_num, amount);
            if(result == 1)
            {
            	return true;
            }
            else
            {            	
            	return false;
            }
//            return ResponseEntity.ok("Quantity updated successfully");
        } catch (Exception e) {
        	System.out.println(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update quantity");
            return false;
        }
    }
    
    
    
    // 장바구니 삭제
    @PostMapping("/delete-subscription")
    public boolean deleteQuantity(@RequestBody PurchaseDTO sub_num) {
    	try {
    		
    		
            System.out.println("sub_num:" + sub_num);
    		
    		
            Integer result = subscriptionService.deleteQuantity(sub_num);
            
            if(result == 1)
            {
            	return true;
            }
            else
            {            	
            	return false;
            }
//            return ResponseEntity.ok("Quantity updated successfully");
        } catch (Exception e) {
        	System.out.println(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update quantity");
            return false;
        }
    	
    	
    	
    }
    
    
   
}
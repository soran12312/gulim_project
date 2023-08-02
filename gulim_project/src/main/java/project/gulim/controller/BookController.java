package project.gulim.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
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
            Integer BasketNumber = subscriptionService.getUserBasketNumber(id);
            System.out.println("BasketNumber : " + BasketNumber);
            

            // 로그인 중인 id의 장바구니 번호가 없으면
            if (BasketNumber == null) {
                // basket db 저장
                bookService.saveCart(basketData);
                BasketNumber = basketData.getBasket_num();
            }

            // 해당 장바구니에 같은 책이 있는지 확인
            Integer existingBookAmount = bookService.getBookAmountInBasket(BasketNumber, book_num);
            System.out.println("existingBookAmount: " + existingBookAmount);

            // 있으면 원래 수량 +1
            if (existingBookAmount != null) {
            	
            	Integer updatedAmount = existingBookAmount + 1;
                System.out.println(updatedAmount);
            	
                Map<String, Object> updateData = new HashMap<>();
                updateData.put("basket_num", BasketNumber);
                updateData.put("book_num", book_num);
                updateData.put("amount", updatedAmount);
                bookService.updatePurchaseAmount(updateData);
            } else {
                // 없으면 amount = 1
                Map<String, Object> purchaseData = new HashMap<>();
                purchaseData.put("basket_num", BasketNumber);
                purchaseData.put("book_num", book_num);
                purchaseData.put("amount", 1);
                System.out.println(purchaseData);
                bookService.savePurchase(purchaseData);
            }
            
            
            System.out.println(ResponseEntity.ok("Subscription added to cart successfully"));
            return "Subscription added to cart successfully";
            
            
        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to add subscription to cart");
        	System.out.println(e.getMessage());
        	e.printStackTrace();
            return "Failed to add subscription to cart";
        }
    }
    
    
	
    // 삭제버튼 클릭시
    @RequestMapping("/delete-book")
    public ResponseEntity deleteBook(@RequestBody PurchaseDTO book_num) {
    	try {
           System.out.println("book_num:" + book_num);
    		
    		
           bookService.deleteQuantity(book_num);
            
         
            return ResponseEntity.ok("Quantity updated successfully");
        } catch (Exception e) {
        	System.out.println(e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update quantity");
        }
    	
    	
    	
    }
    
    
    
    
    
    
    
     // +, - 버튼 클릭시 수정
    @PostMapping("/update-book")
    public boolean updateQuantity(@RequestBody Map<String, Object> requestData) {
        try {
        	System.out.println("*************************");
        	System.out.println(requestData);
        	System.out.println("*************************");
            String book_num_string = requestData.get("book_num").toString();
            Integer book_num = Integer.parseInt(book_num_string);
            
            String amount_string = requestData.get("amount").toString();
            Integer amount = Integer.parseInt(amount_string);
            System.out.println("*************************");

            System.out.println(book_num);
            System.out.println(amount);

            // Update the quantity in the database using the subscriptionService
            
            Integer result = bookService.updateQuantity(book_num, amount);
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
        	e.printStackTrace();
        	System.out.println(e.getMessage());
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update quantity");
            return false;
        }
    }
    
    
    
    
 // 결제하기 버튼 클릭시
    @PostMapping("/bookcheckout")
    @Transactional
    public ResponseEntity<String> handleCheckout(@RequestBody List<Map<String, Integer>> cartItems) {
        System.out.println(cartItems);
    	
        try {
        	
        	for (Map<String, Integer>cartItem : cartItems) {
             
                Integer book_num = (Integer) cartItem.get("book_num");
                Integer amount = (Integer) cartItem.get("amount");
                
                
                Cookie[] cookies = request.getCookies();
                String jwtToken = null;

                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("access_token")) {
                            jwtToken = cookie.getValue();
//                            System.out.println(jwtToken);
                            break;
                        }
                    }
                }

                Claims claims = mainService.getClaims(jwtToken);
                System.out.println(claims);
                String id = claims.get("id", String.class); // 로그인한 사용자 id
                System.out.println(id);
                String address = claims.get("address", String.class); // 주소
                System.out.println(address);
                
                String tel = claims.get("tel", String.class); // 전화번호
                System.out.println(tel);
                
                String name = claims.get("name", String.class); // 수령인
                System.out.println(name);
                
                // purchase_state 1 업데이트
                bookService.updatePurchaseState(cartItem);
                
                Integer userBasketNumber = subscriptionService.getUserBasketNumber(id);
                
                // basket basket_address|tel|recipient_name|delivery_state|purchase_date|   유저정보로 업데이트
                bookService.updateBasket(address, tel, name, userBasketNumber);
               
            }
    
            
            return new ResponseEntity<>("Payment successful", HttpStatus.OK);
        } catch (Exception e) {
        	e.printStackTrace();
           return new ResponseEntity<>("Payment error: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
	
	// 상세에서 구매하기 클릭
    @PostMapping("/complete-purchase")
    public ResponseEntity<String> purchase(@RequestBody Map<String, Integer> bookData)
    {
    	
    	try {
    		
    		
    		Integer sub_num = (Integer) bookData.get("sub_num");
    		
    		
    		
    		bookService.purchase(sub_num);
    	
    	
	    	return new ResponseEntity<>("Payment successful", HttpStatus.OK);
	    } catch (Exception e) {
	    	e.printStackTrace();
	       return new ResponseEntity<>("Payment error: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	    }
    }

}

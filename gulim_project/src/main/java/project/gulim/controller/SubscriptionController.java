package project.gulim.controller;

import java.time.LocalDate;
import java.util.concurrent.Flow.Subscription;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import project.gulim.service.SubscriptionService;

@RestController
@RequestMapping("/api")
public class SubscriptionController {

    @Autowired
    private SubscriptionService subscriptionService;
    
    
    // 카트 구독권 추가
//    @PostMapping("/add-to-cart")
//    public ResponseEntity<String> addToCart(@RequestBody Subscription subscription) {
//        try {
//            // Extract the price and num (id) from the request
//            int price = subscription.getPrice();
//            
//            // Calculate the end_date based on the price and num (id)
//            LocalDate endDate;
//            if (price == 9900) {
//                // Check 구독권을 한번도 가입한적이 없는 지 확인해서 2개월 추가되게
//                endDate = LocalDate.now().plusMonths(1);
//                
//            } else if (price == 15000) {
//                endDate = LocalDate.now().plusMonths(3);
//            } else if (price == 29900) {
//                endDate = LocalDate.now().plusMonths(7);
//            } else if (price == 55000) {
//                endDate = LocalDate.now().plusMonths(14);
//            } else {
//                // Set a default end_date if the price is not recognized
//                endDate = LocalDate.now().plusMonths(1);
//            }
//
//            // Create a Subscription object and set the necessary data
//            Subscription subscription = new Subscription();
//            subscription.setPrice(price);
//            subscription.setNum(num);
//            subscription.setEnd_date(endDate);
//
//            // Call the service layer to save the data to the database
//            subscriptionService.saveSubscription(subscription);
//
//            return ResponseEntity.ok("Subscription added to cart successfully");
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to add subscription to cart");
//        }
//    }
    
    
    
    
   
}
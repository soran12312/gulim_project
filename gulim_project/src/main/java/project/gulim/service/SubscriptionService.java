package project.gulim.service;


import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Flow.Subscription;

import project.gulim.domain.PurchaseDTO;
import project.gulim.domain.SubscribeDTO;


public interface SubscriptionService {
	

	public void saveSubscription(SubscribeDTO subscriptionData);

	public void savePurchase(PurchaseDTO purchaseData);

	// 현재 로그인 중인 아이디의 장바구니 번호
	public Integer getUserBasketNumber(String id);

	// 현재 로그인중인 아이디의 장바구니 구독권
	public List<SubscribeDTO> getUserBasketSubscription(Integer basketNum);
	
	
	// 장바구니에 있는 구독권이니지 확인
	public Integer getExistingSubscriptionAmount(Integer price, Integer basketNum);

	// 장바구니에 있는데이터면 +1
	public void updatePurchaseAmount(Map<String, Object> params);

	
	// 장바구니 +, - 버튼 
	public Integer updateQuantity(Integer sub_num, Integer amount);



	
	// 구독권 번호로 가격 
	public Integer getSubscriptionById(Integer sub_num);
	
	
	// 장바구니 삭제
	public Integer deleteQuantity(PurchaseDTO sub_num);

	public void deleteSubscription(PurchaseDTO sub_num);

	
	// 결제되면 start_date, end_date, sub_state = 1로 변경
	public void updateSubscriptionById(Integer sub_num, LocalDate endDate);

	// 결제 완료면 장바구니 데이터 전부 삭제
	public void deleteAllQuantities(Map<String, Integer> cartItem);





}
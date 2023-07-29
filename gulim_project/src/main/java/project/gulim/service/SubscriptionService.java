package project.gulim.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Flow.Subscription;

import project.gulim.domain.PurchaseDTO;
import project.gulim.domain.SubscribeDTO;


public interface SubscriptionService {
	

	public void saveSubscription(SubscribeDTO subscriptionData);

	public List<HashMap> savePurchase(PurchaseDTO purchaseData);

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

	// 장바구니 삭제
	public Integer deleteQuantity(PurchaseDTO sub_num);


	
	//
	public SubscribeDTO getSubscriptionById(Integer subscriptionId);





}
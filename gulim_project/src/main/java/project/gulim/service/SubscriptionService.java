package project.gulim.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.gulim.domain.PurchaseDTO;
import project.gulim.domain.SubscribeDTO;


public interface SubscriptionService {
	

	public void saveSubscription(SubscribeDTO subscriptionData);

	public List<HashMap> savePurchase(PurchaseDTO purchaseData);

	// 현재 로그인 중인 아이디의 장바구니 번호
	public Integer getUserBasketNumber(String id);

	// 현재 로그인중인 아이디의 장바구니 구독권
	public List<SubscribeDTO> getUserBasketSubscription(Integer basketNum);

}

package project.gulim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.BasketDTO;
import project.gulim.domain.PurchaseDTO;
import project.gulim.domain.SubscribeDTO;


@Mapper
public interface SubscriptionDAO {
	
	/**
     * 카트 추가
     * @param params - 선택한 구독권 정보
     */
	public void saveSubscription(SubscribeDTO subscriptionData);

	public void saveCart(BasketDTO basket);
	

	public List<HashMap> savePurchase(PurchaseDTO purchaseData);

	public Integer getUserBasketNumber(String id);

	public List<SubscribeDTO> getUserBasketSubscription(Integer basketNum);


	public Integer getSubscriptionAmountByPrice(Integer price);

	public void updateSubscription(Integer price, Integer updatedAmount);

	public Integer getExistingSubscriptionAmount(Integer price, Integer basketNum);

	public void updatePurchaseAmount(Map<String, Object> params);

	// +, - 버튼 수량 수정
	public Integer updateQuantity(Integer sub_num, Integer amount);

	// 장바구니 삭제
	public Integer deleteQuantity(PurchaseDTO sub_num);



	
}

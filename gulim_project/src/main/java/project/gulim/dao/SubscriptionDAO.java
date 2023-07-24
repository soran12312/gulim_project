package project.gulim.dao;

import java.util.HashMap;
import java.util.List;

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
	

}

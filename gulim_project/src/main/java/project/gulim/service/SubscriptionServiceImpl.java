package project.gulim.service;


import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.gulim.dao.SubscriptionDAO;
import project.gulim.domain.PurchaseDTO;
import project.gulim.domain.SubscribeDTO;



@Service
public class SubscriptionServiceImpl implements SubscriptionService {
	
	@Autowired
	private SubscriptionDAO subscriptionDAO;

	@Autowired
	private CartService cartService;
	 
	@Autowired
	private SqlSession sqlSession;
	
	

	// 구독 정보
	@Override
	public void saveSubscription(SubscribeDTO subscriptionData) {
		// TODO Auto-generated method stub
		
		subscriptionDAO.saveSubscription(subscriptionData);
	}



	@Override
	public void savePurchase(PurchaseDTO purchaseData) {
		// TODO Auto-generated method stub
		subscriptionDAO.savePurchase(purchaseData);
	}



	@Override
	public Integer getUserBasketNumber(String id) {
		// TODO Auto-generated method stub
		return subscriptionDAO.getUserBasketNumber(id);
	}



	@Override
	public List<SubscribeDTO> getUserBasketSubscription(Integer basketNum) {
		// TODO Auto-generated method stub
		return subscriptionDAO.getUserBasketSubscription(basketNum);
	}



	@Override
	public Integer getExistingSubscriptionAmount(Integer price, Integer basketNum) {
		// TODO Auto-generated method stub
		return subscriptionDAO.getExistingSubscriptionAmount(price, basketNum);
	}


	// 수량 수정
	@Override
	public void updatePurchaseAmount(Map<String, Object> params) {
		// TODO Auto-generated method stub
		subscriptionDAO.updatePurchaseAmount(params);
	}



	// +, - 클릭시 수량 변경
	@Override
	public Integer updateQuantity(Integer sub_num, Integer amount) {
		// TODO Auto-generated method stub
		
		return subscriptionDAO.updateQuantity(sub_num, amount);
		
		
    }



	// 장바구니 삭제
	@Override
	public Integer deleteQuantity(PurchaseDTO sub_num) {
		// TODO Auto-generated method stub
		return subscriptionDAO.deleteQuantity(sub_num);
	}
	
	
	@Override
	public void deleteSubscription(PurchaseDTO sub_num) {
		// TODO Auto-generated method stub
		subscriptionDAO.deleteSubscription(sub_num);
	}


	@Override
	public Integer getSubscriptionById(Integer sub_num) {
		// TODO Auto-generated method stub
		return subscriptionDAO.getSubscriptionById(sub_num);
	}



	
	@Override
	public void updateSubscriptionById(Integer sub_num, LocalDate endDate) {
		// TODO Auto-generated method stub
		subscriptionDAO.updateSubscriptionById(sub_num, endDate);
	}

	
	// 결제 완료 후 장바구니데이터 삭제
	@Override
	public void deleteAllQuantities(Map<String, Integer> cartItem) {
		// TODO Auto-generated method stub
		subscriptionDAO.deleteAllQuantities(cartItem);
	}



	
		
	



	
	
	
	
    
	

}
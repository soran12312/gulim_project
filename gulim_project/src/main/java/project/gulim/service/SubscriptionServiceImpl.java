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

	
	// 결제 완료 후 장바구니
	@Override
	public void updatePurchaseState(Map<String, Integer> cartItem) {
		// TODO Auto-generated method stub
		subscriptionDAO.updatePurchaseState(cartItem);
	}



	// 구독권 useid로 구매내역 가져오기
	@Override
	public SubscribeDTO getSubscriptionByUserId(String id) {
		// TODO Auto-generated method stub
		return subscriptionDAO.getSubscriptionByUserId(id);
	}



	@Override
	public void updateSubscriptionEndDate(Integer sub_num, String id, LocalDate endDate, LocalDate start_date) {
		// TODO Auto-generated method stub
		subscriptionDAO.updateSubscriptionEndDate(sub_num, id, endDate, start_date);
	}



	// // 입력한 친구id가 구독권이 있으면 연장
	@Override
	public void updateSubscriptionDate(String id, LocalDate start_date, LocalDate endDate,Integer price) {
		// TODO Auto-generated method stub
		subscriptionDAO.updateSubscriptionDate(id, start_date, endDate, price);
	}


	// 입력한 친구id가 구독권이 없음 추가
	@Override
	public void updateSubscriptionId(String id, LocalDate startDate, LocalDate endDate,Integer price) {
		// TODO Auto-generated method stub
		subscriptionDAO.updateSubscriptionId(id, startDate, endDate, price);
	}



	@Override
	public void insertPurchase() {
		// TODO Auto-generated method stub
		subscriptionDAO.insertPurchase();
	}



	
		
	



	
	
	
	
    
	

}
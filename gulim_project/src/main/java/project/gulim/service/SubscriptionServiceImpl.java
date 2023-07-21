package project.gulim.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.gulim.dao.SubscriptionDAO;
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
	public List<HashMap> savePurchase(Integer sub_num, Integer basket_num) {
		// TODO Auto-generated method stub
		return subscriptionDAO.savePurchase(sub_num, basket_num);
	}



	
	
	
    
	

}

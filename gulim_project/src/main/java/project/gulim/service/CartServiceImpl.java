package project.gulim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.gulim.dao.SubscriptionDAO;
import project.gulim.domain.BasketDTO;

@Service
public class CartServiceImpl implements CartService {
	
	
	@Autowired
	SubscriptionDAO subscriptionDAO;
	
	
	@Override
	public void saveCart(BasketDTO basket) {
		// TODO Auto-generated method stub
		subscriptionDAO.saveCart(basket);
		
	}

}

package project.gulim.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import project.gulim.dao.SubscriptionDAO;



@Service
public class SubscriptionServiceImpl implements SubscriptionService {
	
	@Autowired
	private SubscriptionDAO subscriptionDAO;
	

	@Override
	public void saveSubscription(Integer price) {
		// TODO Auto-generated method stub
		subscriptionDAO.saveSubscription(price);
	}

}

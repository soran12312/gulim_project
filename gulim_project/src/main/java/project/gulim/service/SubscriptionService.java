package project.gulim.service;


import java.util.HashMap;
import java.util.List;

import project.gulim.domain.SubscribeDTO;


public interface SubscriptionService {
	

	public void saveSubscription(SubscribeDTO subscriptionData);

	public List<HashMap> savePurchase(Integer sub_num, Integer basket_num);
}

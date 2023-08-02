package project.gulim.service;


import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Flow.Subscription;

import project.gulim.domain.PurchaseDTO;
import project.gulim.domain.SubscribeDTO;


public interface SubscriptionService {
	

	public void saveSubscription(SubscribeDTO subscriptionData);

	public void savePurchase(PurchaseDTO purchaseData);

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



	
	// 구독권 번호로 가격 
	public Integer getSubscriptionById(Integer sub_num);
	
	
	// 장바구니 삭제
	public Integer deleteQuantity(PurchaseDTO sub_num);

	public void deleteSubscription(PurchaseDTO sub_num);

	
	// 결제되면 start_date, end_date, sub_state = 1로 변경
	public void updateSubscriptionById(Integer sub_num, LocalDate endDate);

	// 결제 완료면 장바구니 데이터 purchase 1로 update
	public void updatePurchaseState(Map<String, Integer> cartItem);

	
	// 구독권 useid로 구매내역 가져오기
	public SubscribeDTO getSubscriptionByUserId(String id);

	// 구독권이 있으면 기간 연장
	public void updateSubscriptionEndDate(Integer sub_num, String id, LocalDate endDate, LocalDate start_date);

	
	// 입력한 친구id가 구독권이 있으면 연장
	public void updateSubscriptionDate(String id, LocalDate start_date, LocalDate endDate,Integer price);

	// 입력한 친구id가 구독권이 없음 추가
	public void updateSubscriptionId(String id, LocalDate startDate, LocalDate endDate,Integer price);

	public void insertPurchase();





}
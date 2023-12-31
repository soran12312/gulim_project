package project.gulim.dao;

import java.time.LocalDate;
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
	

	public void savePurchase(PurchaseDTO purchaseData);

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

	public Integer deleteSubscription(PurchaseDTO sub_num);

	// 장바구니에서 가져온 구독권 번호로 가격 가져옴
	public Integer getSubscriptionById(Integer sub_num);

	// 결제 완료 구독권정보 업데이트
	public void updateSubscriptionById(Integer sub_num,  LocalDate endDate);

	// 결제 완료 후 장바구니 삭제
	public void updatePurchaseState(Map<String, Integer> cartItem);

	// 구독권 userid로 구매내역 가져오기
	public SubscribeDTO getSubscriptionByUserId(String id);

	// 구독권이 있으면 기간 연장
	public void updateSubscriptionEndDate(Integer sub_num, String id, LocalDate endDate, LocalDate start_date);
	
	

	// 친구id가 구독권이  없음 추가
	public void updateSubscriptionId(String id, LocalDate startDate, LocalDate endDate ,Integer price);

	// 친구 id가 구독권이있으면 연장
	public void updateSubscriptionDate(String id, LocalDate start_date, LocalDate endDate,Integer price);

	public void insertPurchase();



	
	
}

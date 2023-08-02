package project.gulim.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.BasketDTO;
import project.gulim.domain.BookDTO;
import project.gulim.domain.PurchaseDTO;

@Mapper
public interface BookDAO {

	public void saveCart(BasketDTO basketData);

	public void savePurchase(Map<String, Object> purchaseData);

	
	// 장바구니에 해당 책번호 있는지 확인
	public Integer getBookAmountInBasket(Integer userBasketNumber, Integer book_num);
	
	
	// 장바구니에 책있으면 수량 추가
	public void updatePurchaseAmount(Map<String, Object> updateData);

	
	// 장바구니 리스트
	public List<BookDTO> getUserBasketBook(Integer basketNum);

	
	// 장바구니 삭제 버튼 클릭시
	public void deleteQuantity(PurchaseDTO book_num);

	
	//  +, - 버튼 클릭시 수량
	public Integer updateQuantity(Integer book_num, Integer amount);

	
	// 결제 완료 purchase_state 1로 업데이트
	public void updatePurchaseState(Map<String, Integer> cartItem);

	// 결제 완료 장바구니 db저장
	public void updateBasket(String address, String tel, String name, Integer userBasketNumber);

	// 상세에서 구매
	public void purchase(Integer sub_num);


	
	
	

}

package project.gulim.service;

import java.util.List;
import java.util.Map;

import project.gulim.domain.BasketDTO;
import project.gulim.domain.BookDTO;
import project.gulim.domain.PurchaseDTO;

public interface BookService {


	public void saveCart(BasketDTO basketData);

	public void savePurchase(Map<String, Object> purchaseData);

	// 장바구니에 해당 책번호 있는지 확인
	public Integer getBookAmountInBasket(Integer userBasketNumber, Integer book_num);

	
	// 장바구니에 책있으면 수량 추가
	public void updatePurchaseAmount(Map<String, Object> updateData);

	
	// 장바구니 책 리스트
	public List<BookDTO> getUserBasketBook(Integer basketNum);

	
	// 삭제
	public void deleteQuantity(PurchaseDTO book_num);

	
	// 수량 업데이트
	public Integer updateQuantity(Integer book_num, Integer amount);

	
	// 구매상태 1로 변경
	public void updatePurchaseState(Map<String, Integer> cartItem);

	// 결제 완료되면 장바구니에 주소, 전화번호, 이름 db저장
	public void updateBasket(String address, String tel, String name, Integer userBasketNumber);

	// 상세에서 구매
	public void purchase(Integer sub_num);



}

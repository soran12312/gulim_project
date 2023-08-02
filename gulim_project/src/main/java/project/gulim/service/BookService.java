package project.gulim.service;

import java.util.List;
import java.util.Map;

import project.gulim.domain.BasketDTO;
import project.gulim.domain.BookDTO;

public interface BookService {


	public void saveCart(BasketDTO basketData);

	public void savePurchase(Map<String, Object> purchaseData);

	// 장바구니에 해당 책번호 있는지 확인
	public Integer getBookAmountInBasket(Integer userBasketNumber, Integer book_num);

	
	// 장바구니에 책있으면 수량 추가
	public void updatePurchaseAmount(Map<String, Object> updateData);

	
	// 장바구니 책 리스트
	public List<BookDTO> getUserBasketBook(Integer basketNum);

}

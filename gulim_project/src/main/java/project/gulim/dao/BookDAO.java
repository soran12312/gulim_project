package project.gulim.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.BasketDTO;
import project.gulim.domain.BookDTO;

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
	
	
	

}

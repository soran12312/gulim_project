package project.gulim.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.BookDAO;
import project.gulim.domain.BasketDTO;
import project.gulim.domain.BookDTO;
import project.gulim.domain.PurchaseDTO;

@Service
public class BookServiceImpl implements BookService {
	
	
	@Autowired
	BookDAO bookDAO;

	@Override
	public void saveCart(BasketDTO basketData) {
		// TODO Auto-generated method stub
		bookDAO.saveCart(basketData);
		
	}

	@Override
	public void savePurchase(Map<String, Object> purchaseData) {
		// TODO Auto-generated method stub
		bookDAO.savePurchase(purchaseData);
	}

	// 장바구니에 해당 책번호 있는지 확인
	@Override
	public Integer getBookAmountInBasket(Integer userBasketNumber, Integer book_num) {
		// TODO Auto-generated method stub
		return bookDAO.getBookAmountInBasket(userBasketNumber, book_num);
	}

	
	// 장바구니에 책있으면 수량 추가
	@Override
	public void updatePurchaseAmount(Map<String, Object> updateData) {
		// TODO Auto-generated method stub
		bookDAO.updatePurchaseAmount(updateData);
	}

	@Override
	public List<BookDTO> getUserBasketBook(Integer basketNum) {
		// TODO Auto-generated method stub
		
		List<BookDTO> list = bookDAO.getUserBasketBook(basketNum);

		
		return bookDAO.getUserBasketBook(basketNum);
		
	}

	@Override
	public void deleteQuantity(PurchaseDTO book_num) {
		// TODO Auto-generated method stub
		bookDAO.deleteQuantity(book_num);
	}

	@Override
	public Integer updateQuantity(Integer book_num, Integer amount) {
		// TODO Auto-generated method stub
		return bookDAO.updateQuantity(book_num, amount);
	}

	@Override
	public void updatePurchaseState(Map<String, Integer> cartItem) {
		// TODO Auto-generated method stub
		bookDAO.updatePurchaseState(cartItem);
	}

	@Override
	public void updateBasket(String address, String tel, String name, Integer userBasketNumber) {
		// TODO Auto-generated method stub
		bookDAO.updateBasket(address, tel, name, userBasketNumber);
	}

	@Override
	public void purchase(Integer sub_num) {
		// TODO Auto-generated method stub
		bookDAO.purchase(sub_num);
	}

	
	
	

}

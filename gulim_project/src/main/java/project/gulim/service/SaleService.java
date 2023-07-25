package project.gulim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.SaleDAO;
import project.gulim.domain.BookDTO;

@Service
public class SaleService {
	
	@Autowired
	private SaleDAO saleDAO;
	
	
	public List<HashMap> product_detail(BookDTO book) {
		return saleDAO.product_detail(book);
	}
	
	public List<Map>sales(){
		return saleDAO.sales();
	}
	
	
	
}

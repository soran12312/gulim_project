package project.gulim.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.SaleDAO;

@Service
public class SaleService {
	
	@Autowired
	private SaleDAO saleDAO;
	
	public List<Map>sales(){
		return saleDAO.sales();
	}
	
	
	
}

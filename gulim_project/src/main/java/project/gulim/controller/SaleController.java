package project.gulim.controller;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import project.gulim.service.SaleService;
@CrossOrigin(origins = "*", allowedHeaders = "*")
@Controller
@RequestMapping("/sale")
public class SaleController {
	
	@Autowired
	private SaleService saleService;
	
	
	//구독권 설정집 선택 페이지
	@RequestMapping("/sale_main")
	public String Book()
	{
		return "sale/sale_main";
	}
	
	// 구독 페이지
	@RequestMapping("/subscribe")
	public String subscribe()
	{
		return "sale/subscribe/subscribe";
	}
	
	//설정집판매 페이지
	@RequestMapping("/sales")
	@ResponseBody
	public List<Map> sales(){
		System.out.println(">>>>>>>>>>불림");
		List<Map> list = saleService.sales();
		return list;
		
	}
	
}

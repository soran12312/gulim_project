package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller@RequestMapping("/sale")
public class SaleController {
	
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

}

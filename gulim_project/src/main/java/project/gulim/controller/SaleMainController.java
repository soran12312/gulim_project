package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SaleMainController {
	
	
	@GetMapping("/sale")
	public String Book()
	{
		return "sale/sale_main";
	}

}

package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubscribeController {
	
	
	@RequestMapping("/subscribe")
	public String subscribe()
	{
		return "sale/subscribe/subscribe";
	}

}

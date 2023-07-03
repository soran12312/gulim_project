package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {
	
	
	
	
	@RequestMapping("/book")
	public String Book()
	{
		return "sale/book/book_list";
	}

}

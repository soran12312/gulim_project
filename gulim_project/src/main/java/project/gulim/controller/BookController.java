package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookController {
	
	
	
	
	@GetMapping("/book")
	public String Book()
	{
		return "sale/book/book_list";
	}

}

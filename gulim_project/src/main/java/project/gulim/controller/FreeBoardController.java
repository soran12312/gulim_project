package project.gulim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeBoardController {

	@RequestMapping("/freeinsert")
	public String insert()
	{
		return "community/free_board/free_board_insert";
	}
}

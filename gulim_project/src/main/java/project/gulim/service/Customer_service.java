package project.gulim.service;

import project.gulim.domain.QuestionDTO;

public interface Customer_service {
	
	public void send_question(QuestionDTO questionDTO);
	public Integer isManager(String id);

}

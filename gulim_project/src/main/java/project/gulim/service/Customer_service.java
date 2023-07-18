package project.gulim.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.Customer_serviceDAO;
import project.gulim.domain.QuestionDTO;

@Service
public class Customer_service {

	@Autowired
	private Customer_serviceDAO customer_serviceDAO;

	public void send_question(QuestionDTO questionDTO) {
		customer_serviceDAO.send_question(questionDTO);
	}

}

package project.gulim.domain;

import lombok.Data;

@Data
public class BasketDTO {
	
	private Integer basket_num;
	private String id;
	private String basket_address;
	private String tel;
	private String recipient_name;
	private String delivery_state;
	private String purchase_date;
}

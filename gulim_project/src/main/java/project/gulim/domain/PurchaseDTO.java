package project.gulim.domain;

import lombok.Data;

@Data
public class PurchaseDTO {

	private Integer purchase_num;
	private Integer basket_num;
	private Integer book_num;
	private Integer amount;
	private Integer sub_num;
}

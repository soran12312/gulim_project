package project.gulim.domain;

import lombok.Data;

@Data
public class ItemDTO {
	
	private Integer item_num;
	private Integer inventory_num;
	private String item_name;
	private Integer item_amount;
	private Integer item_weight;
	private String item_detail;
	private Integer equip_state; // 장착상태 (0-기본값 / 1-장착중)
}

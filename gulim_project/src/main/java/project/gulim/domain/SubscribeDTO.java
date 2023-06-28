package project.gulim.domain;

import lombok.Data;

@Data
public class SubscribeDTO {
	
	private Integer sub_num;
	private String start_date;
	private String end_date;
	private String id;
}

package project.gulim.domain;

import lombok.Data;

@Data
public class PlaceDTO {
	
	private Integer place_num;
	private String place_name;
	private String category;
	private String latitude;
	private String longitude;
	private String place_address;
	private String tel;
	private Integer partnership; // 제휴여부(0-제휴x / 1-제휴매장)
}

package project.gulim.domain;

import lombok.Builder;
import lombok.Data;

@Data
public class ImageDTO {
	
	private Integer img_num;
	private String origin_img_name;
	private String path;
	private Long img_size;
	private Integer book_num;
	private String id;
	private Integer room_num;
	private Integer post_num;
	private Integer s_img_num;
	
	
}

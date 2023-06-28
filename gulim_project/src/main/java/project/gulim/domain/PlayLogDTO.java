package project.gulim.domain;

import lombok.Data;

@Data
public class PlayLogDTO {
	
	private Integer log_num;
	private String play_date;
	private String play_log_content;
	private Integer room_num;
}

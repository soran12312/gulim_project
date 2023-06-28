package project.gulim.domain;

import lombok.Data;

@Data
public class MessageDTO {
	
	private Integer message_num;
	private String send_id; // 보내는 사람
	private String receive_id; // 받는 사람
	private String message_title;
	private String message_content;
	private String send_date;
}

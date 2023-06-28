package project.gulim.domain;

import lombok.Data;

@Data
public class DiceDTO {
	
	private Integer dice_num;
	private Integer room_num;
	private Integer face_num; // 몇면체인지
	private Integer dice_count; // 갯수
}

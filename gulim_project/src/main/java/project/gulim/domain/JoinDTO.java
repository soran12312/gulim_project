package project.gulim.domain;

import lombok.Data;

@Data
public class JoinDTO {

	private Integer join_num;
	private Integer room_num;
	private String id;
	private Integer join_state; // 참가상태(0-기본값 / 1-참가허용 / 2-참가취소)
}

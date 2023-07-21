package project.gulim.domain;

import lombok.Data;

@Data
public class ChatingDTO {

	private Integer room_num;
	private String room_name;
	private String create_date;
	private Integer max_member;
	private Integer curr_member;
	private String id;
	private String period; // 예상 플레이기간
	private String next_play_date; // 다음 게임 일시
	private String plot;
	private String law;
	private String etc;
	private Integer watching; // 관전허용여부(0-허용 / 1-불가)
	private Integer video; // 화상채팅여부(0-필수 / 1-선택)
	private Integer room_state; // 개설상태(0-기본값 / 1-삭제된 방)
}

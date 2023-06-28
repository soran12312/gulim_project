package project.gulim.domain;

import lombok.Data;

@Data
public class FriendDTO {
	
	private Integer friend_num;
	private String my_id;
	private String friend_id;
	private Integer friend_state; // 친구등록상태(0-기본값 / 1-삭제된 친구)
}

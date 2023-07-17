package project.gulim.domain;

import java.util.List;

import lombok.Data;

@Data
public class PostDTO {

	private Integer post_num;
	private String post_title;
	private String id;
	private String writing_date;
	private String post_content;
	private String board; // 게시판(자유, 이벤트, 공지, 공모전)
	private String subject; // 말머리
	private Integer view_count;
	private Integer contest_num;
	private Integer post_state; // 등록상태(0-기본값(게시중) / 1-삭제된게시글(게시중단))

}

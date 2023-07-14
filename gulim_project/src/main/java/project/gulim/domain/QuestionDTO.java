package project.gulim.domain;


import java.sql.Date;

import lombok.Data;

@Data
public class QuestionDTO {
	
	private Integer question_num;
	private String question_title;
	private String question_content;
	private String id;
	private String answer;
	private Integer answer_state; // 답변상태 (0-미답변 / 1-답변완료)
	private String question_type;
	private Date question_date;
}

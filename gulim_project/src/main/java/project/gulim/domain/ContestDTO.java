package project.gulim.domain;

import lombok.Data;

@Data
public class ContestDTO {

	private Integer contest_num;
	private String contest_title;
	private String contest_content;
	private String start_date;
	private String end_date;
}

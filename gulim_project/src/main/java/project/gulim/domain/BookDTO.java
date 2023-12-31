package project.gulim.domain;

import java.util.Map;

import lombok.Data;

@Data
public class BookDTO {

	private Integer book_num;
	private String book_title;
	private String writer;
	private String translation;
	private String issue_date;
	private String book_detail;
	private Integer price;
	private Integer stock;
	private String genre;
	private Integer adult; // 19금 여부(0-일반도서 / 1-19금도서)
	private Integer sale_state; // 판매상태(0-기본값 / 1-판매중지)
	private String simple_info;
	
	
}

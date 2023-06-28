package project.gulim.domain;

import lombok.Data;

@Data
public class CharacterSheetDTO {
	
	private Integer sheet_num;
	private Integer join_num;
	private String char_name;
	private String char_propensity; // 성향
	private String char_class; // 직업
	private String species; // 종족
	private Integer level;
	private Integer exp;
	private Integer str; // 힘
	private Integer dex; // 민첩
	private Integer con; // 체력
	private Integer intelligence; // 지능
	private Integer wis; // 지혜
	private Integer chr; // 매력
	private String char_explain; // 특징 및 설명
	private String condition; // 상태이상
	private String char_etc; // 기타사항
}

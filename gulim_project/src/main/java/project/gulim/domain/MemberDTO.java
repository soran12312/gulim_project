package project.gulim.domain;

import lombok.Data;

@Data
public class MemberDTO {

	private String id;
	private String password;
	private String name;
	private String address;
	private String tel;
	private String email;
	private String nickname;
	private String birthday;
	private String introduce;
	private String regist_type; // kakao, google, common
	private Integer dist_search; // 거리검색 허용여부(0-허용(기본값) / 1-불가)
	private Integer name_search; // 이름검색 허용여부(0-허용(기본값) / 1-불가)
	private Integer manager; // 관리자여부(0-일반회원 / 1-관리자)
	private Integer member_state; // 제재상태(0-기본값 / 1-제재회원)
}

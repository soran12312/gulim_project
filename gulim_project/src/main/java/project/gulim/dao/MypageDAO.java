package project.gulim.dao;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.MemberDTO;

@Mapper
public interface MypageDAO {

	public String mypage_password_check(MemberDTO member);

	public MemberDTO find_info(MemberDTO member);
	
}

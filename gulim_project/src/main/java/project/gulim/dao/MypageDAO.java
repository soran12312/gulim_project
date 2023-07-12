package project.gulim.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.MemberDTO;

@Mapper
public interface MypageDAO {

	public String mypage_password_check(MemberDTO member);

	public Map find_info(MemberDTO member);
	public void modify_info(MemberDTO member);
	
}

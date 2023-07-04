package project.gulim.dao;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.MemberDTO;

@Mapper
public interface MainDAO {
	
	public String loginCheck(MemberDTO member);
	public String idCheck(String id);
	public void regist(MemberDTO member);
}

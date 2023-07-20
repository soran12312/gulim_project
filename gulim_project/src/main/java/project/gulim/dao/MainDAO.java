package project.gulim.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.JwtDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.SurveyDTO;

@Mapper
public interface MainDAO {

	public String sLoginCheck(MemberDTO member);

	public String loginCheck(MemberDTO member);

	public String idCheck(String id);

	public void regist(MemberDTO member);

	public MemberDTO selectById(MemberDTO member);

	public void serveyInsert(SurveyDTO servey);
	
	public void insertJWT(JwtDTO jwt);
	
	public String selectRefreshByAccess(String access_token);
	
	public Date selectExpiration(String refresh_token);
	
	public void setJwtStateDiscard(String access_token);
}

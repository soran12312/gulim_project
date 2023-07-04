package project.gulim.service;

import project.gulim.domain.MemberDTO;

public interface MainService {
	
	public String googleLogin(String code);
	public String kakaoLogin(String code);
	public Integer mailCheck(String email);
	public Boolean idCheck(String id);
	public Boolean loginCheck(MemberDTO member);
	public void regist(MemberDTO member);
}

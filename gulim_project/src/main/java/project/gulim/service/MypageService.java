package project.gulim.service;

import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import project.gulim.domain.MemberDTO;

public interface MypageService {
	public Boolean mypage_password_check(MemberDTO member);

	public Map find_info(MemberDTO member);
	public void modify_info(MemberDTO member);

}

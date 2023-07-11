package project.gulim.service;

import org.mindrot.jbcrypt.BCrypt;

import project.gulim.domain.MemberDTO;

public interface MypageService {
	public Boolean mypage_password_check(MemberDTO member);

	public MemberDTO find_info(MemberDTO member);

}

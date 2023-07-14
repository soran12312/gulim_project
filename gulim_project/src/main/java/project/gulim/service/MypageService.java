package project.gulim.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;

public interface MypageService {
	public Boolean mypage_password_check(MemberDTO member);
	public Map find_info(MemberDTO member);
	public void modify_info(MemberDTO member);
	public Integer modify_info_img(HashMap map);
	public String find_info_img(MemberDTO member);
}

package project.gulim.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;

import project.gulim.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDAO mypageDAO;
	
	@Override
	public Boolean mypage_password_check(MemberDTO member) {
		
		String password = mypageDAO.mypage_password_check(member);
		
		if(BCrypt.checkpw(member.getPassword(), password)) return true;
		else return false;
	}
	
	public Map find_info(MemberDTO member) {
		return mypageDAO.find_info(member);
	}
	public void modify_info(MemberDTO member) {
		mypageDAO.modify_info(member);
		
	}
	public Integer modify_info_img(HashMap map) {
		return mypageDAO.modify_info_img(map);
	}
}

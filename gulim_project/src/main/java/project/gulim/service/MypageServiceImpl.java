package project.gulim.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	
	public MemberDTO find_info(MemberDTO member) {
		return mypageDAO.find_info(member);
	}
}

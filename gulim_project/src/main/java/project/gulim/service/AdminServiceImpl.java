package project.gulim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.AdminDAO;
import project.gulim.domain.MemberDTO;
@Service("AdminService")
public class AdminServiceImpl implements AdminService {

	@Autowired	// 의존성 주입: QnaDAO에 사용
	private AdminDAO adminDAO;	// 변수명: 소문자로 시작, DAO 쓰기
	
	public List<MemberDTO> listQuestion(){
		System.out.println(adminDAO.toString());
		return adminDAO.listQuestion();
	}
	
}

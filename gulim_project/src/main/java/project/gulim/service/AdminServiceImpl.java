package project.gulim.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.gulim.dao.AdminDAO;
import project.gulim.domain.BasketDTO;
import project.gulim.domain.CharacterSheetDTO;
import project.gulim.domain.ContestDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.PlaceDTO;
import project.gulim.domain.PostDTO;
import project.gulim.domain.QuestionDTO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired // 의존성 주입: QnaDAO에 사용
	private AdminDAO adminDAO; // 변수명: 소문자로 시작, DAO 쓰기

	public List<QuestionDTO> listQuestion() {
		return adminDAO.listQuestion();
	}

	public void answerQuestion(QuestionDTO qDTO) {
		adminDAO.answerQuestion(qDTO);
	}

	public List<MemberDTO> listMember() {
		return adminDAO.listMember();
	}

	public void changeMemberState(MemberDTO mDTO) {
		adminDAO.changeMemberState(mDTO);
	}

	public List<PlaceDTO> listPlace() {
		return adminDAO.listPlace();
	}

	public List<HashMap> listRefund() {
		return adminDAO.listRefund();
	}

	public void changeDeliveryState(BasketDTO bdto) {
		adminDAO.changeDeliveryState(bdto);
	}

	public List<HashMap> listPost() {
		return adminDAO.listPost();
	}

	public void insertAll(ContestDTO cDTO, PostDTO pDTO, ImageDTO iDTO) {
		adminDAO.insert_1(cDTO);
		adminDAO.insert_2(pDTO);
		adminDAO.insert_3(iDTO);
	}

	public void changePostState(PostDTO pDTO) {
		adminDAO.changePostState(pDTO);
	}

	public List<HashMap> listProduct() {
		return adminDAO.listProduct();
	}
	
	public List<HashMap> playedRuleBook(){
		return adminDAO.playedRuleBook();
	}

	public List<HashMap> playedTime(){
		return adminDAO.playedTime();
	}

	public List<HashMap> playedGm(){
		return adminDAO.playedGm();
	}

	public List<HashMap> playedClass(){
		return adminDAO.playedClass();
	}

	public List<HashMap> playedGenre(){
		return adminDAO.playedGenre();
	}

	public List<HashMap> playedSpecies(){
		return adminDAO.playedSpecies();
	}

	public List<HashMap> wantedGenre(){
		return adminDAO.wantedGenre();
	}

	public List<HashMap> otherSite(){
		return adminDAO.otherSite();
	}

	public List<HashMap> preferredPropensity(){
		return adminDAO.preferredPropensity();
	}

	public List<HashMap> preferredClass(){
		return adminDAO.preferredClass();
	}

	public List<HashMap> preferredSpecies(){
		return adminDAO.preferredSpecies();
	}

	public List<CharacterSheetDTO> classForStats(){
		return adminDAO.classForStats();
	}
	
	public List<HashMap> preferredStatsByClasses(CharacterSheetDTO csDTO){
		return adminDAO.preferredStatsByClasses(csDTO);
	}

}

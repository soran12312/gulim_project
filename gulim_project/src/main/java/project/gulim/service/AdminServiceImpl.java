package project.gulim.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import project.gulim.dao.AdminDAO;
import project.gulim.domain.BasketDTO;
import project.gulim.domain.BookDTO;
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
	
	public String getJwtTokenFromCookies(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String jwtToken = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("access_token")) {
                    jwtToken = cookie.getValue();
                    break;
                }
            }
        }
        return jwtToken;
    }

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
	
	public List<HashMap> salesStatsYear(){
		return adminDAO.salesStatsYear();
	}
	
	public List<HashMap> salesStatsYear_subs(){
		return adminDAO.salesStatsYear_subs();
	}
	
	public List<HashMap> salesStatsYear_book(){
		return adminDAO.salesStatsYear_book();
	}
	
	public List<HashMap> selectYear(){
		return adminDAO.selectYear();
	}
	
	public List<HashMap> selectYear_mon(){
		return adminDAO.selectYear_mon();
	}
	
	public List<HashMap> salesStatsMonth(String purchase_year_mon){
		return adminDAO.salesStatsMonth(purchase_year_mon);
	}
	
	public List<HashMap> salesStatsMonth_subs(String purchase_year_mon){
		return adminDAO.salesStatsMonth_subs(purchase_year_mon);
	}
	
	public List<HashMap> salesStatsMonth_book(String purchase_year_mon){
		return adminDAO.salesStatsMonth_book(purchase_year_mon);
	}
	
	public List<HashMap> salesStatsDay(String purchase_day){
		System.out.println(purchase_day);
		return adminDAO.salesStatsDay(purchase_day);
	}
	
	public List<HashMap> salesStatsDay_subs(String purchase_day){
		System.out.println(purchase_day);
		return adminDAO.salesStatsDay_subs(purchase_day);
	}
	
	public List<HashMap> salesStatsDay_book(String purchase_day){
		return adminDAO.salesStatsDay_book(purchase_day);
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

	public void insertNoContest(PostDTO pDTO, ImageDTO iDTO) {
	        adminDAO.insert_evt_post(pDTO);
	        adminDAO.insert_evt_image(iDTO);
	}
	
	public void insertYesContest(PostDTO pDTO, ImageDTO iDTO, ContestDTO cDTO) {
		adminDAO.insert_con_post(pDTO);
		adminDAO.insert_con_image(iDTO);
		adminDAO.insert_con_contest(cDTO);
	}

	public void changePostState(PostDTO pDTO) {
		adminDAO.changePostState(pDTO);
	}

	public List<HashMap> listProduct() {
		return adminDAO.listProduct();
	}
	
	public HashMap<String, Object> getProduct(BookDTO boDTO){
		return adminDAO.getProduct(boDTO);
	}
	
	public void updateProduct(BookDTO boDTO, ImageDTO iDTO) {
		adminDAO.updateProductBook(boDTO);
		adminDAO.updateProductImage(iDTO);
	}
	
	public void insertProduct(BookDTO boDTO, ImageDTO iDTO) {
		adminDAO.insertProductBook(boDTO);
		adminDAO.insertProductImage(iDTO);
	}
	
	public List<CharacterSheetDTO> classForStats(){
		return adminDAO.classForStats();
	}
	

}

package project.gulim.service;

import java.util.HashMap;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import project.gulim.domain.BasketDTO;
import project.gulim.domain.BookDTO;
import project.gulim.domain.CharacterSheetDTO;
import project.gulim.domain.ContestDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.PlaceDTO;
import project.gulim.domain.PostDTO;
import project.gulim.domain.QuestionDTO;

public interface AdminService {
	
	public String getJwtTokenFromCookies(HttpServletRequest request);

	public List<QuestionDTO> listQuestion();

	public void answerQuestion(QuestionDTO qDTO);

	public List<MemberDTO> listMember();

	public void changeMemberState(MemberDTO mDTO);

	public List<PlaceDTO> listPlace();
	
	public List<HashMap> salesStatsYear();
	
	public List<HashMap> salesStatsYear_subs();
	
	public List<HashMap> salesStatsYear_book();
	
	public List<HashMap> selectYear();
	
	public List<HashMap> selectYear_mon();
	
	public List<HashMap> salesStatsMonth(String purchase_year_mon);
	
	public List<HashMap> salesStatsMonth_subs(String purchase_year_mon);
	
	public List<HashMap> salesStatsMonth_book(String purchase_year_mon);
	
	public List<HashMap> salesStatsDay(String purchase_day);
	
	public List<HashMap> salesStatsDay_subs(String purchase_day);
	
	public List<HashMap> salesStatsDay_book(String purchase_day);

	public List<HashMap> listRefund();

	public void changeDeliveryState(BasketDTO bDTO);

	public List<HashMap> listPost();

	public void insertNoContest(PostDTO pDTO, ImageDTO iDTO);
	
	public void insertYesContest(PostDTO pDTO, ImageDTO iDTO, ContestDTO cDTO);

	public void changePostState(PostDTO pDTO);

	public List<HashMap> listProduct();
	
	public HashMap<String, Object> getProduct(BookDTO boDTO);
	
	public void updateProduct(BookDTO boDTO, ImageDTO iDTO);
	
	public void insertProduct(BookDTO boDTO, ImageDTO iDTO);
	
	public List<CharacterSheetDTO> classForStats();
	
	public Integer manager(String id);
}

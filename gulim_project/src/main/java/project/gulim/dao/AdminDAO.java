package project.gulim.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.BasketDTO;
import project.gulim.domain.BookDTO;
import project.gulim.domain.CharacterSheetDTO;
import project.gulim.domain.ContestDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.PlaceDTO;
import project.gulim.domain.PostDTO;
import project.gulim.domain.QuestionDTO;

@Mapper
public interface AdminDAO {
	public List<QuestionDTO> listQuestion();

	public void answerQuestion(QuestionDTO qDTO);

	public List<MemberDTO> listMember();

	public void changeMemberState(MemberDTO mDTO);

	public List<PlaceDTO> listPlace();
	
	public List<HashMap> salesStatsYear();
	
	public List<HashMap> salesStatsYear_subs();
	
	public List<HashMap> salesStatsYear_book();
	
	public List<HashMap> selectYear();
	
	public List<HashMap> salesStatsQuarter(String purchase_year_qua);
	
	public List<HashMap> selectYear_mon();
	
	public List<HashMap> salesStatsMonth(String purchase_year_mon);
	
	public List<HashMap> salesStatsMonth_subs(String purchase_year_mon);
	
	public List<HashMap> salesStatsMonth_book(String purchase_year_mon);

	public List<HashMap> salesStatsDay(String purchase_day);
	
	public List<HashMap> listRefund();

	public void changeDeliveryState(BasketDTO bDTO);

	public List<HashMap> listPost();

	public void changePostState(PostDTO pDTO);

	public List<HashMap> listProduct();
	
	public HashMap<String, Object> getProduct(BookDTO boDTO);
	
	public void updateProductBook(BookDTO boDTO);

	public void updateProductImage(ImageDTO iDTO);
	
	public void insertProductBook(BookDTO boDTO);
	
	public void insertProductImage(ImageDTO iDTO);

	public void insert_evt_post(PostDTO pDTO);

	public void insert_evt_image(ImageDTO iDTO);
	
	public void insert_con_post(PostDTO pDTO);
	
	public void insert_con_image(ImageDTO iDTO);
	
	public void insert_con_contest(ContestDTO cDTO);
	
	public List<CharacterSheetDTO> classForStats();
	
}

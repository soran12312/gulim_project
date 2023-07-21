package project.gulim.service;

import java.util.HashMap;
import java.util.List;

import project.gulim.domain.BasketDTO;
import project.gulim.domain.CharacterSheetDTO;
import project.gulim.domain.ContestDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.PlaceDTO;
import project.gulim.domain.PostDTO;
import project.gulim.domain.QuestionDTO;
import project.gulim.domain.SubscribeDTO;

public interface AdminService {

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

	public List<HashMap> listRefund();

	public void changeDeliveryState(BasketDTO bDTO);

	public List<HashMap> listPost();

	public void changePostState(PostDTO pDTO);

	public List<HashMap> listProduct();

	public void insertAll(ContestDTO cDTO, PostDTO pDTO, ImageDTO iDTO);
	
	public List<HashMap> playedRuleBook();
	
	public List<HashMap> playedTime();
	
	public List<HashMap> playedGm();
	
	public List<HashMap> playedClass();
	
	public List<HashMap> playedGenre();
	
	public List<HashMap> playedSpecies();
	
	public List<HashMap> wantedGenre();
	
	public List<HashMap> otherSite();
	
	public List<HashMap> preferredPropensity();
	
	public List<HashMap> preferredClass();
	
	public List<HashMap> preferredSpecies();
	
	public List<CharacterSheetDTO> classForStats();
	
	public List<HashMap> preferredStatsByClasses(CharacterSheetDTO csDTO);
}

package project.gulim.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.BasketDTO;
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
	public List<HashMap> listRefund();
	public void changeDeliveryState(BasketDTO bDTO);
	public List<HashMap> listPost();
	public void changePostState(PostDTO pDTO);
	public List<HashMap> listProduct();
	public void insert_1(ContestDTO cDTO);
	public void insert_2(PostDTO pDTO);
	public void insert_3(ImageDTO iDTO);
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
	public List<HashMap> preferredStatsBySpecies();
}

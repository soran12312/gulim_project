package project.gulim.service;

import java.util.HashMap;
import java.util.List;

import project.gulim.domain.BasketDTO;
import project.gulim.domain.ContestDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.MemberDTO;
import project.gulim.domain.PlaceDTO;
import project.gulim.domain.PostDTO;
import project.gulim.domain.QuestionDTO;

public interface AdminService {
	
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
	public void insertAll(ContestDTO cDTO, PostDTO pDTO, ImageDTO iDTO);
}

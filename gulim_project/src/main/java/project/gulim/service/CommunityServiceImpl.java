package project.gulim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import project.gulim.dao.CommunityDAO;
import project.gulim.domain.PostDTO;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private final CommunityDAO communityDAO;
	
	/**
     * 게시글 저장
     * @param params - 게시글 정보
     * @return Generated PK
     */
	public void savePost(PostDTO params) {
		// TODO Auto-generated method stub
		
		communityDAO.save(params);
	}

	

	/**
	 * 게시글 상세정보 조회
	 * @param post_num
	 * @return 게시글 상세정보
	 */

	@Override
	public PostDTO findPostById(Integer post_num) {
		// TODO Auto-generated method stub
		return communityDAO.findByNum(post_num);
	}

	
	/**
     * 게시글 수정
     * @param params - 게시글 정보
     * @return PK
     */
	@Override
	public void updatePost(PostDTO params) {
		// TODO Auto-generated method stub
		communityDAO.update(params);;
	}

	
	 /**
     * 게시글 삭제
     * @param post_num - PK
     * @return PK
     */
	@Override
	public int deletePost(Integer post_num) {
		// TODO Auto-generated method stub
		communityDAO.deleteByPostNum(post_num);
		return post_num;
	}

	
	/**
     * 게시글 리스트 조회
     * @return 게시글 리스트
     */
	@Override
	public List<PostDTO> findAllPost() {
		// TODO Auto-generated method stub
		return communityDAO.findAll();
	}



	@Override
	public void insertImgByPath(String path) {
		// TODO Auto-generated method stub
		communityDAO.insertImgByPath(path);
	}
	
	

}

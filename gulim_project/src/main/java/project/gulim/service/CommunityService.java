package project.gulim.service;

import java.util.List;

import project.gulim.domain.PostDTO;

public interface CommunityService {
	
	// 게시글 저장
	public void savePost(final PostDTO params);
	
	// 게시글 상세정보 조회
	public PostDTO findPostById(final Integer post_num);
	
	// 게시글 수정
	public void updatePost(final PostDTO params);
	
	// 게시글 삭제
	public int deletePost(final Integer post_num);
	
	
	//게시글 리스트 조회
	public List<PostDTO> findAllPost();
	
	// 이미지 저장
	public void insertImgByPath(String path);
	
}

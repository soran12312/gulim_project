package project.gulim.service;

import java.util.List;

import project.gulim.domain.ImageDTO;
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
	
	// 게시글 수 
	public int countAllPosts();
	
	
	//게시글 리스트 조회
	public List<PostDTO> findAllPost();
	
	
	
	
	// 공지사항 리스트 조회
	public List<PostDTO> findAllAnnounce();

	/**
	 * 게시글 리스트 조회
	 * @return 게시글 리스트
	 */
	List<PostDTO> findPostsByPage(int start, int size);

	// 이미지 저장
	public void saveImage(ImageDTO img);
	
}

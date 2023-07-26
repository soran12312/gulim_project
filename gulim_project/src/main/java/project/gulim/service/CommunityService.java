package project.gulim.service;

import java.util.HashMap;
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
	public List<HashMap> findAllAnnounce();

	/**
	 * 게시글 리스트 조회
	 * @return 게시글 리스트
	 */
	List<PostDTO> findPostsByPage(int start, int size);

	// 이미지 저장
	public void saveImage(ImageDTO imge);

	// 해당 게시글 이미지
	public List<ImageDTO> findImagesByPostNum(Integer post_num);

	// 게시글 이미지 수정
	public List<ImageDTO> updateImage(ImageDTO img);

	// 이벤트 리스트 조회
	public List<PostDTO> findAllEvent();

	// 이벤트 이미지 조회
	public List<ImageDTO> findEventImg();

	// 공지사항 이미지 조회
	public List<ImageDTO> findAllAnnounceImg();

	
}

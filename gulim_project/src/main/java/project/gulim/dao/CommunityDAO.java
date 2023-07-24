package project.gulim.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.ImageDTO;
import project.gulim.domain.PostDTO;

@Mapper
public interface CommunityDAO {
	
	/**
     * 게시글 저장
     * @param params - 게시글 정보
     */
    public void save(PostDTO params) ;
	

    /**
     * 게시글 상세정보 조회
     * @param post_num
     * @return 게시글 상세정보
     */
    PostDTO findByNum(Integer post_num);
    
    /**
     * 게시글 수정
     * @param params - 게시글 정보
     */
    void update(PostDTO params);

    /**
     * 게시글 삭제
     * @param id - PK
     */
    void deleteByPostNum(Integer post_num);

    /**
     * 게시글 리스트 조회
     * @param size 
     * @param start 
     * @return 게시글 리스트
     */
    List<PostDTO> findAll(int start, int size);

    /**
     * 게시글 수 카운팅
     * @return 게시글 수
     */
    int count();

    // 이미지 저장
    public void saveImage(ImageDTO img);


	// 공지사항 조회
	public List<PostDTO> findAnnounce();
	
	// 이벤트 조회
	public List<PostDTO> findEvent();

	
	// 해당 게시글 이미지
	public List<ImageDTO> findImagesByPostNum(Integer post_num);


	public List<ImageDTO> updateImage(ImageDTO img);

	
	// event list
	public List<PostDTO> findAllEvent();

	
	// event img list
	public List<ImageDTO> findEventImg();


	// 공지사항 이미지
	public List<ImageDTO> findAllAnnounceImg();


	
}

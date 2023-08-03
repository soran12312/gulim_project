package project.gulim.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.servlet.ServletContext;
import lombok.RequiredArgsConstructor;
import project.gulim.dao.CommunityDAO;
import project.gulim.domain.ContestDTO;
import project.gulim.domain.ImageDTO;
import project.gulim.domain.PostDTO;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private final CommunityDAO communityDAO;
	@Autowired
	private ServletContext servletContext;
	
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
	public List<PostDTO> findPostsByPage(int start, int size) {
		// TODO Auto-generated method stub
		return communityDAO.findAll(start, size);
	}



	// 공지
	@Override
	public List<HashMap> findAllAnnounce(int start, int size) {
		// TODO Auto-generated method stub
		return communityDAO.findAnnounce(start, size);
	}


	/**
     * 게시글 수 조회
     * @return 게시글 수
     */
	@Override
	public int countAllPosts() {
		// TODO Auto-generated method stub
		return communityDAO.count();
	}



	@Override
	public List<PostDTO> findAllPost() {
		// TODO Auto-generated method stub
		return null;
	}


	@Transactional
	@Override
	public void saveImage(ImageDTO imge) {
		// TODO Auto-generated method stub
//		if (CollectionUtils.isEmpty(imges)) {
//            return;
//        }
//		for (ImageDTO image : imges) 
//		{
//			image.setPost_num(post_num);
//        }
		
		communityDAO.saveImage(imge);
	}



	@Override
	public List<ImageDTO> findImagesByPostNum(Integer post_num) {
		return communityDAO.findImagesByPostNum(post_num);
	}



	@Override
	public List<ImageDTO> updateImage(ImageDTO img) {
		// TODO Auto-generated method stub
		return communityDAO.updateImage(img);
	}



	// 이벤트 게시글 리스트
	@Override
	public List<PostDTO> findAllEvent(int start, int size) {
		// TODO Auto-generated method stub
		return communityDAO.findAllEvent();
	}



	@Override
	public List<ImageDTO> findEventImg() {
		// TODO Auto-generated method stub
		return communityDAO.findEventImg();
	}



	// 공지사항 이미지 조회
	@Override
	public List<ImageDTO> findAllAnnounceImg() {
		// TODO Auto-generated method stub
		return communityDAO.findAllAnnounceImg();
	}



	// 이미지 삭제
	@Override
	public void deleteImageById(Integer img_num) {
		// TODO Auto-generated method stub
		communityDAO.deleteImageById(img_num);
	}


	// 이미지 
	@Override
	public List<ImageDTO> getImagesByPostId(Integer post_num) {
		// TODO Auto-generated method stub
		return communityDAO.getImagesByPostId(post_num);
	}



	// 이벤트 게시글 수
	@Override
	public int countAllEventPosts() {
		// TODO Auto-generated method stub
		return communityDAO.countEvent();
	}



	
	
	// 공모전 게시글 수
	@Override
	public int countAllContestPosts() {
		// TODO Auto-generated method stub
		return communityDAO.countContest();
	}



	// 공모전 리스트 조회
	@Override
	public List<Map> findAllContest(int start, int size) {
		// TODO Auto-generated method stub
		return communityDAO.findAllContest(start, size);
	}



	@Override
	public int countAllAnnounce() {
		// TODO Auto-generated method stub
		return communityDAO.countAnnounce();
	}



	@Override
	public ContestDTO findContest(Integer contest_num) {
		// TODO Auto-generated method stub
		return communityDAO.findContest(contest_num);
	}
	
	
	
	
	
}

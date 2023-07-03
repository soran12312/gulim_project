package project.gulim.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.MemberDTO;


@Mapper
public interface AdminDAO {
	List<MemberDTO> listQuestion();
}

package project.gulim.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {
	
	public String loginCheck();
}

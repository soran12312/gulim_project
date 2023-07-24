package project.gulim.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SaleDAO {

	public List<Map>sales();
	
	
}

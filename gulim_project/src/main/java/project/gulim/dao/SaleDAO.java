package project.gulim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.BookDTO;

@Mapper
public interface SaleDAO {

	public List<Map>sales();
	
	public List<HashMap> product_detail(BookDTO book);
	
}

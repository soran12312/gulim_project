package project.gulim.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import project.gulim.domain.PlaceDTO;

@Mapper
public interface OfflineDAO {

	public List<PlaceDTO> mapMarker(PlaceDTO vo);

	public List<PlaceDTO> showPartnership(PlaceDTO vo);
}

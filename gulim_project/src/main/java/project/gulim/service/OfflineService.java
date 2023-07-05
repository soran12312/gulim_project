package project.gulim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.gulim.dao.OfflineDAO;
import project.gulim.domain.PlaceDTO;

@Service
public class OfflineService {
	
	@Autowired
	private OfflineDAO offlineDAO;
	
	public List<PlaceDTO> getMarker(PlaceDTO vo){
		
		return offlineDAO.mapMarker(vo);
	}
	
	public List<PlaceDTO> showPartnership(PlaceDTO vo){
		return offlineDAO.showPartnership(vo);
	}
	
	
	
}

package com.zoomin.www.reserve.service;

import java.util.List;

import com.zoomin.www.dto.ReserveDTO;

public interface ReserveService {

	public void reserveWriteOK(ReserveDTO dto) throws Exception;
	public List<ReserveDTO> listOfArtist(int no) throws Exception;
	public List<ReserveDTO> listOfGeneral(String id) throws Exception;
	public ReserveDTO reserveView(int no) throws Exception;
	public void updateStatus(ReserveDTO dto) throws Exception;
	public void reserveModify(ReserveDTO dto) throws Exception;
	public void reserveDelete(int no) throws Exception;
	public List<ReserveDTO> completeReserve(String id) throws Exception;
	
	
}

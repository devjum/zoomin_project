package com.zoomin.www.reserve.dao;

import java.util.ArrayList;
import java.util.List;

import com.zoomin.www.dto.ReserveDTO;

public interface ReserveMapper {

	public void reserveWriteOK(ReserveDTO dto);
	public List<ReserveDTO> listOfGeneral(String id);
	public List<ReserveDTO> listOfArtist(int no);
	public ReserveDTO reserveView(int no);
	public void updateStatus(ReserveDTO dto);
	public void reserveModify(ReserveDTO dto);
	public void reserveDelete(int no);
	public List<ReserveDTO> completeReserve(String id);

}

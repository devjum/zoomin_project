package com.zoomin.www.talent.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.TalentDTO;

public interface TalentMapper {

	public List<TalentDTO> talentList(TalentDTO dto);
	public TalentDTO talentView(int no);
	public int talentExist(String id);
	public int getTalentNo(String id);
	public void talentModifyOK(TalentDTO dto);
	public void filesUpload(TalentDTO dto);
	public void uploadThumb(TalentDTO dto);
	public void talentWrite(TalentDTO dto);
	public void talentDelete(String id);
	public String getFileMultiName(String id);
	public String getThumbName(String id);
	public void updateAvg(int no);
	public int listCnt(TalentDTO dto);

}

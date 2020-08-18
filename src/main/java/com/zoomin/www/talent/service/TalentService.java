package com.zoomin.www.talent.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.TalentDTO;

public interface TalentService {

	public List<TalentDTO> talentList(TalentDTO dto) throws Exception;
	public TalentDTO talentView(int no) throws Exception;
	public int talentExist(String id) throws Exception;
	public int getTalentNo(String id) throws Exception;
	public void talentModifyOK(HttpServletRequest request, TalentDTO dto) throws Exception;
	public void talentWrite(HttpServletRequest request,TalentDTO dto) throws Exception;
	public void talentDelete(String id) throws Exception;
	public TalentDTO listCnt(TalentDTO dto) throws Exception;
}

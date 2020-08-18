package com.zoomin.www.talent.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.TalentDTO;
import com.zoomin.www.review.dao.ReviewDAO;
import com.zoomin.www.talent.dao.TalentDAO;

@Service
public class TalentServiceImpl implements TalentService {

	@Autowired
	private TalentDAO dao;
	
	@Autowired
	private ReviewDAO reviewDao;
	
	@Resource(name = "uploadPath")
	private String uploadPath;

	@Override
	public List<TalentDTO> talentList(TalentDTO dto) throws Exception {
		//null check
		if(dto.getSearchCondition()==null) {
			dto.setSearchCondition("searchName");
		}
		if(dto.getSearchKeyword()==null) {
			dto.setSearchKeyword("");
		}
		String [] chks = dto.getSearchChk();
		String chksStr = null;
		if(chks!=null) {
			for(int i=0; i<chks.length; i++) {
				if(chksStr=="") chksStr = chks[i];
				else chksStr = chksStr+"|"+chks[i];
			} if(chksStr.equals("all")) chksStr = null;
		} else {
			chksStr = null;
		} dto.setSearchCategorizeStr(chksStr);
		return dao.talentList(dto);
	}


	@Override
	public TalentDTO talentView(int no) throws Exception {
		System.out.println("ServiceImpl : talentView() 실행");
		TalentDTO dto = dao.talentView(no);
		return dto;
	}


	@Override
	public int talentExist(String id) throws Exception {
		System.out.println("ServiceImpl : talentExist() 실행");
		return dao.talentExist(id);
	}


	@Override
	public int getTalentNo(String id) throws Exception {
		System.out.println("ServiceImpl : getTalentNo() 실행");
		return dao.getTalentNo(id);
	}

	@Override
	public void talentModifyOK(HttpServletRequest request, TalentDTO dto) throws Exception {
		System.out.println("ServiceImpl : talentModifyOK() 실행");
		String root_path = request.getSession().getServletContext().getRealPath("/");  
		
		//이미지 다중 등록
		String fileOriginName = ""; 
		String fileMultiName = "";
		MultipartFile [] files = dto.getFiles();
		if(files[0].getOriginalFilename()=="") {
			fileMultiName = dao.getFileMultiName(dto.getId());
			
		} else {
			for(int i=0; i<files.length; i++) {
				fileOriginName = files[i].getOriginalFilename();
				SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i); 
				Calendar now = Calendar.getInstance();
	
				//확장자명
				String extension = fileOriginName.split("\\.")[1];
	
				//fileOriginName에 날짜+.+확장자명으로 저장
				fileOriginName = formatter.format(now.getTime())+"."+extension;
				
				files[i].transferTo(new File(uploadPath+"/"+fileOriginName));
				if(i==0) {
					fileMultiName += fileOriginName;
				}
				else {
					fileMultiName+= "," + fileOriginName;
				}
			}
		}
		
		//대표이미지 등록
		MultipartFile thumb = dto.getThumbImg();
		String fileName = null;
		if(!thumb.isEmpty()) {
			fileName = thumb.getOriginalFilename();
			thumb.transferTo(new File(uploadPath+"/"+fileName));
			
		} else {
			fileName = dao.getThumbName(dto.getId());
		}
		dto.setThumbName(fileName);
		dto.setFileMultiName(fileMultiName);
		dao.talentModifyOK(dto);
	}



	@Override
	public void talentWrite(HttpServletRequest request,TalentDTO dto) throws Exception {
		String root_path = request.getSession().getServletContext().getRealPath("/");  
		//이미지 다중 등록
		String fileOriginName = ""; 
		String fileMultiName = "";
		MultipartFile [] files = dto.getFiles();
		System.out.println("files[0].getOriginalFilename:"+files[0].getOriginalFilename());
		if(files[0].getOriginalFilename()=="") {
			dto.setFileMultiName(null);
		} else{
			for(int i=0; i<files.length; i++) {
				fileOriginName = files[i].getOriginalFilename();
				SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i); 
				Calendar now = Calendar.getInstance();
						
				//확장자명
				String extension = fileOriginName.split("\\.")[1];
						
				//fileOriginName에 날짜+.+확장자명으로 저장
				fileOriginName = formatter.format(now.getTime())+"."+extension;
						
				files[i].transferTo(new File(uploadPath+"/"+fileOriginName));
				if(i==0) {fileMultiName += fileOriginName;}
				else {fileMultiName+= "," + fileOriginName;}
			}
			dto.setFileMultiName(fileMultiName);
		}
		//대표이미지 등록
		MultipartFile thumb = dto.getThumbImg();
		if(!thumb.isEmpty()) {
			String fileName = thumb.getOriginalFilename();
			thumb.transferTo(new File(uploadPath+"/"+fileName));
			dto.setThumbName(fileName);
		}
		dao.talentWrite(dto);
	}


	@Override
	public void talentDelete(String id) throws Exception {
		dao.talentDelete(id);
	}


	@Override
	public TalentDTO listCnt(TalentDTO dto) throws Exception {
		int totalPage = 0;


		dto.setTotalCnt(dao.listCnt(dto));
		totalPage = dto.getTotalCnt()/9;
		if(dto.getTotalCnt()%9==0) {
			totalPage--;
		}
		if(totalPage>0) dto.setTotalpage(totalPage);
		return dto;
	}
	
	
	
}

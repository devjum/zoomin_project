package com.zoomin.www.inquiry.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.InquiryDTO;
import com.zoomin.www.dto.UserDTO;
import com.zoomin.www.inquiry.dao.InquiryDAO;

@Service
public class InquiryServiceImpl implements InquiryService {
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	private InquiryDAO dao;

	@Override
	public void inquiryWrite(HttpServletRequest request, InquiryDTO dto) throws Exception {
		HttpSession session = request.getSession();
		UserDTO userDto = (UserDTO)session.getAttribute("userInfo");
		dto.setId(userDto.getId());
		String root_path = request.getSession().getServletContext().getRealPath("/");  
		//이미지 다중 등록
		MultipartFile attachFile = dto.getFile();
		if(!attachFile.isEmpty()) {
			String fileOriginName = attachFile.getOriginalFilename();
			SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS"); 
			Calendar now = Calendar.getInstance();
					
			//확장자명
			String extension = fileOriginName.split("\\.")[1];
					
			//fileOriginName에 날짜+.+확장자명으로 저장
			fileOriginName = formatter.format(now.getTime())+"."+extension;
					
			attachFile.transferTo(new File(uploadPath+"/"+fileOriginName));
			dto.setFilename(fileOriginName);
		}
		dao.inquiryWrite(dto);
	}

	@Override
	public List<InquiryDTO> myInquiryList(String id) throws Exception {
		return dao.myInquiryList(id);
	}

	@Override
	public InquiryDTO inquiryView(int no) throws Exception {
		return dao.inquiryView(no);
	}
	
	@Override
	public InquiryDTO inquiryViewByGroupnum(int no) throws Exception {
		return dao.inquiryViewByGroupnum(no);
	}

	@Override
	public void inquiryModify(HttpServletRequest request, InquiryDTO dto) throws Exception {
		HttpSession session = request.getSession();
		UserDTO userDto = (UserDTO)session.getAttribute("userInfo");
		dto.setId(userDto.getId());
		System.out.println("fileName:"+dto.getFilename());
		System.out.println("attachFile:"+dto.getFile().isEmpty());
		String root_path = request.getSession().getServletContext().getRealPath("/");  
		//이미지 다중 등록
		MultipartFile attachFile = dto.getFile();
		if(!attachFile.isEmpty()) {
			String fileOriginName = attachFile.getOriginalFilename();
			SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS"); 
			Calendar now = Calendar.getInstance();
					
			//확장자명
			String extension = fileOriginName.split("\\.")[1];
					
			//fileOriginName에 날짜+.+확장자명으로 저장
			fileOriginName = formatter.format(now.getTime())+"."+extension;
					
			attachFile.transferTo(new File(uploadPath+"/"+fileOriginName));
			dto.setFilename(fileOriginName);
		}
		dao.inquiryModify(dto);
	}

	@Override
	public void inquiryDelete(int no) throws Exception {
		dao.inquiryDelete(no);
	}

	@Override
	public List<InquiryDTO> allInquiryList() throws Exception {
		return dao.allInquiryList();
	}

	@Override
	public void inquiryReOK(InquiryDTO dto) throws Exception {
		dao.inquiryReOK(dto);
	}

	@Override
	public void replyUp(int no) throws Exception {
		dao.replyUp(no);
	}


	

	

	
	
}

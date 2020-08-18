package com.zoomin.www.inquiry.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zoomin.www.dto.InquiryDTO;

public interface InquiryService {

	public void inquiryWrite(HttpServletRequest request,InquiryDTO dto) throws Exception;
	public List<InquiryDTO> myInquiryList(String id) throws Exception;
	public InquiryDTO inquiryView(int no) throws Exception;
	public InquiryDTO inquiryViewByGroupnum(int no) throws Exception;
	public void inquiryModify(HttpServletRequest request,InquiryDTO dto) throws Exception;
	public void inquiryDelete(int no) throws Exception;
	public List<InquiryDTO> allInquiryList() throws Exception;
	public void inquiryReOK(InquiryDTO dto) throws Exception;
	public void replyUp(int no) throws Exception;
	
}

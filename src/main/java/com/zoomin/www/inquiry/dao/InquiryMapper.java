package com.zoomin.www.inquiry.dao;

import java.util.List;

import com.zoomin.www.dto.InquiryDTO;

public interface InquiryMapper {

	public void inquiryWrite(InquiryDTO dto) throws Exception;
	public List<InquiryDTO> myInquiryList(String id) throws Exception;
	public InquiryDTO inquiryView(int no) throws Exception;
	public InquiryDTO inquiryViewByGroupnum(int no) throws Exception;
	public void inquiryModify(InquiryDTO dto) throws Exception;
	public void inquiryDelete(int no) throws Exception;
	public List<InquiryDTO> allInquiryList() throws Exception;
	public void inquiryReOK(InquiryDTO dto) throws Exception;
	public void replyUp(int no) throws Exception;
	
}

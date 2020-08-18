package com.zoomin.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zoomin.www.dto.InquiryDTO;
import com.zoomin.www.dto.UserDTO;
import com.zoomin.www.inquiry.service.InquiryServiceImpl;

@Controller
public class InquiryController {

	@Autowired
	private InquiryServiceImpl iService;
	
	@RequestMapping("/Inquiry/inquiryList.do")
	public String inquiryList(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		UserDTO userInfo = (UserDTO)session.getAttribute("userInfo");
		model.addAttribute("list",iService.myInquiryList(userInfo.getId()));
		return "Inquiry/inquiryList";
	}
	
	@RequestMapping("/Inquiry/inquiryWrite.do")
	public String inquiryWrite() throws Exception {
		return "Inquiry/inquiryWrite";
	}
	
	@RequestMapping("/Inquiry/inquiryWriteOK.do")
	public String reserveWriteOK(HttpServletRequest request,@ModelAttribute("dto") InquiryDTO dto) throws Exception {
		iService.inquiryWrite(request,dto);
		return "redirect:../Inquiry/inquiryList.do";
	}
	
	@RequestMapping("/Inquiry/inquiryView.do")
	public String reserveView(@RequestParam("no") int no, Model model) throws Exception {
		model.addAttribute("dto",iService.inquiryView(no));
		return "Inquiry/inquiryView";
	}
	
	@RequestMapping("/Inquiry/inquiryModify.do")
	public String inquiryModify(@RequestParam("no") int no, Model model) throws Exception {
		model.addAttribute("dto",iService.inquiryView(no));
		return "Inquiry/inquiryModify";
	}
	
	@RequestMapping("/Inquiry/inquiryModifyOK.do")
	public String inquiryModifyOK(HttpServletRequest request,@ModelAttribute("dto") InquiryDTO dto) throws Exception {
		iService.inquiryModify(request,dto);
		return "redirect:../Inquiry/inquiryList.do";
	}
	
	@RequestMapping("/Inquiry/inquiryDelete.do")
	public String inquiryDelete(@RequestParam("no") int no) throws Exception {
		iService.inquiryDelete(no);
		return "redirect:../Inquiry/inquiryList.do";
	}
}

package com.zoomin.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zoomin.www.dto.TalentDTO;
import com.zoomin.www.dto.UserDTO;
import com.zoomin.www.review.service.ReviewServiceImpl;
import com.zoomin.www.talent.service.TalentServiceImpl;
import com.zoomin.www.user.service.UserServiceImpl;

@Controller
public class TalentController {
	@Autowired
	private TalentServiceImpl tService;
	
	@Autowired
	private UserServiceImpl uService;
	
	@Autowired
	private ReviewServiceImpl rService;
	
	public UserDTO getSessionUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserDTO user = (UserDTO)session.getAttribute("userInfo");
		return user;
	}
	
	@RequestMapping("/Talent/talentList.do")
	public String talentList(TalentDTO dto,Model model) throws Exception {
		dto.setPageNo(dto.getCurpage()*9);
		dto.setLimitCnt(9);
		model.addAttribute("list",tService.talentList(dto));
		model.addAttribute("search",dto);
		model.addAttribute("pageCnt",tService.listCnt(dto));
		return "Talent/talentList";
	}
	
	@RequestMapping("/Talent/talentView.do")
	public String talentView(@RequestParam("no") int no, Model model) throws Exception {
		TalentDTO dto = tService.talentView(no);
		model.addAttribute("dto",dto);
		System.out.println("fileMultiname:"+dto.getFileMultiName());
		if(dto.getFileMultiName()!=null) {
			String[] files = dto.getFileMultiName().split(",");
			model.addAttribute("files",files);
		}
		model.addAttribute("review",rService.talentReview(no));
		return "Talent/talentView";
	}
	
	@RequestMapping("/Talent/talentModify.do")
	public String talentModify(HttpServletRequest request, Model model) throws Exception {
		int t_no = tService.getTalentNo(getSessionUser(request).getId());
		model.addAttribute("dto",tService.talentView(t_no));
		return "Talent/talentModify";
	}
	
	@RequestMapping("/Talent/talentModifyOK.do")
	public String talentModifyOK(HttpServletRequest request, @ModelAttribute("dto") TalentDTO dto) throws Exception {
		int t_no = tService.getTalentNo(getSessionUser(request).getId());
		dto.setId(getSessionUser(request).getId());
		tService.talentModifyOK(request,dto);
		return "redirect:talentView.do?no="+t_no;
	}
	
	@RequestMapping("/Talent/talentWrite.do")
	public String talentWrite() throws Exception {
		return "Talent/talentWrite";
	}
	
	@RequestMapping("/Talent/talentWriteOK.do")
	public String talentWriteOK(HttpServletRequest request, @ModelAttribute("dto") TalentDTO dto) throws Exception{
		dto.setId(getSessionUser(request).getId());
		tService.talentWrite(request,dto);
		int t_no = tService.getTalentNo(dto.getId());
		return "redirect:../Talent/talentView.do?no="+t_no;
	}
	
	@RequestMapping("/Talent/talentDelete.do")
	public String talentDelete(HttpServletRequest request) throws Exception{
		String id=getSessionUser(request).getId();
		tService.talentDelete(id);
		return "redirect:../User/mypage.do";
	}
}

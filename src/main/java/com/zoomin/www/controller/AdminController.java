package com.zoomin.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zoomin.www.admin.service.AdminServiceImpl;
import com.zoomin.www.dto.InquiryDTO;
import com.zoomin.www.dto.TalentDTO;
import com.zoomin.www.dto.UserDTO;
import com.zoomin.www.inquiry.service.InquiryServiceImpl;
import com.zoomin.www.talent.service.TalentServiceImpl;
import com.zoomin.www.user.service.UserServiceImpl;


@Controller
public class AdminController {
	
	@Autowired
	private AdminServiceImpl aService;
	
	@Autowired
	private InquiryServiceImpl iService;
	
	@Autowired
	private UserServiceImpl uService;
	
	@Autowired
	private TalentServiceImpl tService;
	
	@RequestMapping("/Admin/admin.do")
	public String adminIndex(Model model) throws Exception{
		model.addAttribute("index",aService.adminIndex());
		model.addAttribute("graph",aService.adminGraph());
		model.addAttribute("inquiryList",iService.allInquiryList());
		model.addAttribute("artistList",uService.recentArtist());
		return "Admin/adminIndex";
	}
	
	@RequestMapping("/Admin/adminLogin.do")
	public String adminLogin() throws Exception {
		return "Admin/adminLogin";
	}
	
	@RequestMapping("/Admin/adminLoginOK.do")
	public String adminLogin(HttpServletRequest request, @ModelAttribute("dto") UserDTO dto) throws Exception{
		UserDTO login = aService.adminLogin(dto);
		if(login!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", login);
			return "redirect:../Admin/admin.do";
		}
		else {
			return "redirect:../Admin/adminLogin.do?loginChk=N";
		}
	}
	
	@RequestMapping("/Admin/userAdmin.do")
	public String userAdmin(@ModelAttribute("dto") UserDTO dto, Model model) throws Exception{
		//null check
		if(dto.getSearchCondition()==null) {
			dto.setSearchCondition("searchId");
		}
		if(dto.getSearchKeyword()==null) {
			dto.setSearchKeyword("");
		}
		model.addAttribute("allUserList",uService.allUser(dto));
		model.addAttribute("search",dto);
		model.addAttribute("pageCnt",uService.userCnt(dto));
		return "Admin/userAdmin";
	}
	
	@RequestMapping("/Admin/artistAdmin.do")
	public String artistAdmin(@ModelAttribute("dto") UserDTO dto, Model model) throws Exception{
		//null check
		if(dto.getSearchCondition()==null) {
			dto.setSearchCondition("searchId");
		}
		if(dto.getSearchKeyword()==null) {
			dto.setSearchKeyword("");
		}
		model.addAttribute("artistUserList",uService.artistUser(dto));
		model.addAttribute("search",dto);
		model.addAttribute("pageCnt",uService.artistCnt(dto));
		return "Admin/artistAdmin";
	}
	
	@RequestMapping("/Admin/generalAdmin.do")
	public String generalAdmin(@ModelAttribute("dto") UserDTO dto, Model model) throws Exception{
		//null check
		if(dto.getSearchCondition()==null) {
			dto.setSearchCondition("searchId");
		}
		if(dto.getSearchKeyword()==null) {
			dto.setSearchKeyword("");
		}
		model.addAttribute("generalUserList",uService.generalUser(dto));
		model.addAttribute("search",dto);
		model.addAttribute("pageCnt",uService.generalCnt(dto));
		return "Admin/generalAdmin";
	}
	
	@RequestMapping("/Admin/userModify.do")
	public String userModify(@RequestParam("id") String id, Model model) throws Exception {
		model.addAttribute("userModifyInfo",aService.getUserInfo(id));
		return "Admin/userModify";
	}
	
	@RequestMapping("/Admin/userModifyOK.do")
	public String userModifyOK(@ModelAttribute("dto") UserDTO dto) throws Exception {
		uService.modifyInOK(dto);
		return "redirect:../Admin/userAdmin.do";
	}
	
	@RequestMapping("/Admin/userDelete.do")
	public String userDelete(String id) throws Exception {
		uService.dropUser(id);
		return "redirect:../Admin/userAdmin.do";
	}
	
	@RequestMapping("/Admin/selectUserDelete.do")
	public String selectUserDelete(@RequestParam("checks") String [] chks) throws Exception {
		for(int i=0; i<chks.length; i++) {
			uService.dropUser(chks[i]);
		}
		return "redirect:../Admin/userAdmin.do";
	}
	
	@RequestMapping("/Admin/bInquiry.do")
	public String bInquiry( Model model) throws Exception {
		model.addAttribute("inquiryList", iService.allInquiryList());
		return "Admin/bInquiry";
	}
	
	@RequestMapping("/Admin/bTalent.do")
	public String bTalent(@ModelAttribute("dto") TalentDTO dto, Model model) throws Exception {
		dto.setPageNo(dto.getCurpage()*10);
		dto.setLimitCnt(10);
		model.addAttribute("talentList", tService.talentList(dto) );
		model.addAttribute("search", dto);
		model.addAttribute("pageCnt", tService.listCnt(dto));
		return "Admin/bTalent";
	}
	
	@RequestMapping("/Admin/talentDelete.do")
	public String talentDelete(String id) throws Exception{
		tService.talentDelete(id);
		return "redirect:../Admin/bTalent.do";
	}
	
	@RequestMapping("/Admin/selectTalentDelete.do")
	public String selectTalentDelete(@RequestParam("checks") String [] chks) throws Exception {
		for(int i=0; i<chks.length; i++) {
			tService.talentDelete(chks[i]);
		}
		return "redirect:../Admin/bTalent.do";
	}
	
	@RequestMapping("/Admin/inquiryRe.do")
	public String inquiryRe(@RequestParam("no") int no, Model model) throws Exception {
		model.addAttribute("qDto", iService.inquiryView(no));
		model.addAttribute("aDto", iService.inquiryViewByGroupnum(no));
		return "Admin/bInquiryRe";
	}
	
	@RequestMapping("/Admin/inquiryReOK.do")
	public String inquiryReOK(@ModelAttribute("dto") InquiryDTO dto) throws Exception{
		iService.inquiryReOK(dto);
		iService.replyUp(dto.getGroupNum());
		return "redirect:../Admin/bInquiry.do";
	}
	
	@RequestMapping("/Admin/inquiryDelete.do")
	public String inquiryDelete(int no) throws Exception {
		iService.inquiryDelete(no);
		return "redirect:../Admin/bInquiry.do";
	}
	
	@RequestMapping("/Admin/selectInquiryDelete.do")
	public String selectInquiryDelete(@RequestParam("checks") int [] chks) throws Exception {
		for(int i=0; i<chks.length; i++) {
			iService.inquiryDelete(chks[i]);
		}
		return "redirect:../Admin/bInquiry.do";
	}
	
	@RequestMapping("/Admin/reserveAdmin.do")
	public String reserveAdm() throws Exception{
		return "Admin/admReserve";
	}


}

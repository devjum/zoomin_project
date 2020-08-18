package com.zoomin.www.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.zoomin.www.dto.TalentDTO;
import com.zoomin.www.dto.UserDTO;
import com.zoomin.www.reserve.service.ReserveServiceImpl;
import com.zoomin.www.review.service.ReviewServiceImpl;
import com.zoomin.www.talent.service.TalentServiceImpl;
import com.zoomin.www.user.service.UserServiceImpl;

@Controller
public class UserController {

	@Autowired
	private TalentServiceImpl tService;
	
	@Autowired
	private UserServiceImpl uService;
	
	@Autowired
	private ReserveServiceImpl rService;
	
	@Autowired
	private ReviewServiceImpl rvService;
	
	@RequestMapping("/User/join.do")
	public String join() throws Exception {
		return "User/join";
	}
	
	@RequestMapping("/User/joinOK.do")
	public String joinOK(HttpServletRequest request,@ModelAttribute("dto") UserDTO dto) throws Exception {
		uService.joinMember(dto);
		uService.getUserInfo(request,dto.getId());
		return "redirect:../index.do";
	}
	
	@RequestMapping("/User/idCheckOK.do")
	public String idCheck(@RequestParam("id") String id,Model model) throws Exception {
		model.addAttribute("cnt", uService.idCheck(id));
		return "User/idCheckOK";
	}
	
	
	
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request,@RequestParam("returnPath") String returnPath, @ModelAttribute("user") UserDTO userInfo, Model model) throws Exception {
		int result = uService.loginChk(userInfo);
		String urlPath = returnPath.substring(1);
		System.out.println("urlpath:"+urlPath);
		if(result == 1) {
			uService.getUserInfo(request,userInfo.getId());
			if(request.getParameter("no")!=null){
				return "redirect:"+urlPath+"?no="+Integer.parseInt(request.getParameter("no"));
			} else {
				return "redirect:"+urlPath;
			}
		} else {
			if(request.getParameter("no")!=null){
				return "redirect:"+urlPath+"?no="+Integer.parseInt(request.getParameter("no"))+"&loginChk=N&path="+urlPath;
			} else {
				return "redirect:"+urlPath+"?loginChk=N&path="+urlPath;
			}
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userInfo");
		return "redirect:/index.do";
	}
	
	@RequestMapping("/User/dropUser.do")
	public String dropUser(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		UserDTO userInfo = (UserDTO)session.getAttribute("userInfo");
		session.invalidate();
		uService.dropUser(userInfo.getId());
		return "redirect:../index.do";
	}
	
	@RequestMapping("/User/mypage.do")
	public String mypage(HttpServletRequest request,Model model) throws Exception{
		HttpSession session = request.getSession();
		UserDTO userInfo = (UserDTO)session.getAttribute("userInfo");
		if(userInfo==null) {
			return "redirect:../index.do";
		}
		String id = userInfo.getId();
		uService.getUserInfo(request, id);
		if(userInfo.getMember().equals("artist")) {
			model.addAttribute("talentExist",tService.talentExist(id));
			if(tService.talentExist(id)==1) {
				model.addAttribute("t_noByid",tService.getTalentNo(id));
				if(tService.getTalentNo(id)!=0) {
					//공연신청현황리스트
					model.addAttribute("reserveList", rService.listOfArtist(tService.getTalentNo(id)));
				}
			}
			model.addAttribute("reviewList",rvService.talentReview(tService.getTalentNo(id)));
		} else if(userInfo.getMember().equals("general")) {
			model.addAttribute("reserveList", rService.listOfGeneral(id));
		}
		
		//공연후기
		model.addAttribute("completeList", rService.completeReserve(id));
		return "User/mypage";
	}
	
	@RequestMapping("/User/updateImg.do")
	public String updateProfile(HttpServletRequest request, @RequestParam("uploadFile") MultipartFile uploadFile) throws Exception{
		HttpSession session = request.getSession();
		UserDTO userInfo = (UserDTO)session.getAttribute("userInfo");
		userInfo.setFileUpload(uploadFile);
		uService.updateProfile(request,userInfo);
		return "redirect:mypage.do";
	}
	
	@RequestMapping("/User/modifyIn.do")
	public String modifyIn() throws Exception{
		return "User/modifyIn";
	}
	
	@RequestMapping("/User/modifyInOK.do")
	public String modifyInOK(@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2, @RequestParam("phone3") String phone3, @ModelAttribute("user") UserDTO user,Model model) throws Exception {
		uService.modifyInOK(user);
		return "redirect:mypage.do";
	}
	

}

package com.zoomin.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zoomin.www.dto.ReviewDTO;
import com.zoomin.www.review.service.ReviewServiceImpl;
import com.zoomin.www.talent.service.TalentServiceImpl;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewServiceImpl rvService;
	
	@Autowired
	private TalentServiceImpl tService;
	
	@RequestMapping("/Review/reviewWrite.do")
	public String reviewWrite(@RequestParam("t_no") int t_no ,Model model) throws Exception {
		model.addAttribute("tDto",tService.talentView(t_no));
		return "Review/reviewWrite";
	}
	
	@RequestMapping("/Review/reviewWriteOK")
	public String reviewWrtieOK(@ModelAttribute("dto") ReviewDTO dto) throws Exception {
		rvService.reviewWrtie(dto);
		return "redirect:../User/mypage.do";
	}

}

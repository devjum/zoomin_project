package com.zoomin.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zoomin.www.dto.ReserveDTO;
import com.zoomin.www.reserve.service.ReserveServiceImpl;

@Controller
public class ReserveController {

	@Autowired
	private ReserveServiceImpl rService;
	
	@RequestMapping("/Reserve/reserveWrite.do")
	public String reserveWrite() throws Exception {
		return "Reserve/reserveWrite";
	}
	
	@RequestMapping("/Reserve/reserveWriteOK.do")
	public String reserveWriteOK(@ModelAttribute("dto") ReserveDTO dto) throws Exception {
		rService.reserveWriteOK(dto);
		return "redirect:../User/mypage.do";
	}
	
	@RequestMapping("/Reserve/reserveView.do")
	public String reserveView(@RequestParam("no") int no, Model model) throws Exception {
		model.addAttribute("reserveDto" ,rService.reserveView(no));
		return "Reserve/reserveView";
	}
	
	@RequestMapping("/Reserve/reserveConfirm.do")
	public String updateStatus(@ModelAttribute("dto") ReserveDTO dto) throws Exception {
		rService.updateStatus(dto);
		return "redirect:../User/mypage.do";
	}
	
	@RequestMapping("/Reserve/reserveModify.do")
	public String reserveModify(@ModelAttribute("dto") ReserveDTO dto, Model model) throws Exception {
		model.addAttribute("reserveDto", rService.reserveView(dto.getNo()) );
		return "/Reserve/reserveModify";
	}
	
	@RequestMapping("/Reserve/reserveModifyOK.do")
	public String reserveModifyOK(@ModelAttribute("dto") ReserveDTO dto) throws Exception {
		rService.reserveModify(dto);
		return "redirect:../Reserve/reserveView.do?no="+dto.getNo();
	}
	
	@RequestMapping("/Reserve/reserveDelete.do")
	public String reserveDelete(int no) throws Exception {
		rService.reserveDelete(no);
		return "redirect:../User/mypage.do";
	}
	

	
}

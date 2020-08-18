package com.zoomin.www;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.dbcp2.BasicDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zoomin.www.dto.TalentDTO;
import com.zoomin.www.talent.service.TalentServiceImpl;
import com.zoomin.www.user.service.UserServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	private TalentServiceImpl tService;

	@Autowired
	private UserServiceImpl uService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	
	@RequestMapping("/index.do")
	public String index(TalentDTO dto, Model model) throws Exception {
		dto.setPageNo(dto.getCurpage()*10);
		dto.setLimitCnt(10);
		dto.setSearchCondition("searchName");
		if(tService.talentList(dto)!=null) {
			model.addAttribute("list", tService.talentList(dto));
		}
		model.addAttribute("bestArtist",uService.bestArtist());
		return "index";
	}
	
}

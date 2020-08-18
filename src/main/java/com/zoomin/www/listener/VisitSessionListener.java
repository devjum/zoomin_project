package com.zoomin.www.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.zoomin.www.admin.dao.AdminDAO;
import com.zoomin.www.admin.service.AdminServiceImpl;


public class VisitSessionListener implements HttpSessionListener {
	
	
	@Autowired
    AdminServiceImpl aService;
	
	@Override
    public void sessionCreated(HttpSessionEvent hse) {
		if(hse.getSession().isNew()) {
			execute(hse);
		}
    }
	
	public void execute(HttpSessionEvent hse) {
		
        
        try {
        	HttpSession session = hse.getSession();
        	aService.upVisit();
        	session.setAttribute("visitCnt", aService.visitCnt());
        	System.out.println("========방문자 카운터 실행========");
        } catch (Exception e) {
        	System.out.println("========방문자 카운터 오류========");
               e.printStackTrace();
          }
	}
 
     @Override
     public void sessionDestroyed(HttpSessionEvent arg0) {
      // TODO Auto-generated method stub

     }
}


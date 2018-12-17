package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnf.DAO.MemberDAO;
import com.fnf.DTO.MemberDTO;

public class MemberUpdatePlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "";
		System.out.println("POST!!!!!");		

		HttpSession session = request.getSession();	
				
		// View 단에서 전송한 데이터를 받음		
		String mid = request.getParameter("emailid");
		String mnick = request.getParameter("nickname");		
		String mpw = request.getParameter("mpw");				
		String mphone = request.getParameter("phone");
		String mzipcode = request.getParameter("postcode1");
		String maddr = request.getParameter("address1");
		String maddrdetail = request.getParameter("address2");		
		
		MemberDTO mDto = new MemberDTO(mid, mnick, mpw, mphone, mzipcode, maddr, maddrdetail);
				
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.updateMember(mDto);		
		
		System.out.println("===> " + mDto.toString());
							
		if(result > 0) {
			url = "changeok.bizpoll";	// success.jsp			
		} else {
			url = "myinfo.bizpoll";	
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}
}
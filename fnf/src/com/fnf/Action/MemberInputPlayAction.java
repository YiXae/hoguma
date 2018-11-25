package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnf.DAO.MemberDAO;
import com.fnf.DTO.MemberDTO;

public class MemberInputPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "";
		System.out.println("POST!!!!!");		

		HttpSession session = request.getSession();	
				
		// View 단에서 전송한 데이터를 받음
		String mid = request.getParameter("email");		
		String mnick = request.getParameter("nickname");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("name");
		String mbirth = request.getParameter("birth");
		String mgender = request.getParameter("gender_info");
		String mphone = request.getParameter("phone");
		String mzipcode = request.getParameter("postcode1");
		String maddr = request.getParameter("address1");
		String maddrdetail = request.getParameter("address2");		
		String myakyn = (String)session.getAttribute("agreement1");
		String mpraviteyn = (String)session.getAttribute("agreement2");
		String mlocyn = (String)session.getAttribute("agreement3");
		String mmailingyn = (String)session.getAttribute("agreement4");		
					
		MemberDTO mDto = new MemberDTO(mid, mnick, mpw, mname, mbirth, mgender, mphone, mzipcode, maddr, maddrdetail, myakyn, mpraviteyn, mlocyn, mmailingyn);
				
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.inputMember(mDto);		
							
		if(result > 0) {
			url = "welcome.bizpoll";		
		} else {
			url = "inputmemberinfo.bizpoll";	
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}
}
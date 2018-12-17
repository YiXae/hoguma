package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InputInfoAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "inputmemberinfo.jsp";	
		
		HttpSession session = request.getSession();
		
		String yak = request.getParameter("checkOne");
		String pravite = request.getParameter("checkTwo");
		String loc = request.getParameter("checkThree");
		String mailing = request.getParameter("checkFour");
		
		String myakyn = "";
		String mpraviteyn = "";
		String mlocyn = "";
		String mmailingyn = "";
		
		System.out.println(yak + ", " + pravite + ", " + loc + ", " + mailing);
		
		if(yak != null) {
			myakyn = "y";
		} 
		
		if(pravite != null) {
			mpraviteyn = "y";
		} 
		
		if(loc != null) {
			mlocyn = "y";
		} else {
			mlocyn = "n";
		}
		
		if(mailing != null) {
			mmailingyn = "y";
		} else {
			mmailingyn = "n";
		}
		
		System.out.println(myakyn + ", " + mpraviteyn + ", " + mlocyn + ", " + mmailingyn);
		
		session.setAttribute("agreement1", myakyn);
		session.setAttribute("agreement2", mpraviteyn);
		session.setAttribute("agreement3", mlocyn);
		session.setAttribute("agreement4", mmailingyn);
				
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
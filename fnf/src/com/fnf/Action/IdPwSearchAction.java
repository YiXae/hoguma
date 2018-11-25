package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdPwSearchAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url ="idpwsearch.jsp";
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);		//gotowninfo.jsp로 이동
		forward.setRedirect(false); //forward방식을 사용
		
		return forward;
	}

}
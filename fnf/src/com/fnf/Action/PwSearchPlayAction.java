package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.fnf.DAO.MemberDAO;
import com.fnf.DTO.MemberDTO;

public class PwSearchPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("POST!!!!!");
		HttpSession session = request.getSession();
		
		// View 단에서 전송한 데이터를 받음
		String mid = request.getParameter("id");
		String mphone = request.getParameter("phone");
		System.out.println(mid + ", " + mphone);			
				
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.pwSearch(mid, mphone);
				
		String message = null;
		
		if(mDto != null) {			
			message = "-1";
		} else {
			message = "1";
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("message", message);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null;
	}

}
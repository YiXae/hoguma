package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.fnf.DAO.MemberDAO;
import com.fnf.DTO.MemberDTO;

public class LoginPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("POST!!!!!");
		HttpSession session = request.getSession();
		
		// View 단에서 전송한 데이터를 받음
		String mid = request.getParameter("id");
		String mpw = request.getParameter("pw");
		System.out.println(mid + ", " + mpw);			
				
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.loginCheck(mid, mpw);
				
		String message = null;
		
		if(mDto != null) { // 로그인 성공
			// session 값에 login 된 회원 정보를 담아야 함
			session.removeAttribute("mid"); // 혹시 모를 기존의 남아있는 값을 제거
			session.setAttribute("loginUser", mDto);
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
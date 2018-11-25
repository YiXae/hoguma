package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.fnf.DAO.MemberDAO;

public class NickCheckAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String mnick = request.getParameter("nick");
		System.out.println("nick :" + mnick);
		
		if(mnick != null) {
			if(mnick.trim().equals("") == false) {
				MemberDAO mDao = MemberDAO.getInstance();
				String msg = mDao.confirmNick(mnick);
				/* Ajax => Json방식 => 값을 다시 전달 Json방식 */
				/* request.setAttribute("idCount", msg); */
				// json-simple 라이브러리 필요				
				
				JSONObject jObj = new JSONObject();
				jObj.put("message", msg);				
				//Json 객체에 담는 데이터를 호출한 페이지로 전송하는 기능
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(jObj);
			}
		}
		return null;
	}
	
}

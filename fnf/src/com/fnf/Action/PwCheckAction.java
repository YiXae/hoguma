package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.fnf.DAO.MemberDAO;

public class PwCheckAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				
		String mid = request.getParameter("id");
		String mpw = request.getParameter("pw");
		
		System.out.println("id:" + mid + ", " + "pw:" + mpw);
		
		if(mid != null && mpw != null) {
			
			if(mid.trim().equals("")== false && mpw.trim().equals("")== false) {
				MemberDAO mDao = MemberDAO.getInstance();
				String msg = mDao.confirmPW(mid, mpw);
				System.out.println(msg);
				
				JSONObject jObj = new JSONObject();
				jObj.put("message", msg);				
		
				//Json 객체에 담는 데이터를 호출한 페이지로 전송하는 기능
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(jObj);
			}
		}		
		return null; // forward로 페이지 이동하지 않기 위해 null을 반드시 입력
	}
}
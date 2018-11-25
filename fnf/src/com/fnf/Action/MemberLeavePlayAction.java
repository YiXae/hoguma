package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnf.DAO.MemberDAO;

public class MemberLeavePlayAction implements Action {
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "";
		
		HttpSession session = request.getSession();

		String mid = request.getParameter("delid");
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.delID(mid);	
		
		if(result > 0) { // 회원탈퇴 성공
			url = "goodbye.bizpoll";  // 탈퇴성공 페이지 만들기
			// session 값을 최신 정보로 수정
			session.removeAttribute("loginUser");
	
		} else { // 비밀번호 수정 실패
			url = "myinfo.bizpoll";	
		}	
				
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;			
	}
}
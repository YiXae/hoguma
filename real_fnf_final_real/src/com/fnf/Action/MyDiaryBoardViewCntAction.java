package com.fnf.Action;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnf.DAO.BoardDAO;

public class MyDiaryBoardViewCntAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		System.out.println("===> " + bno);

		BoardDAO bDao = BoardDAO.getInstance();
		
		Date today = new Date();
		request.setAttribute("today", today);
		
		/*조회수1증가
		session을 활용한 조회수 증가 방지*/
		HttpSession countSession = request.getSession();
		bDao.viewCnt(bno, countSession);		

		String url = "mydiary_detail.bizpoll?bno="+bno;
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);		//index.jsp로 이동
		forward.setRedirect(true); //forward방식을 사용
		
		return forward;
	}

}
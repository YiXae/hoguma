package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.DAO.BoardDAO;
import com.fnf.DAO.ReplyDAO;

public class MyDiaryReplyDeleteAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		// 댓글 삭제
		ReplyDAO rDao = ReplyDAO.getInstance();
		rDao.replyDelete(rno);
		 
		
		// 게시판 테이블 replycnt - 1
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.boardReplyCntMinus(bno);
		
		return null;	
	}

}
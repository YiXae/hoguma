package com.fnf.Action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.DAO.ReplyDAO;
import com.fnf.DTO.ReplyDTO;

public class MyDiaryCommentListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url ="mydiary_commentlist.jsp";
		
		int bno = Integer.parseInt(request.getParameter("bno"));			
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		List<ReplyDTO> replyList = rDao.replyListAll(bno);
	
		request.setAttribute("replyList", replyList);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;	
	}
	
}
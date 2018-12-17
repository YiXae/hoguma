package com.fnf.Action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.Common.Constants;
import com.fnf.DAO.BoardDAO;
import com.fnf.DAO.ReplyDAO;

public class BoardDeletePlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url ="mydiary.bizpoll?opentab=c";
		
		int bno = Integer.parseInt(request.getParameter("bno_tran"));
		String bfilename = request.getParameter("bfile_tran");
		String tabnum = request.getParameter("opentab");
		
		System.out.println("bno : " + bno + ", bfilename : " + bfilename);		

		// 댓글 삭제
		ReplyDAO rDao = ReplyDAO.getInstance();
		rDao.replyDeleteAll(bno);
				
		// 첨부파일 삭제			
		if(!bfilename.equals("-")) {
			File file = new File(Constants.UPLOAD_PATH + bfilename);
			file.delete();
		}
				
		// 게시글 삭제
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.boardDelete(bno);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}
}

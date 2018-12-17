package com.fnf.Action;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.DAO.BoardDAO;
import com.fnf.DAO.ReplyDAO;

public class MyDiaryListDeleteAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String[] param = request.getParameterValues("checkArray");
		
		int[] num = Arrays.asList(param).stream().mapToInt(Integer::parseInt).toArray();		
		
		int i = 0;	
		
		try {
			for(i = 0; i < num.length; i++) {
				
				System.out.println("배열로 가져오냐? " + num[i]);
				int bno = num[i];
				
				// 댓글 삭제
				ReplyDAO rDao = ReplyDAO.getInstance();
				rDao.replyDeleteAll(bno);						
								
				// 게시판 리스트 삭제
				BoardDAO bDao = BoardDAO.getInstance();
				bDao.boardDelete(bno);	
			}
				
		} catch(Exception e) {
			 e.printStackTrace();
		}			
		
		return null;	
	}

}
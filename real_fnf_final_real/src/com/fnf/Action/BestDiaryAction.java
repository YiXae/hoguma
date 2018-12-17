package com.fnf.Action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.DAO.BoardDAO;
import com.fnf.DTO.BoardDTO;
import com.fnf.DTO.CriteriaDTO;
import com.fnf.DTO.PageMakerDTO;

public class BestDiaryAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url ="bestdiary.jsp";
		String tabnum = request.getParameter("opentab");
		
		String a = "a";
		String b = "b";	
		String bitem = "";
		String bopen = "";
		
		//현재날짜 출력
		Date today = new Date();
		request.setAttribute("today", today);
		System.out.println("오늘은 : " + today);
				
		CriteriaDTO criDto = new CriteriaDTO();		
			
		BoardDAO bDao = BoardDAO.getInstance();
			
		//게시글 목록(정보들) 출력			
		if(tabnum.equals(a)) {
			bitem = "농산물";	
			bopen = "공개";

		} else if(tabnum.equals(b)) {			
			bitem = "수산물";
			bopen = "공개";

		}
				
		criDto.setBitem(bitem);
		criDto.setBopen(bopen);
		request.setAttribute("bitem", bitem);
		request.setAttribute("bopen", bopen);
		
		List<BoardDTO> boardListBest = bDao.boardListBest(criDto);
		
		request.setAttribute("boardListBest", boardListBest);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		return forward;
	}
}
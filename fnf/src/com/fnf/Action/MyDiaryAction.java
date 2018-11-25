package com.fnf.Action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.DAO.BoardDAO;
import com.fnf.DAO.ReplyDAO;
import com.fnf.DTO.BoardDTO;
import com.fnf.DTO.CriteriaDTO;
import com.fnf.DTO.PageMakerDTO;
import com.fnf.DTO.ReplyDTO;

public class MyDiaryAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		String url = "mydiary.jsp";	
		String tabnum = request.getParameter("opentab");
		
		String c = "c";
		String d = "d";
		String e = "e";	
		String bitem = "";
		String bopen = "";
		int page = 1;
		
		//현재날짜 출력
		Date today = new Date();
		request.setAttribute("today", today);
		System.out.println("오늘은 : " + today);
				
		CriteriaDTO criDto = new CriteriaDTO();		
	
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			
			System.out.println("페이지가 변경되면 : " + page);
		}
		
		String listpage = request.getParameter("page");
		System.out.println("listpage : " + listpage);
		
		System.out.println("========");		
		
		criDto.setPage(page);
		
		String code="new";
		if(request.getParameter("key") !=null) {
			code = request.getParameter("key");
		}
		criDto.setCode(code);
		request.setAttribute("code", code); //키값 주고 받음
		
		String flag = null;
		String keyword = null;
		
		if(request.getParameter("keyword") != null) {
			
			System.out.println("====>게시글 검색 기능 작동 !!!!!! ");
			
			flag = request.getParameter("flag");
			keyword = request.getParameter("keyword");
			criDto.setFlag(flag);
			criDto.setKeyword(keyword);			
			
			System.out.println(page+","+flag+","+keyword);
			
			request.setAttribute("flag", flag);
			request.setAttribute("keyword", keyword);
		}
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		System.out.println(criDto.getPageStart());
		System.out.println(criDto.getPerPageNum());
		
		//게시글 목록(정보들) 출력
		if(tabnum.equals(c)) {	
			
		} else if(tabnum.equals(d)) {
			bitem = "농산물";	
			bopen = "공개";			
		} else if(tabnum.equals(e)) {			
			bitem = "수산물";
			bopen = "공개";			
		}
				
		criDto.setBitem(bitem);
		criDto.setBopen(bopen);
		request.setAttribute("bitem", bitem);
		request.setAttribute("bopen", bopen);
		
		List<BoardDTO> boardList = bDao.boardListItem(criDto);
		
		System.out.println(boardList.toString());
		
		request.setAttribute("boardList", boardList);
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		int totalcount = bDao.totalCount(criDto);
		
		pageMaker.setTotalCount(totalcount);
		request.setAttribute("pageMaker", pageMaker);
			
		System.out.println("=============================");
		System.out.println(pageMaker.toString());		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		return forward;
	}

}

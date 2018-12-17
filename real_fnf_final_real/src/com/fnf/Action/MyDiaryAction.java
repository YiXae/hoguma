package com.fnf.Action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fnf.DAO.BoardDAO;
import com.fnf.DAO.MemberDAO;
import com.fnf.DAO.ReplyDAO;
import com.fnf.DTO.BoardDTO;
import com.fnf.DTO.CriteriaDTO;
import com.fnf.DTO.MemberDTO;
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
		String bitem = null;
		String bwriter = null;		
		int page = 1;
		
		HttpSession session = request.getSession();
		MemberDTO mDto = (MemberDTO) session.getAttribute("loginUser");
		String mnick = "";
		
		if(mDto != null) {
			mnick = mDto.getMnick();
			System.out.println("별명 : "+mnick);
		}
		
		//현재날짜 출력
		Date today = new Date();
		request.setAttribute("today", today);
				
		CriteriaDTO criDto = new CriteriaDTO();		
	
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String listpage = request.getParameter("page");
		
		criDto.setPage(page);
		
		String code="new";
		if(request.getParameter("key") != null) {
			code = request.getParameter("key");
		}
		
		criDto.setCode(code);
		request.setAttribute("code", code); //키값 주고 받음
		
		String flag = null;
		String keyword = null;		
		
		if(request.getParameter("keyword") != "") {				

			flag = request.getParameter("flag");
			keyword = request.getParameter("keyword");
			
			criDto.setFlag(flag);
			criDto.setKeyword(keyword);				
			request.setAttribute("flag", flag);
			request.setAttribute("keyword", keyword);
		}
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		String bopen = "all";
		if(request.getParameter("bopen") != null) {
			bopen = request.getParameter("bopen");
		}
		
		criDto.setBopen(bopen);
		request.setAttribute("bopen", bopen); //키값 주고 받음
		
		String bkind = "all";
		if(request.getParameter("bkind") != null) {
			bkind = request.getParameter("bkind");
		}
		
		criDto.setBkind(bkind);
		request.setAttribute("bkind", bkind); //키값 주고 받음
		
		String bregdate = "all";
		if(request.getParameter("bregdate") != null) {
			bregdate = request.getParameter("bregdate");
		}
		
		criDto.setBregdate(bregdate);
		request.setAttribute("bregdate", bregdate); //키값 주고 받음
		
		//게시글 목록(정보들) 출력
		if(tabnum.equals(c)) {	
			bwriter = mnick;
			
			criDto.setBwriter(bwriter);
			criDto.setMnick(mnick);
			request.setAttribute("bwriter", bwriter);
			request.setAttribute("mnick", mnick);
			
			List<BoardDTO> boardList = bDao.boardListMy(criDto);
			
			request.setAttribute("boardList", boardList);
			
			PageMakerDTO pageMakermy = new PageMakerDTO();
			pageMakermy.setCriDto(criDto);
			
			int totalcount = bDao.totalCountMy(criDto);
			
			pageMakermy.setTotalCount(totalcount);
			request.setAttribute("pageMakermy", pageMakermy);
			
			if(mDto != null) {
				MemberDAO mDao = MemberDAO.getInstance();
				MemberDTO myintro = mDao.myIntroInfo(mnick);
				
				System.out.println("bbbbbbbbb여기왔냐");					
				System.out.println(myintro.toString());			
				
				request.setAttribute("myintro", myintro);
				
				String maddr = myintro.getMaddr();
				
				String addr[] = maddr.split(" ");
		        
		        for(int i = 0 ; i < addr.length ; i++) {
		        	System.out.println("addr["+i+"] : " + addr[i]);
		        }
					
				String maddrsimple = addr[0] + " " + addr[1];
				
				myintro.setMaddr(maddrsimple);
			}
			
		} else if(tabnum.equals(d)) {
			bitem = "농산물";	
			bopen = "공개";
			
			criDto.setBitem(bitem);
			criDto.setBopen(bopen);
			request.setAttribute("bitem", bitem);
			request.setAttribute("bopen", bopen);
			
			List<BoardDTO> boardList = bDao.boardListRural(criDto);
			
			request.setAttribute("boardList", boardList);
			
			PageMakerDTO pageMakerrural = new PageMakerDTO();
			pageMakerrural.setCriDto(criDto);
			
			int totalcount = bDao.totalCountRural(criDto);			

			pageMakerrural.setTotalCount(totalcount);
			request.setAttribute("pageMakerrural", pageMakerrural);

		} else if(tabnum.equals(e)) {			
			bitem = "수산물";
			bopen = "공개";
			
			criDto.setBitem(bitem);
			criDto.setBopen(bopen);
			request.setAttribute("bitem", bitem);
			request.setAttribute("bopen", bopen);
			
			List<BoardDTO> boardList = bDao.boardListFish(criDto);
			
			request.setAttribute("boardList", boardList);
			
			PageMakerDTO pageMakerfish = new PageMakerDTO();
			pageMakerfish.setCriDto(criDto);
			int totalcount = bDao.totalCountFish(criDto);
			
			pageMakerfish.setTotalCount(totalcount);
			request.setAttribute("pageMakerfish", pageMakerfish);			

		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		return forward;
	}

}

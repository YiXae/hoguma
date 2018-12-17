package com.fnf.Action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.DAO.BoardDAO;
import com.fnf.DAO.MemberDAO;
import com.fnf.DAO.ReplyDAO;
import com.fnf.DTO.BoardDTO;
import com.fnf.DTO.CriteriaDTO;
import com.fnf.DTO.MemberDTO;

public class IndexAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url ="index.jsp";

		String bitem = "";
		String bopen = "";
		
		//현재날짜 출력
		Date today = new Date();
		request.setAttribute("today", today);
		System.out.println("오늘은 : " + today);	
		
		CriteriaDTO criDto = new CriteriaDTO();		
			
		BoardDAO bDao = BoardDAO.getInstance();						

		criDto.setBitem(bitem);
		criDto.setBopen(bopen);
		request.setAttribute("bitem", bitem);
		request.setAttribute("bopen", bopen);
			
		List<BoardDTO> bestrurallist = bDao.bestRuralList(criDto);				
		
		BoardDTO writer1 = bestrurallist.get(0);
		
		for(int i = 0; i < bestrurallist.size(); i++) {
			
			writer1 = bestrurallist.get(i);
			
			String bwriter = writer1.getBwriter();
			String mnick = bwriter;
			
			MemberDAO mDao = MemberDAO.getInstance();		
			String mphoto = mDao.memberPhoto(mnick);
			
			writer1.setMphoto(mphoto);
		
			bestrurallist.set(i, writer1);
			
		}		

		request.setAttribute("bestrurallist", bestrurallist);
		
		List<BoardDTO> bestfishlist = bDao.bestFishList(criDto);
		
		BoardDTO writer2 = bestfishlist.get(0);
		
		for(int i = 0; i < bestfishlist.size(); i++) {
			
			writer2 = bestfishlist.get(i);
			
			String bwriter = writer2.getBwriter();
			String mnick = bwriter;
			
			MemberDAO mDao = MemberDAO.getInstance();		
			String mphoto = mDao.memberPhoto(mnick);
			
			writer2.setMphoto(mphoto);
		
			bestfishlist.set(i, writer2);
			
		}		

		request.setAttribute("bestfishlist", bestfishlist);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		return forward;
	}
}
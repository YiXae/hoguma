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
import com.fnf.DTO.ReplyDTO;

public class MyDiaryDetailAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		
		String url = "mydiary_detail.jsp";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		System.out.println("==>"+ bno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = bDao.boardDetailView(bno);
		
		request.setAttribute("boardview", bDto);
		
		String bkind = bDto.getBkind();		
		
		if(bkind.equals("생산일지")) {
			String bbirth = bDto.getBpbirth();
			
			System.out.println("생산일? " + bbirth);
			
			String bbirth1 = bbirth.substring(0, 4);
			String bbirth2 = bbirth.substring(4, 6);
			String bbirth3 = bbirth.substring(6, 8);

			String bpbirthnew = bbirth1 + "년 " + bbirth2 + "월 " + bbirth3 + "일";
			
			System.out.println("생산일 : " + bpbirthnew);
			
			bDto.setBpbirth(bpbirthnew);
			
			String bpplace = bDto.getBpplace();
			
			String place[] = bpplace.split(" ");
	        
	        for(int i = 0 ; i < place.length ; i++) {
	        	System.out.println("place["+i+"] : " + place[i]);
	        }
				
			String bpplacesimple = place[0] + " " + place[1];
			
			System.out.println("생산지 : " + bpplacesimple);
			
			bDto.setBpplace(bpplacesimple);			
			
		}
				
		ActionForward forward = new ActionForward();
		forward.setPath(url);		//index.jsp로 이동
		forward.setRedirect(false); //forward방식을 사용
		
		return forward;
	}

}
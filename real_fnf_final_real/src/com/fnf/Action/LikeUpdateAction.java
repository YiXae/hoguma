package com.fnf.Action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.fnf.DAO.BoardDAO;
import com.fnf.DTO.BoardDTO;
import com.fnf.DTO.LikeDTO;
import com.fnf.DTO.MemberDTO;

public class LikeUpdateAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		
	
		int bno = Integer.parseInt(request.getParameter("bno"));		
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		Map<String, Object> m = new HashMap<>();
		m.put("bno", bno);
		m.put("mno", mno);
		
		BoardDAO bDao = BoardDAO.getInstance();
		// 동일 게시글에 대한 이전 추천 여부 검색
		int result = bDao.recCheck(m);
		
		if(result == 0){ // 추천하지 않았다면 추천 추가
			bDao.recUpdate(m);
			
		}else{ // 추천을 하였다면 추천 삭제
			bDao.recDelete(m);
		}
		return null;
	}

}
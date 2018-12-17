package com.fnf.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.fnf.DAO.BoardDAO;

public class LikeCountAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		Map<String, Object> m = new HashMap<>();
		m.put("bno", bno);
		m.put("mno", mno);
		
		// 게시글 총 추천수를 구함
		BoardDAO bDao = BoardDAO.getInstance();
		int count = bDao.recCount(bno);
		
		// 동일 게시글에 대한 이전 추천 여부 검색
		int status = bDao.recCheck(m);
		JSONObject jObj = new JSONObject();
		
		// 뷰페이지에 추천수를 출력하도록 하는 역할
		jObj.put("count", count); // 총추천수
		jObj.put("status", status); // 추천했었는지 여부
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null;
	}
}
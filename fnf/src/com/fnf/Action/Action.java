package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
//	Action: 인터페이스
	
	// 추상메서드 : 
	// 꼭 사용해야 할 때 추상메서드로 만듬
	// forward, sendRedirect 결정 => ActionForward
	public ActionForward excute(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException;
}

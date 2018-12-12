package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.DAO.ProductDAO;
import com.fnf.DTO.ProductDTO;
import com.fnf.DTO.YearTempCropDTO;
import java.util.List;

public class RuralAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("--RuralAction 시작");
		
		String url ="rural.jsp";
		
		if(request.getParameter("region")!=null) { // 검색을 실행해서 온 경우
			String region = request.getParameter("region");
			String name = request.getParameter("name");
			String year = request.getParameter("year");
			System.out.println("region:"+region+",name:"+name+",year"+year);
			
			ProductDAO pDAO = ProductDAO.getInstance();
			
			// 그래프로 띄울 정보
			List<YearTempCropDTO> list = pDAO.selectForGraph(region, name, year);
			
			for (YearTempCropDTO yearTempCropDTO : list) {
				System.out.println(yearTempCropDTO);
			}
			
			request.setAttribute("listToGraph", list);
			
			// 지도에 띄울 정보
			ProductDTO pDTO = pDAO.oneYearAll(name);
			System.out.println(pDTO);
			request.setAttribute("ProductDTO", pDTO);
		} 
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);		//index.jsp로 이동
		forward.setRedirect(false); //forward방식을 사용
		System.out.println("--RuralAction 끝");
		return forward;
	}

}

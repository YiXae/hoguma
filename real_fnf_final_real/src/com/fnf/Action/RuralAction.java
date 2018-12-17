package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.DAO.MapDAO;
import com.fnf.DAO.ProductDAO;
import com.fnf.DTO.MapDTO;
import com.fnf.DTO.ProductDTO;
import com.fnf.DTO.YearTempCropDTO;

import java.util.Arrays;
import java.util.List;

public class RuralAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("--RuralAction 시작");
		String url ="rural.jsp";

		String radioval = request.getParameter("radioval");
		System.out.println("radioval:"+radioval);
		if(radioval!=null) {
			if(radioval.equals("gover")) { // 생산정보 검색을 실행해서 온 경우
				String region = request.getParameter("region");
				String regionkor = request.getParameter("regionkor");
				String name = request.getParameter("name");
				String year = request.getParameter("year");
				System.out.println("region:"+region+",name:"+name+",year:"+year);
				request.setAttribute("regionkor", regionkor);
				
				ProductDAO pDAO = ProductDAO.getInstance();
				
				// 그래프로 띄울 정보
				List<YearTempCropDTO> list = pDAO.selectForGraph(region, name, year);
				
//				for (YearTempCropDTO yearTempCropDTO : list) {
//					System.out.println(yearTempCropDTO);
//				}
//				
				request.setAttribute("listToGraph", list);
				
				// 지도에 띄울 정보
				ProductDTO pDTO = pDAO.oneYearAll(name);
				System.out.println(pDTO);
				request.setAttribute("ProductDTO", pDTO);
				int[] arr = {pDTO.getSeoul(), pDTO.getBusan(), pDTO.getChungcheongbuk(), pDTO.getChungcheongnam(), pDTO.getDaegu(),
						pDTO.getDaejeon(), pDTO.getGangwon(), pDTO.getGyeonggi(), pDTO.getGyeongsangbuk(), pDTO.getGyeongsangnam(),
						pDTO.getIncheon(), pDTO.getJeju(), pDTO.getJeollabuk(), pDTO.getJeollanam(), pDTO.getSejong(), pDTO.getulsan(),
						pDTO.getGwangju()};
				Arrays.sort(arr);
				int min = arr[0];
				int max = arr[arr.length-1];
				request.setAttribute("min", min);
				request.setAttribute("max", max);
				System.out.println("min:"+min+",max:"+max);
				
			}  else if(radioval.equals("user")) { // 생산일지 검색을 실행해서 온 경우
				MapDAO mDao = MapDAO.getInstance();
				
				List<MapDTO> mapList = mDao.mapView();
				
				for (MapDTO mapDTO : mapList) {
					if(mapDTO.getBpplace() != null) {
						
						String getaddr=mapDTO.getBpplace();
						
						
						System.out.println("===============getaddr");
						System.out.println(getaddr);
						
						String addr[] = getaddr.split(" ");
					         
					         for(int i = 0 ; i < addr.length ; i++) {
					          System.out.println("addr["+i+"] : " + addr[i]);
					         }
					    
					   String address = addr[0] + " " + addr[1] + " " + addr[2];
					   System.out.println(address);
					   mapDTO.setBpplace(address);
					}
					
				}

				
				request.setAttribute("mapList", mapList);
				
				
			}
		}
		
		request.setAttribute("radioval", radioval);
		ActionForward forward = new ActionForward();
		forward.setPath(url);		//index.jsp로 이동
		forward.setRedirect(false); //forward방식을 사용
		System.out.println("--RuralAction 끝");
		return forward;
	}

}

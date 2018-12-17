package com.fnf.Action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.fnf.DAO.MemberDAO;
import com.fnf.DTO.MemberDTO;

public class MyInfopopAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
			
		String bwriter = request.getParameter("bwriter");
		String mnick = bwriter;
			
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.myIntroInfo(mnick);
		
		String maddr1 = mDto.getMaddr();	
		
		String place[] = maddr1.split(" ");
        
        for(int i = 0 ; i < place.length ; i++) {
        	System.out.println("place["+i+"] : " + place[i]);
        }
			
		String maddr = place[0] + " " + place[1];
		
		mDto.setMaddr(maddr);
		
		String idopen = mDto.getMidopen();
		String mid = mDto.getMid();
		
		if(idopen.equals("y")) {
			String midopen = mid;
			mDto.setMidopen(midopen);
		} else if(idopen.equals("n")) {
			String midopen = "비공개";
			mDto.setMidopen(midopen);
		} else {
			String midopen = "비공개";
			mDto.setMidopen(midopen);
		}
		
		String phoneopen = mDto.getMphoneopen();
		String mphone = mDto.getMphone();
		
		if(phoneopen.equals("y")) {
			String mphoneopen1 = mphone;
			
			String phone1 = mphoneopen1.substring(0, 3);
			String phone2 = mphoneopen1.substring(3, mphoneopen1.length()-4);
			String phone3 = mphoneopen1.substring(mphoneopen1.length()-4, mphoneopen1.length());
			
			String mphoneopen = phone1 + "-" + phone2 + "-" + phone3;		
			
			mDto.setMphoneopen(mphoneopen);
		} else if(idopen.equals("n")) {
			String mphoneopen = "비공개";
			mDto.setMphoneopen(mphoneopen);
		} else {
			String mphoneopen = "비공개";
			mDto.setMphoneopen(mphoneopen);
		}
		
		String job = mDto.getMjob();
				
		if(job.equals("")) {
			String mjob = "일반";
			mDto.setMjob(mjob);
		} 	
		
		JSONObject jObj = new JSONObject();
		
		jObj.put("mnick", mDto.getMnick());
		jObj.put("mphoto", mDto.getMphoto());
		jObj.put("maddr", mDto.getMaddr());
		jObj.put("midopen", mDto.getMidopen());
		jObj.put("mphoneopen", mDto.getMphoneopen());
		jObj.put("mjob", mDto.getMjob());
		jObj.put("mintro", mDto.getMintro());
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		return null;	
	}
}
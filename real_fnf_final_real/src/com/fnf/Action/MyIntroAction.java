package com.fnf.Action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fnf.Common.ConstantsMy;
import com.fnf.DAO.MemberDAO;
import com.fnf.DTO.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MyIntroAction implements Action {
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		File uploadDir = new File(ConstantsMy.UPLOAD_PATH);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdir(); 
		}		
		
		MultipartRequest multi = new MultipartRequest(request,     			  
													  ConstantsMy.UPLOAD_PATH, 
													  ConstantsMy.MAX_UPLOAD, 
													  "UTF-8",
													  new DefaultFileRenamePolicy());
		
		String mphoto = multi.getParameter("ex_file");
		String midopen = multi.getParameter("emailopen");
		String mphoneopen = multi.getParameter("phoneopen");
		String mjob = multi.getParameter("doing");
		String mintro = multi.getParameter("contents");
		String mnick = multi.getParameter("moreinfonick");
		int mfilesize = 0;
		
		System.out.println("==> 별명 : " + mnick);
		System.out.println("==> 자기소개 : " + mintro);		
	
		try {
			Enumeration files = multi.getFileNames();
			
			while(files.hasMoreElements()) {
				String file1 = (String)files.nextElement();
				mphoto =multi.getFilesystemName(file1);
				File f1 = multi.getFile(file1);
				
				if(f1 !=null) {
					mfilesize = (int)f1.length();
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		if(mphoto == null || mphoto.trim().equals("")) {
			mphoto ="-";
		}
	
		MemberDAO mDao = MemberDAO.getInstance();
		
		MemberDTO mDto = new MemberDTO(mnick, mphoto, midopen, mphoneopen, mjob, mintro, mfilesize); //파일자체가 들어가는게 아니라 이름만 들어가있는 거임 		
		int result = mDao.inputMembermore(mDto);
		
		System.out.println("zzzzzz여기왔냐");
		System.out.println(mDto.toString());
		
		if(result > 0) {
			System.out.println("등록성공");
		} else {
			System.out.println("등록실패");
		}
		
		return null;	
	}
}
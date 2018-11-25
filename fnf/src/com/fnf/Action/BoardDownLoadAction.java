package com.fnf.Action;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fnf.Common.Constants;

public class BoardDownLoadAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="";
		
		String bfilename = request.getParameter("file");
		System.out.println("파일이름 :"+ bfilename);
		
		String path = Constants.UPLOAD_PATH+bfilename;
		//D:\\upload\\첨부된파일명		
		
		byte b []= new byte[4096]; //바이트 배열 생성 
		
		//서버에 저장된 파일을 읽기 위한 스트림 생성
		FileInputStream fis = new FileInputStream(path);
		
		//파일의 종류(mimeType) 파일을 다운로드 할때 주로 사용 
		String mimeType = request.getServletContext().getMimeType(path);
		if(mimeType == null) {
			mimeType = "application/octet-stream; charset=utf-8"; //기본형식
		}
		
		//파일 이름에 한글이 포함된 경우 
		//new String(바이트배열, 변환할 인코딩)8859_1 서유럽 언어
		//header에 특수문자 사용 못함, 서유럽언어로 변환 
		bfilename = new String(bfilename.getBytes("utf-8"),"8859_1");
		
		//http header
		response.setHeader("content-Disposition", "attachment;filename="+ bfilename);
		
		//http body
		//outputStream 생성(서버에서 클라이언트에 쓰기)
		ServletOutputStream out = response.getOutputStream();
		
		//실질적으로 파일을 다운로드 해주는 코드
		//파일이 35,000byte => 한번에 다운로드 불가능 
		//3,000 byte 8번 반복해서 전송
		int numRead;
		while(true) {
			//4096 byte로 쪼개서 파일 읽어오기 
			numRead = fis.read(b,0, b.length);
			if(numRead ==-1) break; //더이상 쪼개서 보낼게 없으면 -1값을 보내줌
			out.write(b,0, numRead);
		}
		//파일 처리 관련 리소스 정리 
		fis.close();
		out.flush();
		out.close();
		return null;
	}

}
